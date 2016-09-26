-- VHDL netlist for cpldzero
-- Date: Fri May 20 05:28:38 2016
-- Copyright (c) Lattice Semiconductor Corporation
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY PGBUFI_cpldzero IS 
    GENERIC (
        TRISE : TIME := 1 ns;
        TFALL : TIME := 1 ns
    );
    PORT (
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
END PGBUFI_cpldzero;

ARCHITECTURE behav OF PGBUFI_cpldzero IS 
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

ENTITY PGXOR2_cpldzero IS 
    GENERIC (
        TRISE : TIME := 1 ns;
        TFALL : TIME := 1 ns
    );
    PORT (
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
END PGXOR2_cpldzero;

ARCHITECTURE behav OF PGXOR2_cpldzero IS 
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

ENTITY PGDFFR_cpldzero IS 
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
END PGDFFR_cpldzero;

ARCHITECTURE behav OF PGDFFR_cpldzero IS 
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

ENTITY PXIN_cpldzero IS 
    GENERIC (
        TRISE : TIME := 1 ns;
        TFALL : TIME := 1 ns
    );
    PORT (
        XI0 : IN std_logic;
        Z0 : OUT std_logic
    );
END PXIN_cpldzero;

ARCHITECTURE behav OF PXIN_cpldzero IS 
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

ENTITY PXOUT_cpldzero IS 
    GENERIC (
        TRISE : TIME := 1 ns;
        TFALL : TIME := 1 ns
    );
    PORT (
        A0 : IN std_logic;
        XO0 : OUT std_logic
    );
END PXOUT_cpldzero;

ARCHITECTURE behav OF PXOUT_cpldzero IS 
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

ENTITY PGINVI_cpldzero IS 
    GENERIC (
        TRISE : TIME := 1 ns;
        TFALL : TIME := 1 ns
    );
    PORT (
        A0 : IN std_logic;
        ZN0 : OUT std_logic
    );
END PGINVI_cpldzero;

ARCHITECTURE behav OF PGINVI_cpldzero IS 
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
USE work.all;

ENTITY cpldzero IS 
    PORT (
        XRESET : IN std_logic;
        CLOCK : IN std_logic;
        XDCS : OUT std_logic;
        XCS : OUT std_logic;
        ST0 : OUT std_logic;
        SRDY : OUT std_logic;
        RAS : OUT std_logic;
        OE2 : OUT std_logic;
        OE1 : OUT std_logic;
        MUX : OUT std_logic;
        IDEDIR : OUT std_logic;
        DRAM : OUT std_logic;
        DIOW : OUT std_logic;
        DIOR : OUT std_logic;
        CS0 : OUT std_logic;
        CLKBA : OUT std_logic;
        CAS : OUT std_logic
    );
END cpldzero;


ARCHITECTURE cpldzero_STRUCTURE OF cpldzero IS
SIGNAL GND : std_logic := '0';
SIGNAL  CAS_PIN_part2_grpi, L2L_KEYWD_RESETb, CLOCKX, IO13_OBUFI,
	 IO15_OBUFI, IO11_OBUFI, CAS_PIN_part1_iomux, IO20_OBUFI,
	 DEF_747_iomux, IO7_OBUFI, IO26_OBUFI, IO30_OBUFI,
	 DEF_743_iomux, IO3_OBUFI, DEF_740_iomux, IO31_OBUFI,
	 GND_750_iomux, IO5_OBUFI, DEF_737_iomux, IO6_OBUFI,
	 GND_751_iomux, IO0_OBUFI, GND_749_iomux, IO2_OBUFI,
	 DEF_734_iomux, IO29_OBUFI, GND_748_iomux, IO4_OBUFI,
	 CAS_PIN_part2_iomux, GND_751, A1_X2O, GND_749,
	 A1_X0O, A1_G3, A1_G1, DEF_740,
	 A3_CLK, A3_P0_xa, A3_X3O, A3_G0,
	 A3_P0, A3_IN8, CAS_PIN_part1, DEF_734,
	 DEF_737, CAS_PIN_part2, A6_CLK, A6_P0_xa,
	 A6_X3O, A6_P4_xa, A6_X2O, A6_P8_xa,
	 A6_X1O, A6_P13_xa, A6_X0O, A6_G3,
	 A6_G2, A6_G1, A6_G0, A6_P13,
	 A6_P8, A6_P4, CAS_PIN_part2_ffb, A6_P0,
	 A6_IN16, DEF_743, DEF_747, L2L_KEYWD_RESET_glbb,
	 B6_CLK, CLOCKX_clk0, GND_750, B6_X3O,
	 B6_P4_xa, B6_X2O, GND_748, B6_X1O,
	 B6_P13_xa, B6_X0O, B6_G3, B6_G2,
	 B6_G1, B6_G0, B6_P13, B6_P4,
	 B6_IN7 : std_logic;


  COMPONENT PGBUFI_cpldzero
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PGBUFI_cpldzero use entity work.PGBUFI_cpldzero(behav);

  COMPONENT PGXOR2_cpldzero
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PGXOR2_cpldzero use entity work.PGXOR2_cpldzero(behav);

  COMPONENT PGDFFR_cpldzero
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
  for all :  PGDFFR_cpldzero use entity work.PGDFFR_cpldzero(behav);

  COMPONENT PXIN_cpldzero
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        XI0 : IN std_logic;
        Z0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PXIN_cpldzero use entity work.PXIN_cpldzero(behav);

  COMPONENT PXOUT_cpldzero
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A0 : IN std_logic;
        XO0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PXOUT_cpldzero use entity work.PXOUT_cpldzero(behav);

  COMPONENT PGINVI_cpldzero
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A0 : IN std_logic;
        ZN0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PGINVI_cpldzero use entity work.PGINVI_cpldzero(behav);

BEGIN

GLB_A1_G3 : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => A1_G3, A0 => GND);
GLB_A1_G1 : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => A1_G1, A0 => GND);
GLB_GND_751 : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 1.200000 ns, TFALL => 1.200000 ns)
	PORT MAP (Z0 => GND_751, A0 => A1_X2O);
GLB_GND_749 : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 1.200000 ns, TFALL => 1.200000 ns)
	PORT MAP (Z0 => GND_749, A0 => A1_X0O);
GLB_A1_X2O : PGXOR2_cpldzero
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => A1_X2O, A1 => GND, A0 => A1_G1);
GLB_A1_X0O : PGXOR2_cpldzero
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => A1_X0O, A1 => GND, A0 => A1_G3);
GLB_A3_P0 : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => A3_P0, A0 => A3_IN8);
GLB_A3_G0 : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => A3_G0, A0 => GND);
GLB_A3_CLK : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.200000 ns, TFALL => 0.200000 ns)
	PORT MAP (Z0 => A3_CLK, A0 => CLOCKX_clk0);
GLB_A3_P0_xa : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.500000 ns, TFALL => 0.500000 ns)
	PORT MAP (Z0 => A3_P0_xa, A0 => A3_P0);
GLB_A3_IN8 : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => A3_IN8, A0 => CAS_PIN_part2_grpi);
GLB_A3_X3O : PGXOR2_cpldzero
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => A3_X3O, A1 => A3_P0_xa, A0 => A3_G0);
GLB_DEF_740 : PGDFFR_cpldzero
    GENERIC MAP (HLCQ => 1.400000 ns, LHCQ => 1.400000 ns, HLRQ => 4.900000 ns, SUD0 => 0.300000 ns, 
        SUD1 => 0.300000 ns, HOLDD0 => 3.500000 ns, HOLDD1 => 3.500000 ns, POSC1 => 0.000000 ns, 
        POSC0 => 0.000000 ns, NEGC1 => 0.000000 ns, NEGC0 => 0.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => DEF_740, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => A3_CLK, 
	D0 => A3_X3O);
GLB_A6_P13 : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => A6_P13, A0 => A6_IN16);
GLB_A6_P8 : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => A6_P8, A0 => A6_IN16);
GLB_A6_P4 : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => A6_P4, A0 => A6_IN16);
GLB_A6_P0 : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => A6_P0, A0 => A6_IN16);
GLB_A6_G3 : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => A6_G3, A0 => GND);
GLB_A6_G2 : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => A6_G2, A0 => GND);
GLB_A6_G1 : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => A6_G1, A0 => GND);
GLB_A6_G0 : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => A6_G0, A0 => GND);
GLB_A6_CLK : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.200000 ns, TFALL => 0.200000 ns)
	PORT MAP (Z0 => A6_CLK, A0 => CLOCKX_clk0);
GLB_A6_P0_xa : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.500000 ns, TFALL => 0.500000 ns)
	PORT MAP (Z0 => A6_P0_xa, A0 => A6_P0);
GLB_A6_P4_xa : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.500000 ns, TFALL => 0.500000 ns)
	PORT MAP (Z0 => A6_P4_xa, A0 => A6_P4);
GLB_A6_P8_xa : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.500000 ns, TFALL => 0.500000 ns)
	PORT MAP (Z0 => A6_P8_xa, A0 => A6_P8);
GLB_A6_P13_xa : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.500000 ns, TFALL => 0.500000 ns)
	PORT MAP (Z0 => A6_P13_xa, A0 => A6_P13);
GLB_A6_IN16 : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => A6_IN16, A0 => CAS_PIN_part2_ffb);
GLB_A6_X3O : PGXOR2_cpldzero
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => A6_X3O, A1 => A6_P0_xa, A0 => A6_G0);
GLB_A6_X2O : PGXOR2_cpldzero
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => A6_X2O, A1 => A6_P4_xa, A0 => A6_G1);
GLB_A6_X1O : PGXOR2_cpldzero
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => A6_X1O, A1 => A6_P8_xa, A0 => A6_G2);
GLB_A6_X0O : PGXOR2_cpldzero
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => A6_X0O, A1 => A6_P13_xa, A0 => A6_G3);
GLB_CAS_PIN_part1 : PGDFFR_cpldzero
    GENERIC MAP (HLCQ => 1.400000 ns, LHCQ => 1.400000 ns, HLRQ => 4.900000 ns, SUD0 => 0.300000 ns, 
        SUD1 => 0.300000 ns, HOLDD0 => 3.500000 ns, HOLDD1 => 3.500000 ns, POSC1 => 0.000000 ns, 
        POSC0 => 0.000000 ns, NEGC1 => 0.000000 ns, NEGC0 => 0.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => CAS_PIN_part1, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => A6_CLK, 
	D0 => A6_X3O);
GLB_DEF_734 : PGDFFR_cpldzero
    GENERIC MAP (HLCQ => 1.400000 ns, LHCQ => 1.400000 ns, HLRQ => 4.900000 ns, SUD0 => 0.300000 ns, 
        SUD1 => 0.300000 ns, HOLDD0 => 3.500000 ns, HOLDD1 => 3.500000 ns, POSC1 => 0.000000 ns, 
        POSC0 => 0.000000 ns, NEGC1 => 0.000000 ns, NEGC0 => 0.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => DEF_734, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => A6_CLK, 
	D0 => A6_X2O);
GLB_DEF_737 : PGDFFR_cpldzero
    GENERIC MAP (HLCQ => 1.400000 ns, LHCQ => 1.400000 ns, HLRQ => 4.900000 ns, SUD0 => 0.300000 ns, 
        SUD1 => 0.300000 ns, HOLDD0 => 3.500000 ns, HOLDD1 => 3.500000 ns, POSC1 => 0.000000 ns, 
        POSC0 => 0.000000 ns, NEGC1 => 0.000000 ns, NEGC0 => 0.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => DEF_737, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => A6_CLK, 
	D0 => A6_X1O);
GLB_CAS_PIN_part2 : PGDFFR_cpldzero
    GENERIC MAP (HLCQ => 1.400000 ns, LHCQ => 1.400000 ns, HLRQ => 4.900000 ns, SUD0 => 0.300000 ns, 
        SUD1 => 0.300000 ns, HOLDD0 => 3.500000 ns, HOLDD1 => 3.500000 ns, POSC1 => 0.000000 ns, 
        POSC0 => 0.000000 ns, NEGC1 => 0.000000 ns, NEGC0 => 0.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => CAS_PIN_part2, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => A6_CLK, 
	D0 => A6_X0O);
GLB_B6_P13 : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B6_P13, A0 => B6_IN7);
GLB_B6_P4 : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B6_P4, A0 => B6_IN7);
GLB_B6_G3 : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => B6_G3, A0 => GND);
GLB_B6_G2 : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => B6_G2, A0 => GND);
GLB_B6_G1 : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => B6_G1, A0 => GND);
GLB_B6_G0 : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => B6_G0, A0 => GND);
GLB_B6_CLK : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.200000 ns, TFALL => 0.200000 ns)
	PORT MAP (Z0 => B6_CLK, A0 => CLOCKX_clk0);
GLB_GND_750 : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 1.200000 ns, TFALL => 1.200000 ns)
	PORT MAP (Z0 => GND_750, A0 => B6_X3O);
GLB_B6_P4_xa : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.500000 ns, TFALL => 0.500000 ns)
	PORT MAP (Z0 => B6_P4_xa, A0 => B6_P4);
GLB_GND_748 : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 1.200000 ns, TFALL => 1.200000 ns)
	PORT MAP (Z0 => GND_748, A0 => B6_X1O);
GLB_B6_P13_xa : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.500000 ns, TFALL => 0.500000 ns)
	PORT MAP (Z0 => B6_P13_xa, A0 => B6_P13);
GLB_B6_IN7 : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => B6_IN7, A0 => CAS_PIN_part2_grpi);
GLB_B6_X3O : PGXOR2_cpldzero
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => B6_X3O, A1 => GND, A0 => B6_G0);
GLB_B6_X2O : PGXOR2_cpldzero
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => B6_X2O, A1 => B6_P4_xa, A0 => B6_G1);
GLB_B6_X1O : PGXOR2_cpldzero
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => B6_X1O, A1 => GND, A0 => B6_G2);
GLB_B6_X0O : PGXOR2_cpldzero
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => B6_X0O, A1 => B6_P13_xa, A0 => B6_G3);
GLB_DEF_743 : PGDFFR_cpldzero
    GENERIC MAP (HLCQ => 1.400000 ns, LHCQ => 1.400000 ns, HLRQ => 4.900000 ns, SUD0 => 0.300000 ns, 
        SUD1 => 0.300000 ns, HOLDD0 => 3.500000 ns, HOLDD1 => 3.500000 ns, POSC1 => 0.000000 ns, 
        POSC0 => 0.000000 ns, NEGC1 => 0.000000 ns, NEGC0 => 0.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => DEF_743, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => B6_CLK, 
	D0 => B6_X2O);
GLB_DEF_747 : PGDFFR_cpldzero
    GENERIC MAP (HLCQ => 1.400000 ns, LHCQ => 1.400000 ns, HLRQ => 4.900000 ns, SUD0 => 0.300000 ns, 
        SUD1 => 0.300000 ns, HOLDD0 => 3.500000 ns, HOLDD1 => 3.500000 ns, POSC1 => 0.000000 ns, 
        POSC0 => 0.000000 ns, NEGC1 => 0.000000 ns, NEGC0 => 0.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => DEF_747, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => B6_CLK, 
	D0 => B6_X0O);
IOC_L2L_KEYWD_RESET : PXIN_cpldzero
    GENERIC MAP (TRISE => 1.200000 ns, TFALL => 1.200000 ns)
	PORT MAP (Z0 => L2L_KEYWD_RESETb, XI0 => XRESET);
IOC_CLOCKX : PXIN_cpldzero
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => CLOCKX, XI0 => CLOCK);
IOC_XDCS : PXOUT_cpldzero
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => XDCS, A0 => IO13_OBUFI);
IOC_IO13_OBUFI : PGINVI_cpldzero
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (ZN0 => IO13_OBUFI, A0 => DEF_737_iomux);
IOC_XCS : PXOUT_cpldzero
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => XCS, A0 => IO15_OBUFI);
IOC_IO15_OBUFI : PGINVI_cpldzero
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (ZN0 => IO15_OBUFI, A0 => DEF_740_iomux);
IOC_ST0 : PXOUT_cpldzero
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => ST0, A0 => IO11_OBUFI);
IOC_IO11_OBUFI : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (Z0 => IO11_OBUFI, A0 => CAS_PIN_part1_iomux);
IOC_SRDY : PXOUT_cpldzero
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => SRDY, A0 => IO20_OBUFI);
IOC_IO20_OBUFI : PGINVI_cpldzero
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (ZN0 => IO20_OBUFI, A0 => DEF_747_iomux);
IOC_RAS : PXOUT_cpldzero
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => RAS, A0 => IO7_OBUFI);
IOC_IO7_OBUFI : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (Z0 => IO7_OBUFI, A0 => DEF_740_iomux);
IOC_OE2 : PXOUT_cpldzero
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => OE2, A0 => IO26_OBUFI);
IOC_IO26_OBUFI : PGINVI_cpldzero
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (ZN0 => IO26_OBUFI, A0 => DEF_743_iomux);
IOC_OE1 : PXOUT_cpldzero
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => OE1, A0 => IO30_OBUFI);
IOC_IO30_OBUFI : PGINVI_cpldzero
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (ZN0 => IO30_OBUFI, A0 => DEF_743_iomux);
IOC_MUX : PXOUT_cpldzero
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => MUX, A0 => IO3_OBUFI);
IOC_IO3_OBUFI : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (Z0 => IO3_OBUFI, A0 => DEF_740_iomux);
IOC_IDEDIR : PXOUT_cpldzero
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => IDEDIR, A0 => IO31_OBUFI);
IOC_IO31_OBUFI : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (Z0 => IO31_OBUFI, A0 => GND_750_iomux);
IOC_DRAM : PXOUT_cpldzero
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => DRAM, A0 => IO5_OBUFI);
IOC_IO5_OBUFI : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (Z0 => IO5_OBUFI, A0 => DEF_737_iomux);
IOC_DIOW : PXOUT_cpldzero
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => DIOW, A0 => IO6_OBUFI);
IOC_IO6_OBUFI : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (Z0 => IO6_OBUFI, A0 => GND_751_iomux);
IOC_DIOR : PXOUT_cpldzero
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => DIOR, A0 => IO0_OBUFI);
IOC_IO0_OBUFI : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (Z0 => IO0_OBUFI, A0 => GND_749_iomux);
IOC_CS0 : PXOUT_cpldzero
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => CS0, A0 => IO2_OBUFI);
IOC_IO2_OBUFI : PGINVI_cpldzero
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (ZN0 => IO2_OBUFI, A0 => DEF_734_iomux);
IOC_CLKBA : PXOUT_cpldzero
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => CLKBA, A0 => IO29_OBUFI);
IOC_IO29_OBUFI : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (Z0 => IO29_OBUFI, A0 => GND_748_iomux);
IOC_CAS : PXOUT_cpldzero
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => CAS, A0 => IO4_OBUFI);
IOC_IO4_OBUFI : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (Z0 => IO4_OBUFI, A0 => CAS_PIN_part2_iomux);
GRP_GND_751_iomux : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => GND_751_iomux, A0 => GND_751);
GRP_GND_749_iomux : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => GND_749_iomux, A0 => GND_749);
GRP_DEF_740_iomux : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => DEF_740_iomux, A0 => DEF_740);
GRP_CAS_PIN_part2_ffb : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 0.800000 ns, TFALL => 0.800000 ns)
	PORT MAP (Z0 => CAS_PIN_part2_ffb, A0 => CAS_PIN_part2);
GRP_CAS_PIN_part2_grpi : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 2.100000 ns, TFALL => 2.100000 ns)
	PORT MAP (Z0 => CAS_PIN_part2_grpi, A0 => CAS_PIN_part2);
GRP_CAS_PIN_part2_iomux : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => CAS_PIN_part2_iomux, A0 => CAS_PIN_part2);
GRP_CLOCKX_clk0 : PXIN_cpldzero
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => CLOCKX_clk0, XI0 => CLOCKX);
GRP_DEF_737_iomux : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => DEF_737_iomux, A0 => DEF_737);
GRP_DEF_734_iomux : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => DEF_734_iomux, A0 => DEF_734);
GRP_CAS_PIN_part1_iomux : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => CAS_PIN_part1_iomux, A0 => CAS_PIN_part1);
GRP_GND_750_iomux : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => GND_750_iomux, A0 => GND_750);
GRP_GND_748_iomux : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => GND_748_iomux, A0 => GND_748);
GRP_DEF_747_iomux : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => DEF_747_iomux, A0 => DEF_747);
GRP_DEF_743_iomux : PGBUFI_cpldzero
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => DEF_743_iomux, A0 => DEF_743);
GRP_L2L_KEYWD_RESET_glb : PXIN_cpldzero
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => L2L_KEYWD_RESET_glbb, XI0 => L2L_KEYWD_RESETb);
END cpldzero_STRUCTURE;
