-- VHDL netlist for jukebox
-- Date: Wed Mar 09 22:51:40 2016
-- Copyright (c) Lattice Semiconductor Corporation
LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY PGAND6_jukebox IS 
    GENERIC (
        TRISE : TIME := 1 ns;
        TFALL : TIME := 1 ns
    );
    PORT (
        A5 : IN std_logic;
        A4 : IN std_logic;
        A3 : IN std_logic;
        A2 : IN std_logic;
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
END PGAND6_jukebox;

ARCHITECTURE behav OF PGAND6_jukebox IS 
BEGIN

    PROCESS (A5, A4, A3, A2, 
		A1, A0)
    VARIABLE ZDF : std_logic;
    BEGIN
        ZDF := A5 AND A4 AND A3 AND 
            A2 AND A1 AND A0;
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

ENTITY PGAND7_jukebox IS 
    GENERIC (
        TRISE : TIME := 1 ns;
        TFALL : TIME := 1 ns
    );
    PORT (
        A6 : IN std_logic;
        A5 : IN std_logic;
        A4 : IN std_logic;
        A3 : IN std_logic;
        A2 : IN std_logic;
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
END PGAND7_jukebox;

ARCHITECTURE behav OF PGAND7_jukebox IS 
BEGIN

    PROCESS (A6, A5, A4, A3, 
		A2, A1, A0)
    VARIABLE ZDF : std_logic;
    BEGIN
        ZDF := A6 AND A5 AND A4 AND 
            A3 AND A2 AND A1 AND A0;
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

ENTITY PGAND5_jukebox IS 
    GENERIC (
        TRISE : TIME := 1 ns;
        TFALL : TIME := 1 ns
    );
    PORT (
        A4 : IN std_logic;
        A3 : IN std_logic;
        A2 : IN std_logic;
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
END PGAND5_jukebox;

ARCHITECTURE behav OF PGAND5_jukebox IS 
BEGIN

    PROCESS (A4, A3, A2, A1, 
		A0)
    VARIABLE ZDF : std_logic;
    BEGIN
        ZDF := A4 AND A3 AND A2 AND 
            A1 AND A0;
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

ENTITY PGAND10_jukebox IS 
    GENERIC (
        TRISE : TIME := 1 ns;
        TFALL : TIME := 1 ns
    );
    PORT (
        A9 : IN std_logic;
        A8 : IN std_logic;
        A7 : IN std_logic;
        A6 : IN std_logic;
        A5 : IN std_logic;
        A4 : IN std_logic;
        A3 : IN std_logic;
        A2 : IN std_logic;
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
END PGAND10_jukebox;

ARCHITECTURE behav OF PGAND10_jukebox IS 
BEGIN

    PROCESS (A9, A8, A7, A6, 
		A5, A4, A3, A2, 
		A1, A0)
    VARIABLE ZDF : std_logic;
    BEGIN
        ZDF := A9 AND A8 AND A7 AND 
            A6 AND A5 AND A4 AND A3 AND 
            A2 AND A1 AND A0;
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

ENTITY PGAND4_jukebox IS 
    GENERIC (
        TRISE : TIME := 1 ns;
        TFALL : TIME := 1 ns
    );
    PORT (
        A3 : IN std_logic;
        A2 : IN std_logic;
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
END PGAND4_jukebox;

ARCHITECTURE behav OF PGAND4_jukebox IS 
BEGIN

    PROCESS (A3, A2, A1, A0)
    VARIABLE ZDF : std_logic;
    BEGIN
        ZDF := A3 AND A2 AND A1 AND 
            A0;
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

ENTITY PGBUFI_jukebox IS 
    GENERIC (
        TRISE : TIME := 1 ns;
        TFALL : TIME := 1 ns
    );
    PORT (
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
END PGBUFI_jukebox;

ARCHITECTURE behav OF PGBUFI_jukebox IS 
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

ENTITY PGORF72_jukebox IS 
    GENERIC (
        TRISE : TIME := 1 ns;
        TFALL : TIME := 1 ns
    );
    PORT (
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
END PGORF72_jukebox;

ARCHITECTURE behav OF PGORF72_jukebox IS 
BEGIN

    PROCESS (A1, A0)
    VARIABLE ZDF : std_logic;
    BEGIN
        ZDF := A1 OR A0;
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

ENTITY PGORF76_jukebox IS 
    GENERIC (
        TRISE : TIME := 1 ns;
        TFALL : TIME := 1 ns
    );
    PORT (
        A5 : IN std_logic;
        A4 : IN std_logic;
        A3 : IN std_logic;
        A2 : IN std_logic;
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
END PGORF76_jukebox;

ARCHITECTURE behav OF PGORF76_jukebox IS 
BEGIN

    PROCESS (A5, A4, A3, A2, 
		A1, A0)
    VARIABLE ZDF : std_logic;
    BEGIN
        ZDF := A5 OR A4 OR A3 OR 
            A2 OR A1 OR A0;
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

ENTITY PGORF75_jukebox IS 
    GENERIC (
        TRISE : TIME := 1 ns;
        TFALL : TIME := 1 ns
    );
    PORT (
        A4 : IN std_logic;
        A3 : IN std_logic;
        A2 : IN std_logic;
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
END PGORF75_jukebox;

ARCHITECTURE behav OF PGORF75_jukebox IS 
BEGIN

    PROCESS (A4, A3, A2, A1, 
		A0)
    VARIABLE ZDF : std_logic;
    BEGIN
        ZDF := A4 OR A3 OR A2 OR 
            A1 OR A0;
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

ENTITY PGORF74_jukebox IS 
    GENERIC (
        TRISE : TIME := 1 ns;
        TFALL : TIME := 1 ns
    );
    PORT (
        A3 : IN std_logic;
        A2 : IN std_logic;
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
END PGORF74_jukebox;

ARCHITECTURE behav OF PGORF74_jukebox IS 
BEGIN

    PROCESS (A3, A2, A1, A0)
    VARIABLE ZDF : std_logic;
    BEGIN
        ZDF := A3 OR A2 OR A1 OR 
            A0;
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

ENTITY PGXOR2_jukebox IS 
    GENERIC (
        TRISE : TIME := 1 ns;
        TFALL : TIME := 1 ns
    );
    PORT (
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
END PGXOR2_jukebox;

ARCHITECTURE behav OF PGXOR2_jukebox IS 
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

ENTITY PGDFFR_jukebox IS 
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
END PGDFFR_jukebox;

ARCHITECTURE behav OF PGDFFR_jukebox IS 
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

ENTITY PGINVI_jukebox IS 
    GENERIC (
        TRISE : TIME := 1 ns;
        TFALL : TIME := 1 ns
    );
    PORT (
        A0 : IN std_logic;
        ZN0 : OUT std_logic
    );
END PGINVI_jukebox;

ARCHITECTURE behav OF PGINVI_jukebox IS 
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

ENTITY PGAND8_jukebox IS 
    GENERIC (
        TRISE : TIME := 1 ns;
        TFALL : TIME := 1 ns
    );
    PORT (
        A7 : IN std_logic;
        A6 : IN std_logic;
        A5 : IN std_logic;
        A4 : IN std_logic;
        A3 : IN std_logic;
        A2 : IN std_logic;
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
END PGAND8_jukebox;

ARCHITECTURE behav OF PGAND8_jukebox IS 
BEGIN

    PROCESS (A7, A6, A5, A4, 
		A3, A2, A1, A0)
    VARIABLE ZDF : std_logic;
    BEGIN
        ZDF := A7 AND A6 AND A5 AND 
            A4 AND A3 AND A2 AND A1 AND 
            A0;
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

ENTITY PGAND9_jukebox IS 
    GENERIC (
        TRISE : TIME := 1 ns;
        TFALL : TIME := 1 ns
    );
    PORT (
        A8 : IN std_logic;
        A7 : IN std_logic;
        A6 : IN std_logic;
        A5 : IN std_logic;
        A4 : IN std_logic;
        A3 : IN std_logic;
        A2 : IN std_logic;
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
END PGAND9_jukebox;

ARCHITECTURE behav OF PGAND9_jukebox IS 
BEGIN

    PROCESS (A8, A7, A6, A5, 
		A4, A3, A2, A1, 
		A0)
    VARIABLE ZDF : std_logic;
    BEGIN
        ZDF := A8 AND A7 AND A6 AND 
            A5 AND A4 AND A3 AND A2 AND 
            A1 AND A0;
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

ENTITY PXIN_jukebox IS 
    GENERIC (
        TRISE : TIME := 1 ns;
        TFALL : TIME := 1 ns
    );
    PORT (
        XI0 : IN std_logic;
        Z0 : OUT std_logic
    );
END PXIN_jukebox;

ARCHITECTURE behav OF PXIN_jukebox IS 
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

ENTITY PXOUT_jukebox IS 
    GENERIC (
        TRISE : TIME := 1 ns;
        TFALL : TIME := 1 ns
    );
    PORT (
        A0 : IN std_logic;
        XO0 : OUT std_logic
    );
END PXOUT_jukebox;

ARCHITECTURE behav OF PXOUT_jukebox IS 
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

ENTITY jukebox IS 
    PORT (
        XRESET : IN std_logic;
        RESET : IN std_logic;
        MCS2 : IN std_logic;
        MCS1 : IN std_logic;
        DTR : IN std_logic;
        CLOCK : IN std_logic;
        SRDY : OUT std_logic;
        RAS : OUT std_logic;
        MUX : OUT std_logic;
        DRAM : OUT std_logic;
        DR1 : OUT std_logic;
        DR0 : OUT std_logic;
        CAS : OUT std_logic
    );
END jukebox;


ARCHITECTURE jukebox_STRUCTURE OF jukebox IS
SIGNAL GND : std_logic := '0';
SIGNAL  L2L_KEYWD_RESETb, IO20_IBUFO, IO17_IBUFO, IO16_IBUFO,
	 IO25_IBUFO, CLOCKX, IO30_OBUFI, SRDY_D_iomux,
	 IO7_OBUFI, RAS_PIN_iomux, IO3_OBUFI, MUX_PIN_iomux,
	 IO5_OBUFI, DRAM_PIN_iomux, IO11_OBUFI, DR1_PIN_iomux,
	 IO0_OBUFI, DR0_PIN_iomux, IO4_OBUFI, CAS_PIN_iomux,
	 RAS_PIN, DRAM_PIN, RAS_PIN_D0, DRAM_PIN_D0,
	 A1_CLK, A1_X1MO, A1_G2, A1_G1,
	 A1_G0, A1_F5, A1_F4, A1_F1,
	 A1_F0, A1_P19, A1_P18, A1_P17,
	 A1_IN1, A1_P16, A1_P15, A1_P14,
	 A1_IN0B, A1_P12, A1_P11, A1_P10,
	 A1_P9, A1_IN12, A1_P8, A1_IN0,
	 A1_IN1B, A1_IN4B, A1_IN9, A1_P7,
	 A1_IN17, A1_P6, A1_P3, A1_P2,
	 A1_IN8B, A1_IN15B, A1_P1, A1_IN11,
	 A1_IN16, RAS_PIN_ffb, DRAM_PIN_ffb, A1_P0,
	 A1_IN4, A1_IN8, A1_IN11B, A1_IN12B,
	 A1_IN16B, A1_IN17B, DR0_PIN, DR0_PIN_D0,
	 A3_CLK, A3_P13_xa, A3_G3, DR0_PIN_ffb,
	 A3_P13, A3_IN4B, A3_IN5B, A3_IN7B,
	 A3_IN8B, A3_IN11B, A3_IN15B, A3_IN16B,
	 DR1_PIN, CAS_PIN, CAS_PIN_D0, A6_CLK,
	 A6_G3, A6_F4, A6_F1, DR1_PIN_D0,
	 A6_P12, A6_P11, A6_P10, A6_IN15,
	 A6_P9, A6_P8, A6_IN4, A6_IN5B,
	 A6_P7, A6_IN17B, A6_P6, A6_IN16B,
	 A6_P5, A6_P4, A6_P3, A6_P2,
	 A6_IN7B, DR1_PIN_ffb, A6_P1, A6_IN17,
	 CAS_PIN_ffb, A6_P0, A6_IN0, A6_IN1B,
	 A6_IN4B, A6_IN5, A6_IN7, A6_IN9B,
	 A6_IN12B, A6_IN15B, A6_IN16, MUX_PIN,
	 L2L_KEYWD_RESET_glbb, A7_CLK, CLOCKX_clk0, MUX_PIN_D0,
	 MCS1X_grp, A7_P3, A7_IN0, A7_IN11B,
	 MUX_PIN_ffb, DTRX_grp, RESETX_grp, MCS2X_grp,
	 A7_P2, A7_IN1B, A7_IN4B, A7_IN5,
	 A7_IN7, A7_IN8, A7_IN9B, A7_IN11,
	 A7_IN12B, A7_IN17B, B3_P4_xa, SRDY_D,
	 B3_X2O, B3_G1, DRAM_PIN_grp, RAS_PIN_grp,
	 CAS_PIN_grp, DR1_PIN_grp, DR0_PIN_grp, MUX_PIN_grp,
	 B3_P4, B3_IN0B, B3_IN3B, B3_IN4B,
	 B3_IN7, B3_IN8, B3_IN10 : std_logic;


  COMPONENT PGAND6_jukebox
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A5 : IN std_logic;
        A4 : IN std_logic;
        A3 : IN std_logic;
        A2 : IN std_logic;
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PGAND6_jukebox use entity work.PGAND6_jukebox(behav);

  COMPONENT PGAND7_jukebox
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A6 : IN std_logic;
        A5 : IN std_logic;
        A4 : IN std_logic;
        A3 : IN std_logic;
        A2 : IN std_logic;
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PGAND7_jukebox use entity work.PGAND7_jukebox(behav);

  COMPONENT PGAND5_jukebox
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A4 : IN std_logic;
        A3 : IN std_logic;
        A2 : IN std_logic;
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PGAND5_jukebox use entity work.PGAND5_jukebox(behav);

  COMPONENT PGAND10_jukebox
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A9 : IN std_logic;
        A8 : IN std_logic;
        A7 : IN std_logic;
        A6 : IN std_logic;
        A5 : IN std_logic;
        A4 : IN std_logic;
        A3 : IN std_logic;
        A2 : IN std_logic;
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PGAND10_jukebox use entity work.PGAND10_jukebox(behav);

  COMPONENT PGAND4_jukebox
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A3 : IN std_logic;
        A2 : IN std_logic;
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PGAND4_jukebox use entity work.PGAND4_jukebox(behav);

  COMPONENT PGBUFI_jukebox
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PGBUFI_jukebox use entity work.PGBUFI_jukebox(behav);

  COMPONENT PGORF72_jukebox
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PGORF72_jukebox use entity work.PGORF72_jukebox(behav);

  COMPONENT PGORF76_jukebox
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A5 : IN std_logic;
        A4 : IN std_logic;
        A3 : IN std_logic;
        A2 : IN std_logic;
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PGORF76_jukebox use entity work.PGORF76_jukebox(behav);

  COMPONENT PGORF75_jukebox
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A4 : IN std_logic;
        A3 : IN std_logic;
        A2 : IN std_logic;
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PGORF75_jukebox use entity work.PGORF75_jukebox(behav);

  COMPONENT PGORF74_jukebox
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A3 : IN std_logic;
        A2 : IN std_logic;
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PGORF74_jukebox use entity work.PGORF74_jukebox(behav);

  COMPONENT PGXOR2_jukebox
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PGXOR2_jukebox use entity work.PGXOR2_jukebox(behav);

  COMPONENT PGDFFR_jukebox
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
  for all :  PGDFFR_jukebox use entity work.PGDFFR_jukebox(behav);

  COMPONENT PGINVI_jukebox
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A0 : IN std_logic;
        ZN0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PGINVI_jukebox use entity work.PGINVI_jukebox(behav);

  COMPONENT PGAND8_jukebox
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A7 : IN std_logic;
        A6 : IN std_logic;
        A5 : IN std_logic;
        A4 : IN std_logic;
        A3 : IN std_logic;
        A2 : IN std_logic;
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PGAND8_jukebox use entity work.PGAND8_jukebox(behav);

  COMPONENT PGAND9_jukebox
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A8 : IN std_logic;
        A7 : IN std_logic;
        A6 : IN std_logic;
        A5 : IN std_logic;
        A4 : IN std_logic;
        A3 : IN std_logic;
        A2 : IN std_logic;
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PGAND9_jukebox use entity work.PGAND9_jukebox(behav);

  COMPONENT PXIN_jukebox
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        XI0 : IN std_logic;
        Z0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PXIN_jukebox use entity work.PXIN_jukebox(behav);

  COMPONENT PXOUT_jukebox
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A0 : IN std_logic;
        XO0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PXOUT_jukebox use entity work.PXOUT_jukebox(behav);

BEGIN

GLB_A1_P19 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => A1_P19, A5 => A1_IN4, A4 => A1_IN11B, A3 => A1_IN12B, 
	A2 => A1_IN15B, A1 => A1_IN16, A0 => A1_IN17);
GLB_A1_P18 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A1_P18, A5 => A1_IN4, A4 => A1_IN8, A3 => A1_IN12B, 
	A2 => A1_IN15B, A1 => A1_IN16, A0 => A1_IN17);
GLB_A1_P17 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A1_P17, A5 => A1_IN1, A4 => A1_IN8, A3 => A1_IN12B, 
	A2 => A1_IN15B, A1 => A1_IN16, A0 => A1_IN17);
GLB_A1_P16 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A1_P16, A5 => A1_IN4, A4 => A1_IN11B, A3 => A1_IN12B, 
	A2 => A1_IN15B, A1 => A1_IN16B, A0 => A1_IN17B);
GLB_A1_P15 : PGAND7_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A1_P15, A6 => A1_IN8, A5 => A1_IN9, A4 => A1_IN11, 
	A3 => A1_IN12B, A2 => A1_IN15B, A1 => A1_IN16, A0 => A1_IN17);
GLB_A1_P14 : PGAND7_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A1_P14, A6 => A1_IN0B, A5 => A1_IN8, A4 => A1_IN11B, 
	A3 => A1_IN12B, A2 => A1_IN15B, A1 => A1_IN16, A0 => A1_IN17);
GLB_A1_P12 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => A1_P12, A4 => A1_IN8, A3 => A1_IN11, A2 => A1_IN12B, 
	A1 => A1_IN16, A0 => A1_IN17B);
GLB_A1_P11 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A1_P11, A4 => A1_IN8B, A3 => A1_IN11, A2 => A1_IN12B, 
	A1 => A1_IN15B, A0 => A1_IN16);
GLB_A1_P10 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A1_P10, A5 => A1_IN4, A4 => A1_IN8, A3 => A1_IN11B, 
	A2 => A1_IN12B, A1 => A1_IN16B, A0 => A1_IN17B);
GLB_A1_P9 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A1_P9, A5 => A1_IN8B, A4 => A1_IN11B, A3 => A1_IN12, 
	A2 => A1_IN15B, A1 => A1_IN16B, A0 => A1_IN17B);
GLB_A1_P8 : PGAND10_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => A1_P8, A9 => A1_IN0, A8 => A1_IN1B, A7 => A1_IN4B, 
	A6 => A1_IN8, A5 => A1_IN9, A4 => A1_IN11B, A3 => A1_IN12B, 
	A2 => A1_IN15B, A1 => A1_IN16, A0 => A1_IN17);
GLB_A1_P7 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A1_P7, A3 => A1_IN12B, A2 => A1_IN15B, A1 => A1_IN16, 
	A0 => A1_IN17);
GLB_A1_P6 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A1_P6, A3 => A1_IN8B, A2 => A1_IN11B, A1 => A1_IN15B, 
	A0 => A1_IN17B);
GLB_A1_P3 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A1_P3, A4 => A1_IN8B, A3 => A1_IN11B, A2 => A1_IN15B, 
	A1 => A1_IN16, A0 => A1_IN17B);
GLB_A1_P2 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A1_P2, A4 => A1_IN8B, A3 => A1_IN12B, A2 => A1_IN15B, 
	A1 => A1_IN16, A0 => A1_IN17B);
GLB_A1_P1 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A1_P1, A5 => A1_IN4, A4 => A1_IN8, A3 => A1_IN11, 
	A2 => A1_IN12B, A1 => A1_IN16, A0 => A1_IN17B);
GLB_A1_P0 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => A1_P0, A5 => A1_IN4, A4 => A1_IN8, A3 => A1_IN11B, 
	A2 => A1_IN12B, A1 => A1_IN16B, A0 => A1_IN17B);
GLB_A1_G2 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A1_G2, A0 => A1_F4);
GLB_A1_G1 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A1_G1, A0 => A1_F1);
GLB_A1_G0 : PGORF72_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A1_G0, A1 => A1_F0, A0 => A1_F5);
GLB_A1_F5 : PGORF76_jukebox
    GENERIC MAP (TRISE => 3.000000 ns, TFALL => 3.000000 ns)
	PORT MAP (Z0 => A1_F5, A5 => A1_P14, A4 => A1_P15, A3 => A1_P16, 
	A2 => A1_P19, A1 => A1_P17, A0 => A1_P18);
GLB_A1_F4 : PGORF75_jukebox
    GENERIC MAP (TRISE => 3.000000 ns, TFALL => 3.000000 ns)
	PORT MAP (Z0 => A1_F4, A4 => A1_P8, A3 => A1_P9, A2 => A1_P10, 
	A1 => A1_P11, A0 => A1_P12);
GLB_A1_F1 : PGORF72_jukebox
    GENERIC MAP (TRISE => 3.000000 ns, TFALL => 3.000000 ns)
	PORT MAP (Z0 => A1_F1, A1 => A1_P6, A0 => A1_P7);
GLB_A1_F0 : PGORF74_jukebox
    GENERIC MAP (TRISE => 3.000000 ns, TFALL => 3.000000 ns)
	PORT MAP (Z0 => A1_F0, A3 => A1_P0, A2 => A1_P1, A1 => A1_P2, 
	A0 => A1_P3);
GLB_A1_CLK : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A1_CLK, A0 => CLOCKX_clk0);
GLB_A1_X1MO : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => A1_X1MO, A0 => A1_G1);
GLB_A1_IN1 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A1_IN1, A0 => MCS2X_grp);
GLB_A1_IN12 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A1_IN12, A0 => DR0_PIN_grp);
GLB_A1_IN9 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A1_IN9, A0 => DTRX_grp);
GLB_A1_IN0 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A1_IN0, A0 => MCS1X_grp);
GLB_A1_IN17 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A1_IN17, A0 => RAS_PIN_ffb);
GLB_A1_IN16 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A1_IN16, A0 => DRAM_PIN_ffb);
GLB_A1_IN11 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A1_IN11, A0 => DR1_PIN_grp);
GLB_A1_IN8 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A1_IN8, A0 => CAS_PIN_grp);
GLB_A1_IN4 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A1_IN4, A0 => RESETX_grp);
GLB_RAS_PIN_D0 : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => RAS_PIN_D0, A1 => GND, A0 => A1_G0);
GLB_DRAM_PIN_D0 : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => DRAM_PIN_D0, A1 => A1_X1MO, A0 => A1_G2);
GLB_RAS_PIN : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 0.900000 ns, LHCQ => 0.900000 ns, HLRQ => 1.700000 ns, SUD0 => 1.300000 ns, 
        SUD1 => 1.300000 ns, HOLDD0 => 2.300000 ns, HOLDD1 => 2.300000 ns, POSC1 => 4.000000 ns, 
        POSC0 => 4.000000 ns, NEGC1 => 4.000000 ns, NEGC0 => 4.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => RAS_PIN, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => A1_CLK, 
	D0 => RAS_PIN_D0);
GLB_DRAM_PIN : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 0.900000 ns, LHCQ => 0.900000 ns, HLRQ => 1.700000 ns, SUD0 => 1.300000 ns, 
        SUD1 => 1.300000 ns, HOLDD0 => 2.300000 ns, HOLDD1 => 2.300000 ns, POSC1 => 4.000000 ns, 
        POSC0 => 4.000000 ns, NEGC1 => 4.000000 ns, NEGC0 => 4.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => DRAM_PIN, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => A1_CLK, 
	D0 => DRAM_PIN_D0);
GLB_A1_IN0B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A1_IN0B, A0 => MCS1X_grp);
GLB_A1_IN4B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A1_IN4B, A0 => RESETX_grp);
GLB_A1_IN1B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A1_IN1B, A0 => MCS2X_grp);
GLB_A1_IN15B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A1_IN15B, A0 => MUX_PIN_grp);
GLB_A1_IN8B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A1_IN8B, A0 => CAS_PIN_grp);
GLB_A1_IN17B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A1_IN17B, A0 => RAS_PIN_ffb);
GLB_A1_IN16B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A1_IN16B, A0 => DRAM_PIN_ffb);
GLB_A1_IN12B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A1_IN12B, A0 => DR0_PIN_grp);
GLB_A1_IN11B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A1_IN11B, A0 => DR1_PIN_grp);
GLB_A3_P13 : PGAND7_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => A3_P13, A6 => A3_IN4B, A5 => A3_IN5B, A4 => A3_IN7B, 
	A3 => A3_IN8B, A2 => A3_IN11B, A1 => A3_IN15B, A0 => A3_IN16B);
GLB_A3_G3 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A3_G3, A0 => GND);
GLB_A3_CLK : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A3_CLK, A0 => CLOCKX_clk0);
GLB_A3_P13_xa : PGBUFI_jukebox
    GENERIC MAP (TRISE => 2.800000 ns, TFALL => 2.800000 ns)
	PORT MAP (Z0 => A3_P13_xa, A0 => A3_P13);
GLB_DR0_PIN_D0 : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => DR0_PIN_D0, A1 => A3_P13_xa, A0 => A3_G3);
GLB_DR0_PIN : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 0.900000 ns, LHCQ => 0.900000 ns, HLRQ => 1.700000 ns, SUD0 => 1.300000 ns, 
        SUD1 => 1.300000 ns, HOLDD0 => 2.300000 ns, HOLDD1 => 2.300000 ns, POSC1 => 4.000000 ns, 
        POSC0 => 4.000000 ns, NEGC1 => 4.000000 ns, NEGC0 => 4.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => DR0_PIN, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => A3_CLK, 
	D0 => DR0_PIN_D0);
GLB_A3_IN16B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A3_IN16B, A0 => DR0_PIN_ffb);
GLB_A3_IN15B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A3_IN15B, A0 => MUX_PIN_grp);
GLB_A3_IN11B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A3_IN11B, A0 => DR1_PIN_grp);
GLB_A3_IN8B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A3_IN8B, A0 => CAS_PIN_grp);
GLB_A3_IN7B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A3_IN7B, A0 => RAS_PIN_grp);
GLB_A3_IN5B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A3_IN5B, A0 => DRAM_PIN_grp);
GLB_A3_IN4B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A3_IN4B, A0 => RESETX_grp);
GLB_A6_P12 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => A6_P12, A5 => A6_IN4, A4 => A6_IN5, A3 => A6_IN7, 
	A2 => A6_IN12B, A1 => A6_IN15B, A0 => A6_IN17B);
GLB_A6_P11 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A6_P11, A5 => A6_IN5, A4 => A6_IN7B, A3 => A6_IN12B, 
	A2 => A6_IN15, A1 => A6_IN16, A0 => A6_IN17);
GLB_A6_P10 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A6_P10, A5 => A6_IN5B, A4 => A6_IN7B, A3 => A6_IN12B, 
	A2 => A6_IN15, A1 => A6_IN16, A0 => A6_IN17B);
GLB_A6_P9 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A6_P9, A5 => A6_IN4, A4 => A6_IN5, A3 => A6_IN7B, 
	A2 => A6_IN12B, A1 => A6_IN15B, A0 => A6_IN17);
GLB_A6_P8 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => A6_P8, A5 => A6_IN4, A4 => A6_IN5B, A3 => A6_IN7B, 
	A2 => A6_IN12B, A1 => A6_IN15B, A0 => A6_IN17B);
GLB_A6_P7 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A6_P7, A4 => A6_IN5, A3 => A6_IN7B, A2 => A6_IN15B, 
	A1 => A6_IN16B, A0 => A6_IN17B);
GLB_A6_P6 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A6_P6, A4 => A6_IN5, A3 => A6_IN7B, A2 => A6_IN12B, 
	A1 => A6_IN15B, A0 => A6_IN16B);
GLB_A6_P5 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A6_P5, A5 => A6_IN0, A4 => A6_IN5, A3 => A6_IN7, 
	A2 => A6_IN12B, A1 => A6_IN15B, A0 => A6_IN16);
GLB_A6_P4 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => A6_P4, A5 => A6_IN5, A4 => A6_IN7, A3 => A6_IN12B, 
	A2 => A6_IN15B, A1 => A6_IN16, A0 => A6_IN17);
GLB_A6_P3 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A6_P3, A5 => A6_IN4B, A4 => A6_IN5, A3 => A6_IN7B, 
	A2 => A6_IN12B, A1 => A6_IN16, A0 => A6_IN17);
GLB_A6_P2 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A6_P2, A5 => A6_IN4B, A4 => A6_IN5, A3 => A6_IN7B, 
	A2 => A6_IN12B, A1 => A6_IN15B, A0 => A6_IN17);
GLB_A6_P1 : PGAND8_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A6_P1, A7 => A6_IN1B, A6 => A6_IN4B, A5 => A6_IN5, 
	A4 => A6_IN9B, A3 => A6_IN12B, A2 => A6_IN15B, A1 => A6_IN16, 
	A0 => A6_IN17);
GLB_A6_P0 : PGAND9_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => A6_P0, A8 => A6_IN0, A7 => A6_IN1B, A6 => A6_IN4B, 
	A5 => A6_IN5, A4 => A6_IN7, A3 => A6_IN9B, A2 => A6_IN12B, 
	A1 => A6_IN15B, A0 => A6_IN16);
GLB_A6_G3 : PGORF72_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A6_G3, A1 => A6_F1, A0 => A6_F4);
GLB_A6_F4 : PGORF75_jukebox
    GENERIC MAP (TRISE => 3.000000 ns, TFALL => 3.000000 ns)
	PORT MAP (Z0 => A6_F4, A4 => A6_P8, A3 => A6_P9, A2 => A6_P10, 
	A1 => A6_P11, A0 => A6_P12);
GLB_A6_F1 : PGORF74_jukebox
    GENERIC MAP (TRISE => 3.000000 ns, TFALL => 3.000000 ns)
	PORT MAP (Z0 => A6_F1, A3 => A6_P4, A2 => A6_P5, A1 => A6_P6, 
	A0 => A6_P7);
GLB_DR1_PIN_D0 : PGORF74_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => DR1_PIN_D0, A3 => A6_P0, A2 => A6_P1, A1 => A6_P2, 
	A0 => A6_P3);
GLB_A6_CLK : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A6_CLK, A0 => CLOCKX_clk0);
GLB_A6_IN15 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A6_IN15, A0 => MUX_PIN_grp);
GLB_A6_IN4 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A6_IN4, A0 => RESETX_grp);
GLB_A6_IN17 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A6_IN17, A0 => DR1_PIN_ffb);
GLB_A6_IN16 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A6_IN16, A0 => CAS_PIN_ffb);
GLB_A6_IN7 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A6_IN7, A0 => RAS_PIN_grp);
GLB_A6_IN5 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A6_IN5, A0 => DRAM_PIN_grp);
GLB_A6_IN0 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A6_IN0, A0 => MCS1X_grp);
GLB_CAS_PIN_D0 : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => CAS_PIN_D0, A1 => GND, A0 => A6_G3);
GLB_DR1_PIN : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 0.900000 ns, LHCQ => 0.900000 ns, HLRQ => 1.700000 ns, SUD0 => 1.300000 ns, 
        SUD1 => 1.300000 ns, HOLDD0 => 2.300000 ns, HOLDD1 => 2.300000 ns, POSC1 => 4.000000 ns, 
        POSC0 => 4.000000 ns, NEGC1 => 4.000000 ns, NEGC0 => 4.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => DR1_PIN, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => A6_CLK, 
	D0 => DR1_PIN_D0);
GLB_CAS_PIN : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 0.900000 ns, LHCQ => 0.900000 ns, HLRQ => 1.700000 ns, SUD0 => 1.300000 ns, 
        SUD1 => 1.300000 ns, HOLDD0 => 2.300000 ns, HOLDD1 => 2.300000 ns, POSC1 => 4.000000 ns, 
        POSC0 => 4.000000 ns, NEGC1 => 4.000000 ns, NEGC0 => 4.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => CAS_PIN, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => A6_CLK, 
	D0 => CAS_PIN_D0);
GLB_A6_IN5B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A6_IN5B, A0 => DRAM_PIN_grp);
GLB_A6_IN17B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A6_IN17B, A0 => DR1_PIN_ffb);
GLB_A6_IN16B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A6_IN16B, A0 => CAS_PIN_ffb);
GLB_A6_IN7B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A6_IN7B, A0 => RAS_PIN_grp);
GLB_A6_IN15B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A6_IN15B, A0 => MUX_PIN_grp);
GLB_A6_IN12B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A6_IN12B, A0 => DR0_PIN_grp);
GLB_A6_IN9B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A6_IN9B, A0 => DTRX_grp);
GLB_A6_IN4B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A6_IN4B, A0 => RESETX_grp);
GLB_A6_IN1B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A6_IN1B, A0 => MCS2X_grp);
GLB_A7_P3 : PGAND9_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A7_P3, A8 => A7_IN0, A7 => A7_IN1B, A6 => A7_IN4B, 
	A5 => A7_IN5, A4 => A7_IN7, A3 => A7_IN8, A2 => A7_IN11B, 
	A1 => A7_IN12B, A0 => A7_IN17B);
GLB_A7_P2 : PGAND9_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A7_P2, A8 => A7_IN1B, A7 => A7_IN4B, A6 => A7_IN5, 
	A5 => A7_IN7, A4 => A7_IN8, A3 => A7_IN9B, A2 => A7_IN11, 
	A1 => A7_IN12B, A0 => A7_IN17B);
GLB_MUX_PIN_D0 : PGORF72_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => MUX_PIN_D0, A1 => A7_P2, A0 => A7_P3);
GLB_A7_CLK : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A7_CLK, A0 => CLOCKX_clk0);
GLB_A7_IN0 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A7_IN0, A0 => MCS1X_grp);
GLB_A7_IN11 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A7_IN11, A0 => DR1_PIN_grp);
GLB_A7_IN8 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A7_IN8, A0 => CAS_PIN_grp);
GLB_A7_IN7 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A7_IN7, A0 => RAS_PIN_grp);
GLB_A7_IN5 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A7_IN5, A0 => DRAM_PIN_grp);
GLB_MUX_PIN : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 0.900000 ns, LHCQ => 0.900000 ns, HLRQ => 1.700000 ns, SUD0 => 1.300000 ns, 
        SUD1 => 1.300000 ns, HOLDD0 => 2.300000 ns, HOLDD1 => 2.300000 ns, POSC1 => 4.000000 ns, 
        POSC0 => 4.000000 ns, NEGC1 => 4.000000 ns, NEGC0 => 4.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => MUX_PIN, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => A7_CLK, 
	D0 => MUX_PIN_D0);
GLB_A7_IN11B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A7_IN11B, A0 => DR1_PIN_grp);
GLB_A7_IN17B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A7_IN17B, A0 => MUX_PIN_ffb);
GLB_A7_IN12B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A7_IN12B, A0 => DR0_PIN_grp);
GLB_A7_IN9B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A7_IN9B, A0 => DTRX_grp);
GLB_A7_IN4B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A7_IN4B, A0 => RESETX_grp);
GLB_A7_IN1B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A7_IN1B, A0 => MCS2X_grp);
GLB_B3_P4 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => B3_P4, A5 => B3_IN0B, A4 => B3_IN3B, A3 => B3_IN4B, 
	A2 => B3_IN7, A1 => B3_IN8, A0 => B3_IN10);
GLB_B3_G1 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B3_G1, A0 => GND);
GLB_B3_P4_xa : PGBUFI_jukebox
    GENERIC MAP (TRISE => 2.800000 ns, TFALL => 2.800000 ns)
	PORT MAP (Z0 => B3_P4_xa, A0 => B3_P4);
GLB_SRDY_D : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => SRDY_D, A0 => B3_X2O);
GLB_B3_IN10 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B3_IN10, A0 => DRAM_PIN_grp);
GLB_B3_IN8 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B3_IN8, A0 => RAS_PIN_grp);
GLB_B3_IN7 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B3_IN7, A0 => CAS_PIN_grp);
GLB_B3_X2O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => B3_X2O, A1 => B3_P4_xa, A0 => B3_G1);
GLB_B3_IN4B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B3_IN4B, A0 => DR1_PIN_grp);
GLB_B3_IN3B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B3_IN3B, A0 => DR0_PIN_grp);
GLB_B3_IN0B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B3_IN0B, A0 => MUX_PIN_grp);
IOC_L2L_KEYWD_RESET : PXIN_jukebox
    GENERIC MAP (TRISE => 7.800000 ns, TFALL => 7.800000 ns)
	PORT MAP (Z0 => L2L_KEYWD_RESETb, XI0 => XRESET);
IOC_IO20_IBUFO : PXIN_jukebox
    GENERIC MAP (TRISE => 1.400000 ns, TFALL => 1.400000 ns)
	PORT MAP (Z0 => IO20_IBUFO, XI0 => RESET);
IOC_IO17_IBUFO : PXIN_jukebox
    GENERIC MAP (TRISE => 1.400000 ns, TFALL => 1.400000 ns)
	PORT MAP (Z0 => IO17_IBUFO, XI0 => MCS2);
IOC_IO16_IBUFO : PXIN_jukebox
    GENERIC MAP (TRISE => 1.400000 ns, TFALL => 1.400000 ns)
	PORT MAP (Z0 => IO16_IBUFO, XI0 => MCS1);
IOC_IO25_IBUFO : PXIN_jukebox
    GENERIC MAP (TRISE => 1.400000 ns, TFALL => 1.400000 ns)
	PORT MAP (Z0 => IO25_IBUFO, XI0 => DTR);
IOC_CLOCKX : PXIN_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => CLOCKX, XI0 => CLOCK);
IOC_SRDY : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (XO0 => SRDY, A0 => IO30_OBUFI);
IOC_IO30_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO30_OBUFI, A0 => SRDY_D_iomux);
IOC_RAS : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (XO0 => RAS, A0 => IO7_OBUFI);
IOC_IO7_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO7_OBUFI, A0 => RAS_PIN_iomux);
IOC_MUX : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (XO0 => MUX, A0 => IO3_OBUFI);
IOC_IO3_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO3_OBUFI, A0 => MUX_PIN_iomux);
IOC_DRAM : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (XO0 => DRAM, A0 => IO5_OBUFI);
IOC_IO5_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO5_OBUFI, A0 => DRAM_PIN_iomux);
IOC_DR1 : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (XO0 => DR1, A0 => IO11_OBUFI);
IOC_IO11_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO11_OBUFI, A0 => DR1_PIN_iomux);
IOC_DR0 : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (XO0 => DR0, A0 => IO0_OBUFI);
IOC_IO0_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO0_OBUFI, A0 => DR0_PIN_iomux);
IOC_CAS : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (XO0 => CAS, A0 => IO4_OBUFI);
IOC_IO4_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO4_OBUFI, A0 => CAS_PIN_iomux);
GRP_RAS_PIN_ffb : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => RAS_PIN_ffb, A0 => RAS_PIN);
GRP_RAS_PIN_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => RAS_PIN_grp, A0 => RAS_PIN);
GRP_RAS_PIN_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => RAS_PIN_iomux, A0 => RAS_PIN);
GRP_DRAM_PIN_ffb : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => DRAM_PIN_ffb, A0 => DRAM_PIN);
GRP_DRAM_PIN_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => DRAM_PIN_grp, A0 => DRAM_PIN);
GRP_DRAM_PIN_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => DRAM_PIN_iomux, A0 => DRAM_PIN);
GRP_CAS_PIN_ffb : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => CAS_PIN_ffb, A0 => CAS_PIN);
GRP_CAS_PIN_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => CAS_PIN_grp, A0 => CAS_PIN);
GRP_CAS_PIN_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => CAS_PIN_iomux, A0 => CAS_PIN);
GRP_DR0_PIN_ffb : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => DR0_PIN_ffb, A0 => DR0_PIN);
GRP_DR0_PIN_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => DR0_PIN_grp, A0 => DR0_PIN);
GRP_DR0_PIN_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => DR0_PIN_iomux, A0 => DR0_PIN);
GRP_DR1_PIN_ffb : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => DR1_PIN_ffb, A0 => DR1_PIN);
GRP_DR1_PIN_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => DR1_PIN_grp, A0 => DR1_PIN);
GRP_DR1_PIN_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => DR1_PIN_iomux, A0 => DR1_PIN);
GRP_DTRX_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.200000 ns, TFALL => 1.200000 ns)
	PORT MAP (Z0 => DTRX_grp, A0 => IO25_IBUFO);
GRP_MCS1X_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.200000 ns, TFALL => 1.200000 ns)
	PORT MAP (Z0 => MCS1X_grp, A0 => IO16_IBUFO);
GRP_MCS2X_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.200000 ns, TFALL => 1.200000 ns)
	PORT MAP (Z0 => MCS2X_grp, A0 => IO17_IBUFO);
GRP_MUX_PIN_ffb : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => MUX_PIN_ffb, A0 => MUX_PIN);
GRP_MUX_PIN_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => MUX_PIN_grp, A0 => MUX_PIN);
GRP_MUX_PIN_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => MUX_PIN_iomux, A0 => MUX_PIN);
GRP_RESETX_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => RESETX_grp, A0 => IO20_IBUFO);
GRP_CLOCKX_clk0 : PXIN_jukebox
    GENERIC MAP (TRISE => 2.400000 ns, TFALL => 2.400000 ns)
	PORT MAP (Z0 => CLOCKX_clk0, XI0 => CLOCKX);
GRP_SRDY_D_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => SRDY_D_iomux, A0 => SRDY_D);
GRP_L2L_KEYWD_RESET_glb : PXIN_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => L2L_KEYWD_RESET_glbb, XI0 => L2L_KEYWD_RESETb);
END jukebox_STRUCTURE;
