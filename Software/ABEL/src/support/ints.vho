-- VHDL netlist for ints
-- Date: Sun Sep 25 20:40:02 2016
-- Copyright (c) Lattice Semiconductor Corporation
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY PGBUFI_ints IS 
    GENERIC (
        TRISE : TIME := 1 ns;
        TFALL : TIME := 1 ns
    );
    PORT (
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
END PGBUFI_ints;

ARCHITECTURE behav OF PGBUFI_ints IS 
BEGIN

    PROCESS (A0)
    VARIABLE ZDF : std_logic;
    BEGIN
        ZDF :=  A0;
        if ZDF ='1' then
            Z0 <= transport ZDF after TRISE;
        elsif ZDF ='0' then
            Z0 <= transport ZDF after TFALL;
        else
            Z0 <= transport ZDF;
        end if;
    END PROCESS;
END behav;

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY PGXOR2_ints IS 
    GENERIC (
        TRISE : TIME := 1 ns;
        TFALL : TIME := 1 ns
    );
    PORT (
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
END PGXOR2_ints;

ARCHITECTURE behav OF PGXOR2_ints IS 
BEGIN

    PROCESS (A1, A0)
    VARIABLE ZDF : std_logic;
    BEGIN
        ZDF := A1 XOR A0;
        if ZDF ='1' then
            Z0 <= transport ZDF after TRISE;
        elsif ZDF ='0' then
            Z0 <= transport ZDF after TFALL;
        else
            Z0 <= transport ZDF;
        end if;
    END PROCESS;
END behav;

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY PGDFFR_ints IS 
    GENERIC (
        HLCQ : TIME := 1 ns;
        LHCQ : TIME := 1 ns;
        HLRQ : TIME := 1 ns;
        SUD0 : TIME := 0 ns;
        SUD1 : TIME := 0 ns;
        HOLDD0 : TIME := 0 ns;
        HOLDD1 : TIME := 0 ns;
        POSC1 : TIME := 0 ns;
        POSC0 : TIME := 0 ns;
        NEGC1 : TIME := 0 ns;
        NEGC0 : TIME := 0 ns;
        RECRC : TIME := 0 ns;
        HOLDRC : TIME := 0 ns
    );
    PORT (
        RNESET : IN std_logic;
        CD : IN std_logic;
        CLK : IN std_logic;
        D0 : IN std_logic;
        Q0 : OUT std_logic
    );
END PGDFFR_ints;

ARCHITECTURE behav OF PGDFFR_ints IS 
BEGIN

    PROCESS (RNESET, CD, CLK, D0)
	variable iQ0 : std_logic;
	variable pQ0 : std_logic;

	begin

		if (CD OR NOT (RNESET)) = '1' then
			if NOT (iQ0='0') then
			  iQ0 := '0';
			  Q0 <= transport iQ0  after HLRQ;
			end if;
		elsif (CD OR NOT (RNESET)) = '0' AND CLK= '1' AND CLK'EVENT then
			pQ0 := iQ0;
			if (D0'EVENT) then
				iQ0 := D0'LAST_VALUE;
			elsif NOT (D0'EVENT) then
				iQ0 := D0;
			end if;
      if pQ0 = iQ0 then 
         Q0 <= transport iQ0;
      elsif iQ0 = '1' then Q0 <= transport iQ0 after LHCQ;
      elsif iQ0 = '0' then Q0 <= transport iQ0 after HLCQ;
      else
          Q0 <= transport iQ0;
      end if;
		end if;
    END PROCESS;

	process(CLK, CD)
	 begin
		if CD'EVENT AND CD='0' AND CLK='1' then
			assert (CLK'LAST_EVENT >= HOLDRC) 
			report("HOLD TIME VIOLAION ON CD (HOLDRC)  ")
            severity WARNING;
		end if;
		if CLK'EVENT  AND CLK ='1' AND CD ='0' then
			assert ( CD'LAST_EVENT >= RECRC) 
			report("RECOVERY TIME VIOLATION on CD(RECRC) ")
            severity WARNING;
		end if;
	end process;

	process(CLK,RNESET)
	 begin
		if RNESET'EVENT AND NOT(RNESET)='0' AND CLK='1' then
			assert (CLK'LAST_EVENT >= HOLDRC) 
			report("HOLD TIME VIOLAION ON RNESET (HOLDRC)  ")
            severity WARNING;
		end if;
		if CLK'EVENT  AND CLK ='1' AND NOT(RNESET) ='0' then
			assert ( RNESET'LAST_EVENT >= RECRC) 
			report("RECOVERY TIME VIOLATION on RNESET(RECRC) ")
            severity WARNING;
		end if;
	end process;

	process(D0, CLK)

	variable R_EDGE1 : TIME := 0 ns;
	variable R_EDGE0 : TIME := 0 ns;
	variable F_EDGE1 : TIME := 0 ns;
	variable F_EDGE0 : TIME := 0 ns;

	begin
		if CLK='1' AND CLK'LAST_VALUE='0' AND NOT(D0'EVENT) then
		   if D0='1' then
			R_EDGE1 := NOW;
			assert((R_EDGE1-F_EDGE1) >= NEGC1) 
			report("NEGATIVE PULSE WIDTH VIOLATION (NEGC1) ON CLK at ")
            severity WARNING;
			elsif D0='0' then
			 R_EDGE0 := NOW;
			 assert((R_EDGE0-F_EDGE0) >= NEGC0) 
			 report("NEGATIVE PULSE WIDTH VIOLATION (NEGC0) ON CLK at ")
             severity WARNING;
			end if;
		end if;

		if CLK ='0' AND CLK'LAST_VALUE = '1' AND NOT(D0'EVENT) then
			if D0='1' then
			  F_EDGE1 := NOW;
			  assert ((F_EDGE1-R_EDGE1) >= POSC1) 
			  report("POSITIVE PULSE WIDTH VIOLATION (POSC1) ON CLK at ")
              severity WARNING;
			elsif D0='0' then
			  F_EDGE0 := NOW;
			  assert ((F_EDGE0-R_EDGE0) >= POSC0) 
			  report("POSITIVE PULSE WIDTH VIOLATION (POSC0) ON CLK at ")
              severity WARNING;
			end if;
		end if;

	end process;

	process(D0, CLK)

	begin
		if CLK = '1' AND CLK'EVENT then 
			if D0='1' then
               assert(D0'LAST_EVENT >= SUD1) 
 			   report("DATA SET-UP VIOLATION (SUD1) ")
               severity WARNING;
			elsif D0='0' then
               assert(D0'LAST_EVENT >= SUD0) 
 			   report("DATA SET-UP VIOLATION (SUD0) ")
               severity WARNING;
			end if;
		end if;

		if CLK='1' AND D0'EVENT then 
			if D0'LAST_VALUE ='1' then
			   assert(CLK'LAST_EVENT >= HOLDD1)
			   report("DATA HOLD VIOLATION (HOLDD1) ")
               severity WARNING;
			elsif D0'LAST_VALUE='0' then
			   assert(CLK'LAST_EVENT >= HOLDD0)
			   report("DATA HOLD VIOLATION (HOLDD0) ")
               severity WARNING;
			end if;
		end if;

	end process;
END behav;

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY PGINVI_ints IS 
    GENERIC (
        TRISE : TIME := 1 ns;
        TFALL : TIME := 1 ns
    );
    PORT (
        A0 : IN std_logic;
        ZN0 : OUT std_logic
    );
END PGINVI_ints;

ARCHITECTURE behav OF PGINVI_ints IS 
BEGIN

    PROCESS (A0)
    VARIABLE ZDF : std_logic;
    BEGIN
        ZDF := NOT A0;
        if ZDF ='1' then
            ZN0 <= transport ZDF after TRISE;
        elsif ZDF ='0' then
            ZN0 <= transport ZDF after TFALL;
        else
            ZN0 <= transport ZDF;
        end if;
    END PROCESS;
END behav;

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY PXIN_ints IS 
    GENERIC (
        TRISE : TIME := 1 ns;
        TFALL : TIME := 1 ns
    );
    PORT (
        XI0 : IN std_logic;
        Z0 : OUT std_logic
    );
END PXIN_ints;

ARCHITECTURE behav OF PXIN_ints IS 
BEGIN

    PROCESS (XI0)
    VARIABLE ZDF : std_logic;
    BEGIN
        ZDF :=  XI0;
        if ZDF ='1' then
            Z0 <= transport ZDF after TRISE;
        elsif ZDF ='0' then
            Z0 <= transport ZDF after TFALL;
        else
            Z0 <= transport ZDF;
        end if;
    END PROCESS;
END behav;

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY PXOUT_ints IS 
    GENERIC (
        TRISE : TIME := 1 ns;
        TFALL : TIME := 1 ns
    );
    PORT (
        A0 : IN std_logic;
        XO0 : OUT std_logic
    );
END PXOUT_ints;

ARCHITECTURE behav OF PXOUT_ints IS 
BEGIN

    PROCESS (A0)
    VARIABLE ZDF : std_logic;
    BEGIN
        ZDF :=  A0;
        if ZDF ='1' then
            XO0 <= transport ZDF after TRISE;
        elsif ZDF ='0' then
            XO0 <= transport ZDF after TFALL;
        else
            XO0 <= transport ZDF;
        end if;
    END PROCESS;
END behav;

LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE work.all;

ENTITY ints IS 
    PORT (
        XRESET : IN std_logic;
        ENC : IN std_logic;
        CLOCK : IN std_logic;
        BTN : IN std_logic;
        INT3 : OUT std_logic;
        INT0 : OUT std_logic
    );
END ints;


ARCHITECTURE ints_STRUCTURE OF ints IS
SIGNAL GND : std_logic := '0';
SIGNAL  L2L_KEYWD_RESETb, IO30_IBUFO, CLOCKX, IO31_IBUFO,
	 IO10_OBUFI, INT3_Q_iomux, IO11_OBUFI, INT0_Q_iomux,
	 INT0_Q, INT3_Q, L2L_KEYWD_RESET_glbb, A6_CLK,
	 CLOCKX_clk0, A6_P0_xa, A6_X3O, A6_P4_xa,
	 A6_X2O, A6_G1, A6_G0, ENCX_grp,
	 A6_P4, A6_IN14B, BTNX_grp, A6_P0,
	 A6_IN15B : std_logic;


  COMPONENT PGBUFI_ints
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PGBUFI_ints use entity work.PGBUFI_ints(behav);

  COMPONENT PGXOR2_ints
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PGXOR2_ints use entity work.PGXOR2_ints(behav);

  COMPONENT PGDFFR_ints
    GENERIC (HLCQ, LHCQ, HLRQ, SUD0, 
        SUD1, HOLDD0, HOLDD1, POSC1, 
        POSC0, NEGC1, NEGC0, RECRC, 
        HOLDRC : TIME);
    PORT (
        RNESET : IN std_logic;
        CD : IN std_logic;
        CLK : IN std_logic;
        D0 : IN std_logic;
        Q0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PGDFFR_ints use entity work.PGDFFR_ints(behav);

  COMPONENT PGINVI_ints
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A0 : IN std_logic;
        ZN0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PGINVI_ints use entity work.PGINVI_ints(behav);

  COMPONENT PXIN_ints
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        XI0 : IN std_logic;
        Z0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PXIN_ints use entity work.PXIN_ints(behav);

  COMPONENT PXOUT_ints
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A0 : IN std_logic;
        XO0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PXOUT_ints use entity work.PXOUT_ints(behav);

BEGIN

GLB_A6_P4 : PGBUFI_ints
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => A6_P4, A0 => A6_IN14B);
GLB_A6_P0 : PGBUFI_ints
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => A6_P0, A0 => A6_IN15B);
GLB_A6_G1 : PGBUFI_ints
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => A6_G1, A0 => GND);
GLB_A6_G0 : PGBUFI_ints
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => A6_G0, A0 => GND);
GLB_A6_CLK : PGBUFI_ints
    GENERIC MAP (TRISE => 0.200000 ns, TFALL => 0.200000 ns)
	PORT MAP (Z0 => A6_CLK, A0 => CLOCKX_clk0);
GLB_A6_P0_xa : PGBUFI_ints
    GENERIC MAP (TRISE => 0.500000 ns, TFALL => 0.500000 ns)
	PORT MAP (Z0 => A6_P0_xa, A0 => A6_P0);
GLB_A6_P4_xa : PGBUFI_ints
    GENERIC MAP (TRISE => 0.500000 ns, TFALL => 0.500000 ns)
	PORT MAP (Z0 => A6_P4_xa, A0 => A6_P4);
GLB_A6_X3O : PGXOR2_ints
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => A6_X3O, A1 => A6_P0_xa, A0 => A6_G0);
GLB_A6_X2O : PGXOR2_ints
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => A6_X2O, A1 => A6_P4_xa, A0 => A6_G1);
GLB_INT0_Q : PGDFFR_ints
    GENERIC MAP (HLCQ => 1.400000 ns, LHCQ => 1.400000 ns, HLRQ => 4.900000 ns, SUD0 => 0.300000 ns, 
        SUD1 => 0.300000 ns, HOLDD0 => 3.500000 ns, HOLDD1 => 3.500000 ns, POSC1 => 0.000000 ns, 
        POSC0 => 0.000000 ns, NEGC1 => 0.000000 ns, NEGC0 => 0.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => INT0_Q, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => A6_CLK, 
	D0 => A6_X3O);
GLB_INT3_Q : PGDFFR_ints
    GENERIC MAP (HLCQ => 1.400000 ns, LHCQ => 1.400000 ns, HLRQ => 4.900000 ns, SUD0 => 0.300000 ns, 
        SUD1 => 0.300000 ns, HOLDD0 => 3.500000 ns, HOLDD1 => 3.500000 ns, POSC1 => 0.000000 ns, 
        POSC0 => 0.000000 ns, NEGC1 => 0.000000 ns, NEGC0 => 0.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => INT3_Q, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => A6_CLK, 
	D0 => A6_X2O);
GLB_A6_IN14B : PGINVI_ints
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => A6_IN14B, A0 => ENCX_grp);
GLB_A6_IN15B : PGINVI_ints
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => A6_IN15B, A0 => BTNX_grp);
IOC_L2L_KEYWD_RESET : PXIN_ints
    GENERIC MAP (TRISE => 1.200000 ns, TFALL => 1.200000 ns)
	PORT MAP (Z0 => L2L_KEYWD_RESETb, XI0 => XRESET);
IOC_IO30_IBUFO : PXIN_ints
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO30_IBUFO, XI0 => ENC);
IOC_CLOCKX : PXIN_ints
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => CLOCKX, XI0 => CLOCK);
IOC_IO31_IBUFO : PXIN_ints
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO31_IBUFO, XI0 => BTN);
IOC_INT3 : PXOUT_ints
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => INT3, A0 => IO10_OBUFI);
IOC_IO10_OBUFI : PGBUFI_ints
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (Z0 => IO10_OBUFI, A0 => INT3_Q_iomux);
IOC_INT0 : PXOUT_ints
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => INT0, A0 => IO11_OBUFI);
IOC_IO11_OBUFI : PGBUFI_ints
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (Z0 => IO11_OBUFI, A0 => INT0_Q_iomux);
GRP_INT3_Q_iomux : PGBUFI_ints
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => INT3_Q_iomux, A0 => INT3_Q);
GRP_INT0_Q_iomux : PGBUFI_ints
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => INT0_Q_iomux, A0 => INT0_Q);
GRP_BTNX_grp : PGBUFI_ints
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => BTNX_grp, A0 => IO31_IBUFO);
GRP_ENCX_grp : PGBUFI_ints
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => ENCX_grp, A0 => IO30_IBUFO);
GRP_CLOCKX_clk0 : PXIN_ints
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => CLOCKX_clk0, XI0 => CLOCKX);
GRP_L2L_KEYWD_RESET_glb : PXIN_ints
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => L2L_KEYWD_RESET_glbb, XI0 => L2L_KEYWD_RESETb);
END ints_STRUCTURE;
