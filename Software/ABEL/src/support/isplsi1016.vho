-- VHDL netlist for jukebox
-- Date: Sun Sep 25 15:42:28 2016
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

ENTITY PGAND2_jukebox IS 
    GENERIC (
        TRISE : TIME := 1 ns;
        TFALL : TIME := 1 ns
    );
    PORT (
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
END PGAND2_jukebox;

ARCHITECTURE behav OF PGAND2_jukebox IS 
BEGIN

    PROCESS (A1, A0)
    VARIABLE ZDF : std_logic;
    BEGIN
        ZDF := A1 AND A0;
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

ENTITY PGAND3_jukebox IS 
    GENERIC (
        TRISE : TIME := 1 ns;
        TFALL : TIME := 1 ns
    );
    PORT (
        A2 : IN std_logic;
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
END PGAND3_jukebox;

ARCHITECTURE behav OF PGAND3_jukebox IS 
BEGIN

    PROCESS (A2, A1, A0)
    VARIABLE ZDF : std_logic;
    BEGIN
        ZDF := A2 AND A1 AND A0;
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

ENTITY PGORF73_jukebox IS 
    GENERIC (
        TRISE : TIME := 1 ns;
        TFALL : TIME := 1 ns
    );
    PORT (
        A2 : IN std_logic;
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
END PGORF73_jukebox;

ARCHITECTURE behav OF PGORF73_jukebox IS 
BEGIN

    PROCESS (A2, A1, A0)
    VARIABLE ZDF : std_logic;
    BEGIN
        ZDF := A2 OR A1 OR A0;
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

ENTITY PGORF77_jukebox IS 
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
END PGORF77_jukebox;

ARCHITECTURE behav OF PGORF77_jukebox IS 
BEGIN

    PROCESS (A6, A5, A4, A3, 
		A2, A1, A0)
    VARIABLE ZDF : std_logic;
    BEGIN
        ZDF := A6 OR A5 OR A4 OR 
            A3 OR A2 OR A1 OR A0;
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
        MCS3 : IN std_logic;
        MCS2 : IN std_logic;
        MCS1 : IN std_logic;
        MCS0 : IN std_logic;
        ENC : IN std_logic;
        DTR : IN std_logic;
        CLOCK : IN std_logic;
        BTN : IN std_logic;
        A0 : IN std_logic;
        ST3 : OUT std_logic;
        ST2 : OUT std_logic;
        ST1 : OUT std_logic;
        ST0 : OUT std_logic;
        SRDY : OUT std_logic;
        RAS : OUT std_logic;
        OE2 : OUT std_logic;
        OE1 : OUT std_logic;
        MUX : OUT std_logic;
        ISRDY : OUT std_logic;
        INT3 : OUT std_logic;
        INT0 : OUT std_logic;
        DSRDY : OUT std_logic;
        DRAM : OUT std_logic;
        DR1 : OUT std_logic;
        DR0 : OUT std_logic;
        DIR1 : OUT std_logic;
        DIOW : OUT std_logic;
        DIOR : OUT std_logic;
        CS0 : OUT std_logic;
        CLKBA : OUT std_logic;
        CAS : OUT std_logic
    );
END jukebox;


ARCHITECTURE jukebox_STRUCTURE OF jukebox IS
SIGNAL GND : std_logic := '0';
SIGNAL  DR0_PIN_grpi, CAS_Q_part2_grpi, DR1_PIN_part2_grpi, DRAM_Q_grpi,
	 MUX_Q_grpi, RAS_Q_grpi, ST2_PIN_grpi, DSRDY_PIN_part2_grpi,
	 ISRDY_PIN_grpi, ST0_PIN_grpi, ST1_PIN_grpi, ST3_PIN_grpi,
	 L2L_KEYWD_RESETb, IO11_IBUFO, IO10_IBUFO, IO9_IBUFO,
	 IO8_IBUFO, IO17_IBUFO, IO4_IBUFO, CLOCKX,
	 IO16_IBUFO, IO1_IBUFO, IO12_OBUFI, ST3_PIN_iomux,
	 IO5_OBUFI, ST2_PIN_iomux, IO13_OBUFI, ST1_PIN_iomux,
	 IO2_OBUFI, ST0_PIN_iomux, IO0_OBUFI, SRDY_Q_iomux,
	 IO31_OBUFI, RAS_Q_iomux, IO22_OBUFI, AND_969_iomux,
	 IO24_OBUFI, OR_1124_iomux, IO28_OBUFI, MUX_Q_iomux,
	 IO20_OBUFI, ISRDY_PIN_iomux, IO14_OBUFI, INT3_Q_iomux,
	 IO15_OBUFI, INT0_Q_iomux, IO7_OBUFI, DSRDY_PIN_part1_iomux,
	 IO29_OBUFI, DRAM_Q_iomux, IO6_OBUFI, DR1_PIN_part1_iomux,
	 IO3_OBUFI, DR0_PIN_iomux, IO23_OBUFI, GND_1127_iomux,
	 IO25_OBUFI, GND_1126_iomux, IO26_OBUFI, DIOR_D_iomux,
	 IO27_OBUFI, OR_968_iomux, IO21_OBUFI, CLKBA_D_iomux,
	 IO30_OBUFI, CAS_Q_part1_iomux, DR0_PIN, A1_CLK,
	 A1_P0_xa, A1_X3O, A1_G0, DR0_PIN_ffb,
	 A1_P0, A1_IN8B, A1_IN9B, A1_IN11B,
	 A1_IN12B, A1_IN13B, A1_IN17B, INT0_Q,
	 INT3_Q, ST2_PIN, SRDY_Q, A3_CLK,
	 A3_P0_xa, A3_X3O, A3_P4_xa, A3_X2O,
	 A3_X1O, A3_P13_xa, A3_X0O, A3_G3,
	 A3_G2, A3_G1, A3_G0, A3_F4,
	 A3_P13, A3_IN4, A3_P12, A3_IN6,
	 A3_P11, A3_P10, A3_IN15, A3_P9,
	 A3_IN8, A3_IN16, ST2_PIN_ffb, A3_P8,
	 A3_IN1, A3_IN6B, A3_IN9, A3_IN12,
	 A3_IN14B, A3_IN15B, A3_IN16B, ENCX_grp,
	 A3_P4, A3_IN5B, BTNX_grp, A3_P0,
	 A3_IN0B, ST0_PIN, ST1_PIN, ST3_PIN,
	 A5_CLK, A5_P4_xa, A5_X2O, A5_G1,
	 A5_F3, A5_F2, A5_P16, A5_P15,
	 MCS1X_grp, A5_P14, A5_IN9, A5_IN12,
	 A5_P11, MCS0X_grp, ST0_PIN_ffb, A0X_grp,
	 A5_P10, A5_IN1B, A5_IN8, A5_IN13,
	 A5_IN16B, ST1_PIN_ffb, A5_P4, A5_IN4,
	 A5_IN13B, A5_IN17B, DSRDY_PIN_part1, DR1_PIN_part1,
	 DR1_PIN_part2, DSRDY_PIN_part2, A7_CLK, A7_P0_xa,
	 A7_X3O, A7_X2O, A7_X1O, A7_P13_xa,
	 A7_X0O, A7_G3, A7_G2, A7_G1,
	 A7_G0, A7_F1, A7_P13, A7_P7,
	 A7_P6, A7_IN0B, A7_P5, A7_IN16,
	 A7_P4, A7_IN4, A7_IN10B, A7_IN11,
	 A7_IN15B, DR1_PIN_part2_ffb, A7_P0, A7_IN0,
	 A7_IN7B, A7_IN8B, A7_IN9, A7_IN12,
	 A7_IN16B, ISRDY_PIN, B0_CLK, GND_1127,
	 B0_X3O, B0_G0, B0_F3, B0_P16,
	 B0_IN2, B0_IN10, B0_IN11, B0_P15,
	 B0_IN2B, B0_IN9B, B0_IN10B, B0_IN11B,
	 B1_P8_xa, CLKBA_D, B1_X1O, B1_G2,
	 OR_968, B1_P8, B1_IN9, B1_P3,
	 B1_IN10B, B1_P2, B1_IN2, B1_IN9B,
	 B1_IN11, RAS_Q, DRAM_Q, MUX_Q,
	 B2_CLK, B2_P0_xa, B2_X3O, B2_X1O,
	 B2_G2, B2_G1, B2_G0, B2_F4,
	 B2_F3, B2_F1, B2_F0, B2_P16,
	 B2_P15, B2_P12, B2_P11, B2_P10,
	 B2_IN8, B2_IN16B, B2_P9, B2_IN3,
	 B2_IN11, B2_P7, B2_P6, DTRX_grp,
	 B2_P5, B2_IN2, B2_IN11B, MCS2X_grp,
	 B2_P4, B2_IN4, B2_IN5B, B2_IN15,
	 B2_P3, B2_P2, B2_IN2B, B2_IN3B,
	 B2_IN17B, RAS_Q_ffb, DRAM_Q_ffb, B2_P0,
	 B2_IN7B, B2_IN8B, B2_IN16, B2_IN17,
	 CAS_Q_part1, CAS_Q_part2, L2L_KEYWD_RESET_glbb, B3_CLK,
	 CLOCKX_clk0, B3_X2O, B3_X0O, B3_G3,
	 B3_G1, B3_F5, B3_P19, B3_IN11B,
	 B3_P18, B3_IN6B, B3_P17, B3_IN7,
	 B3_P16, B3_IN2B, B3_P15, B3_IN15B,
	 B3_IN16B, MCS3X_grp, B3_P14, B3_IN4,
	 CAS_Q_part2_ffb, B3_P13, B3_IN2, B3_IN6,
	 B3_IN7B, B3_IN8B, B3_IN15, B3_IN16,
	 B4_P4_xa, AND_969, B4_X2O, B4_G1,
	 OR_1124, B4_P16, B4_P15, B4_IN11,
	 B4_P4, B4_IN2, B4_IN9B, B4_IN10B,
	 B4_IN11B, B6_P4_xa, DIOR_D, B6_X2O,
	 B6_G1, B6_P4, B6_IN9, B6_IN10B,
	 B6_IN11, GND_1126, B7_X1O, B7_G2 : std_logic;


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

  COMPONENT PGBUFI_jukebox
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PGBUFI_jukebox use entity work.PGBUFI_jukebox(behav);

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

  COMPONENT PGAND2_jukebox
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PGAND2_jukebox use entity work.PGAND2_jukebox(behav);

  COMPONENT PGAND3_jukebox
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A2 : IN std_logic;
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PGAND3_jukebox use entity work.PGAND3_jukebox(behav);

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

  COMPONENT PGORF73_jukebox
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A2 : IN std_logic;
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PGORF73_jukebox use entity work.PGORF73_jukebox(behav);

  COMPONENT PGORF72_jukebox
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PGORF72_jukebox use entity work.PGORF72_jukebox(behav);

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

  COMPONENT PGORF77_jukebox
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
  for all :  PGORF77_jukebox use entity work.PGORF77_jukebox(behav);

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

GLB_A1_P0 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => A1_P0, A5 => A1_IN8B, A4 => A1_IN9B, A3 => A1_IN11B, 
	A2 => A1_IN12B, A1 => A1_IN13B, A0 => A1_IN17B);
GLB_A1_G0 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => A1_G0, A0 => GND);
GLB_A1_CLK : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.200000 ns, TFALL => 0.200000 ns)
	PORT MAP (Z0 => A1_CLK, A0 => CLOCKX_clk0);
GLB_A1_P0_xa : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.500000 ns, TFALL => 0.500000 ns)
	PORT MAP (Z0 => A1_P0_xa, A0 => A1_P0);
GLB_A1_X3O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => A1_X3O, A1 => A1_P0_xa, A0 => A1_G0);
GLB_DR0_PIN : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 1.400000 ns, LHCQ => 1.400000 ns, HLRQ => 4.900000 ns, SUD0 => 0.300000 ns, 
        SUD1 => 0.300000 ns, HOLDD0 => 3.500000 ns, HOLDD1 => 3.500000 ns, POSC1 => 0.000000 ns, 
        POSC0 => 0.000000 ns, NEGC1 => 0.000000 ns, NEGC0 => 0.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => DR0_PIN, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => A1_CLK, 
	D0 => A1_X3O);
GLB_A1_IN17B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => A1_IN17B, A0 => DR0_PIN_ffb);
GLB_A1_IN13B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => A1_IN13B, A0 => DR1_PIN_part2_grpi);
GLB_A1_IN12B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => A1_IN12B, A0 => CAS_Q_part2_grpi);
GLB_A1_IN11B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => A1_IN11B, A0 => RAS_Q_grpi);
GLB_A1_IN9B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => A1_IN9B, A0 => DRAM_Q_grpi);
GLB_A1_IN8B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => A1_IN8B, A0 => MUX_Q_grpi);
GLB_A3_P13 : PGAND2_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => A3_P13, A1 => A3_IN4, A0 => A3_IN12);
GLB_A3_P12 : PGAND3_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => A3_P12, A2 => A3_IN6, A1 => A3_IN14B, A0 => A3_IN15);
GLB_A3_P11 : PGAND3_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => A3_P11, A2 => A3_IN14B, A1 => A3_IN15, A0 => A3_IN16);
GLB_A3_P10 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => A3_P10, A3 => A3_IN6B, A2 => A3_IN8, A1 => A3_IN15, 
	A0 => A3_IN16);
GLB_A3_P9 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => A3_P9, A4 => A3_IN1, A3 => A3_IN6B, A2 => A3_IN8, 
	A1 => A3_IN14B, A0 => A3_IN16);
GLB_A3_P8 : PGAND7_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => A3_P8, A6 => A3_IN1, A5 => A3_IN6B, A4 => A3_IN9, 
	A3 => A3_IN12, A2 => A3_IN14B, A1 => A3_IN15B, A0 => A3_IN16B);
GLB_A3_P4 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => A3_P4, A0 => A3_IN5B);
GLB_A3_P0 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => A3_P0, A0 => A3_IN0B);
GLB_A3_G3 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => A3_G3, A0 => GND);
GLB_A3_G2 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => A3_G2, A0 => A3_F4);
GLB_A3_G1 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => A3_G1, A0 => GND);
GLB_A3_G0 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => A3_G0, A0 => GND);
GLB_A3_F4 : PGORF75_jukebox
    GENERIC MAP (TRISE => 0.500000 ns, TFALL => 0.500000 ns)
	PORT MAP (Z0 => A3_F4, A4 => A3_P8, A3 => A3_P9, A2 => A3_P10, 
	A1 => A3_P11, A0 => A3_P12);
GLB_A3_CLK : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.200000 ns, TFALL => 0.200000 ns)
	PORT MAP (Z0 => A3_CLK, A0 => CLOCKX_clk0);
GLB_A3_P0_xa : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.500000 ns, TFALL => 0.500000 ns)
	PORT MAP (Z0 => A3_P0_xa, A0 => A3_P0);
GLB_A3_P4_xa : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.500000 ns, TFALL => 0.500000 ns)
	PORT MAP (Z0 => A3_P4_xa, A0 => A3_P4);
GLB_A3_P13_xa : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.500000 ns, TFALL => 0.500000 ns)
	PORT MAP (Z0 => A3_P13_xa, A0 => A3_P13);
GLB_A3_IN4 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => A3_IN4, A0 => ISRDY_PIN_grpi);
GLB_A3_IN6 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => A3_IN6, A0 => ST0_PIN_grpi);
GLB_A3_IN15 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => A3_IN15, A0 => ST3_PIN_grpi);
GLB_A3_IN16 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => A3_IN16, A0 => ST2_PIN_ffb);
GLB_A3_IN8 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => A3_IN8, A0 => MCS0X_grp);
GLB_A3_IN12 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => A3_IN12, A0 => DSRDY_PIN_part2_grpi);
GLB_A3_IN9 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => A3_IN9, A0 => MCS1X_grp);
GLB_A3_IN1 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => A3_IN1, A0 => A0X_grp);
GLB_A3_X3O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => A3_X3O, A1 => A3_P0_xa, A0 => A3_G0);
GLB_A3_X2O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => A3_X2O, A1 => A3_P4_xa, A0 => A3_G1);
GLB_A3_X1O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => A3_X1O, A1 => GND, A0 => A3_G2);
GLB_A3_X0O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => A3_X0O, A1 => A3_P13_xa, A0 => A3_G3);
GLB_INT0_Q : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 1.400000 ns, LHCQ => 1.400000 ns, HLRQ => 4.900000 ns, SUD0 => 0.300000 ns, 
        SUD1 => 0.300000 ns, HOLDD0 => 3.500000 ns, HOLDD1 => 3.500000 ns, POSC1 => 0.000000 ns, 
        POSC0 => 0.000000 ns, NEGC1 => 0.000000 ns, NEGC0 => 0.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => INT0_Q, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => A3_CLK, 
	D0 => A3_X3O);
GLB_INT3_Q : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 1.400000 ns, LHCQ => 1.400000 ns, HLRQ => 4.900000 ns, SUD0 => 0.300000 ns, 
        SUD1 => 0.300000 ns, HOLDD0 => 3.500000 ns, HOLDD1 => 3.500000 ns, POSC1 => 0.000000 ns, 
        POSC0 => 0.000000 ns, NEGC1 => 0.000000 ns, NEGC0 => 0.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => INT3_Q, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => A3_CLK, 
	D0 => A3_X2O);
GLB_ST2_PIN : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 1.400000 ns, LHCQ => 1.400000 ns, HLRQ => 4.900000 ns, SUD0 => 0.300000 ns, 
        SUD1 => 0.300000 ns, HOLDD0 => 3.500000 ns, HOLDD1 => 3.500000 ns, POSC1 => 0.000000 ns, 
        POSC0 => 0.000000 ns, NEGC1 => 0.000000 ns, NEGC0 => 0.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => ST2_PIN, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => A3_CLK, 
	D0 => A3_X1O);
GLB_SRDY_Q : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 1.400000 ns, LHCQ => 1.400000 ns, HLRQ => 4.900000 ns, SUD0 => 0.300000 ns, 
        SUD1 => 0.300000 ns, HOLDD0 => 3.500000 ns, HOLDD1 => 3.500000 ns, POSC1 => 0.000000 ns, 
        POSC0 => 0.000000 ns, NEGC1 => 0.000000 ns, NEGC0 => 0.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => SRDY_Q, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => A3_CLK, 
	D0 => A3_X0O);
GLB_A3_IN16B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => A3_IN16B, A0 => ST2_PIN_ffb);
GLB_A3_IN15B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => A3_IN15B, A0 => ST3_PIN_grpi);
GLB_A3_IN14B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => A3_IN14B, A0 => ST1_PIN_grpi);
GLB_A3_IN6B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => A3_IN6B, A0 => ST0_PIN_grpi);
GLB_A3_IN5B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => A3_IN5B, A0 => ENCX_grp);
GLB_A3_IN0B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => A3_IN0B, A0 => BTNX_grp);
GLB_A5_P16 : PGAND2_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => A5_P16, A1 => A5_IN4, A0 => A5_IN17B);
GLB_A5_P15 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => A5_P15, A4 => A5_IN1B, A3 => A5_IN4, A2 => A5_IN8, 
	A1 => A5_IN13, A0 => A5_IN16B);
GLB_A5_P14 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => A5_P14, A5 => A5_IN1B, A4 => A5_IN9, A3 => A5_IN12, 
	A2 => A5_IN13B, A1 => A5_IN16B, A0 => A5_IN17B);
GLB_A5_P11 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => A5_P11, A3 => A5_IN4, A2 => A5_IN13, A1 => A5_IN16B, 
	A0 => A5_IN17B);
GLB_A5_P10 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => A5_P10, A4 => A5_IN1B, A3 => A5_IN4, A2 => A5_IN8, 
	A1 => A5_IN13, A0 => A5_IN16B);
GLB_A5_P4 : PGAND3_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => A5_P4, A2 => A5_IN4, A1 => A5_IN13B, A0 => A5_IN17B);
GLB_A5_G1 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => A5_G1, A0 => GND);
GLB_A5_F3 : PGORF73_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => A5_F3, A2 => A5_P14, A1 => A5_P15, A0 => A5_P16);
GLB_A5_F2 : PGORF72_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => A5_F2, A1 => A5_P10, A0 => A5_P11);
GLB_A5_CLK : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.200000 ns, TFALL => 0.200000 ns)
	PORT MAP (Z0 => A5_CLK, A0 => CLOCKX_clk0);
GLB_A5_P4_xa : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.500000 ns, TFALL => 0.500000 ns)
	PORT MAP (Z0 => A5_P4_xa, A0 => A5_P4);
GLB_A5_IN12 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => A5_IN12, A0 => DSRDY_PIN_part2_grpi);
GLB_A5_IN9 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => A5_IN9, A0 => MCS1X_grp);
GLB_A5_IN13 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => A5_IN13, A0 => ST2_PIN_grpi);
GLB_A5_IN8 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => A5_IN8, A0 => MCS0X_grp);
GLB_A5_IN4 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => A5_IN4, A0 => ST3_PIN_grpi);
GLB_A5_X2O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => A5_X2O, A1 => A5_P4_xa, A0 => A5_G1);
GLB_ST0_PIN : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 1.400000 ns, LHCQ => 1.400000 ns, HLRQ => 4.900000 ns, SUD0 => 0.300000 ns, 
        SUD1 => 0.300000 ns, HOLDD0 => 3.500000 ns, HOLDD1 => 3.500000 ns, POSC1 => 0.000000 ns, 
        POSC0 => 0.000000 ns, NEGC1 => 0.000000 ns, NEGC0 => 0.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => ST0_PIN, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => A5_CLK, 
	D0 => A5_X2O);
GLB_ST1_PIN : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 1.400000 ns, LHCQ => 1.400000 ns, HLRQ => 4.900000 ns, SUD0 => 0.300000 ns, 
        SUD1 => 0.300000 ns, HOLDD0 => 3.500000 ns, HOLDD1 => 3.500000 ns, POSC1 => 0.000000 ns, 
        POSC0 => 0.000000 ns, NEGC1 => 0.000000 ns, NEGC0 => 0.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => ST1_PIN, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => A5_CLK, 
	D0 => A5_F2);
GLB_ST3_PIN : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 1.400000 ns, LHCQ => 1.400000 ns, HLRQ => 4.900000 ns, SUD0 => 0.300000 ns, 
        SUD1 => 0.300000 ns, HOLDD0 => 3.500000 ns, HOLDD1 => 3.500000 ns, POSC1 => 0.000000 ns, 
        POSC0 => 0.000000 ns, NEGC1 => 0.000000 ns, NEGC0 => 0.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => ST3_PIN, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => A5_CLK, 
	D0 => A5_F3);
GLB_A5_IN16B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => A5_IN16B, A0 => ST0_PIN_ffb);
GLB_A5_IN1B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => A5_IN1B, A0 => A0X_grp);
GLB_A5_IN17B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => A5_IN17B, A0 => ST1_PIN_ffb);
GLB_A5_IN13B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => A5_IN13B, A0 => ST2_PIN_grpi);
GLB_A7_P13 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => A7_P13, A5 => A7_IN0, A4 => A7_IN7B, A3 => A7_IN8B, 
	A2 => A7_IN9, A1 => A7_IN12, A0 => A7_IN16B);
GLB_A7_P7 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => A7_P7, A4 => A7_IN0B, A3 => A7_IN7B, A2 => A7_IN9, 
	A1 => A7_IN12, A0 => A7_IN16);
GLB_A7_P6 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => A7_P6, A4 => A7_IN0B, A3 => A7_IN7B, A2 => A7_IN8B, 
	A1 => A7_IN9, A0 => A7_IN16);
GLB_A7_P5 : PGAND7_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => A7_P5, A6 => A7_IN7B, A5 => A7_IN8B, A4 => A7_IN9, 
	A3 => A7_IN10B, A2 => A7_IN12, A1 => A7_IN15B, A0 => A7_IN16);
GLB_A7_P4 : PGAND9_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => A7_P4, A8 => A7_IN0, A7 => A7_IN4, A6 => A7_IN7B, 
	A5 => A7_IN8B, A4 => A7_IN9, A3 => A7_IN10B, A2 => A7_IN11, 
	A1 => A7_IN12, A0 => A7_IN15B);
GLB_A7_P0 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => A7_P0, A5 => A7_IN0, A4 => A7_IN7B, A3 => A7_IN8B, 
	A2 => A7_IN9, A1 => A7_IN12, A0 => A7_IN16B);
GLB_A7_G3 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => A7_G3, A0 => GND);
GLB_A7_G2 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => A7_G2, A0 => A7_F1);
GLB_A7_G1 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => A7_G1, A0 => A7_F1);
GLB_A7_G0 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => A7_G0, A0 => GND);
GLB_A7_F1 : PGORF74_jukebox
    GENERIC MAP (TRISE => 0.500000 ns, TFALL => 0.500000 ns)
	PORT MAP (Z0 => A7_F1, A3 => A7_P4, A2 => A7_P5, A1 => A7_P6, 
	A0 => A7_P7);
GLB_A7_CLK : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.200000 ns, TFALL => 0.200000 ns)
	PORT MAP (Z0 => A7_CLK, A0 => CLOCKX_clk0);
GLB_A7_P0_xa : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.500000 ns, TFALL => 0.500000 ns)
	PORT MAP (Z0 => A7_P0_xa, A0 => A7_P0);
GLB_A7_P13_xa : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.500000 ns, TFALL => 0.500000 ns)
	PORT MAP (Z0 => A7_P13_xa, A0 => A7_P13);
GLB_A7_IN16 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => A7_IN16, A0 => DR1_PIN_part2_ffb);
GLB_A7_IN11 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => A7_IN11, A0 => MCS3X_grp);
GLB_A7_IN4 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => A7_IN4, A0 => ISRDY_PIN_grpi);
GLB_A7_IN12 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => A7_IN12, A0 => CAS_Q_part2_grpi);
GLB_A7_IN9 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => A7_IN9, A0 => DRAM_Q_grpi);
GLB_A7_IN0 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => A7_IN0, A0 => RAS_Q_grpi);
GLB_A7_X3O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => A7_X3O, A1 => A7_P0_xa, A0 => A7_G0);
GLB_A7_X2O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => A7_X2O, A1 => GND, A0 => A7_G1);
GLB_A7_X1O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => A7_X1O, A1 => GND, A0 => A7_G2);
GLB_A7_X0O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => A7_X0O, A1 => A7_P13_xa, A0 => A7_G3);
GLB_DSRDY_PIN_part1 : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 1.400000 ns, LHCQ => 1.400000 ns, HLRQ => 4.900000 ns, SUD0 => 0.300000 ns, 
        SUD1 => 0.300000 ns, HOLDD0 => 3.500000 ns, HOLDD1 => 3.500000 ns, POSC1 => 0.000000 ns, 
        POSC0 => 0.000000 ns, NEGC1 => 0.000000 ns, NEGC0 => 0.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => DSRDY_PIN_part1, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => A7_CLK, 
	D0 => A7_X3O);
GLB_DR1_PIN_part1 : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 1.400000 ns, LHCQ => 1.400000 ns, HLRQ => 4.900000 ns, SUD0 => 0.300000 ns, 
        SUD1 => 0.300000 ns, HOLDD0 => 3.500000 ns, HOLDD1 => 3.500000 ns, POSC1 => 0.000000 ns, 
        POSC0 => 0.000000 ns, NEGC1 => 0.000000 ns, NEGC0 => 0.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => DR1_PIN_part1, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => A7_CLK, 
	D0 => A7_X2O);
GLB_DR1_PIN_part2 : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 1.400000 ns, LHCQ => 1.400000 ns, HLRQ => 4.900000 ns, SUD0 => 0.300000 ns, 
        SUD1 => 0.300000 ns, HOLDD0 => 3.500000 ns, HOLDD1 => 3.500000 ns, POSC1 => 0.000000 ns, 
        POSC0 => 0.000000 ns, NEGC1 => 0.000000 ns, NEGC0 => 0.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => DR1_PIN_part2, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => A7_CLK, 
	D0 => A7_X1O);
GLB_DSRDY_PIN_part2 : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 1.400000 ns, LHCQ => 1.400000 ns, HLRQ => 4.900000 ns, SUD0 => 0.300000 ns, 
        SUD1 => 0.300000 ns, HOLDD0 => 3.500000 ns, HOLDD1 => 3.500000 ns, POSC1 => 0.000000 ns, 
        POSC0 => 0.000000 ns, NEGC1 => 0.000000 ns, NEGC0 => 0.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => DSRDY_PIN_part2, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => A7_CLK, 
	D0 => A7_X0O);
GLB_A7_IN0B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => A7_IN0B, A0 => RAS_Q_grpi);
GLB_A7_IN15B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => A7_IN15B, A0 => DTRX_grp);
GLB_A7_IN10B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => A7_IN10B, A0 => MCS2X_grp);
GLB_A7_IN16B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => A7_IN16B, A0 => DR1_PIN_part2_ffb);
GLB_A7_IN8B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => A7_IN8B, A0 => MUX_Q_grpi);
GLB_A7_IN7B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => A7_IN7B, A0 => DR0_PIN_grpi);
GLB_B0_P16 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B0_P16, A3 => B0_IN2, A2 => B0_IN9B, A1 => B0_IN10, 
	A0 => B0_IN11);
GLB_B0_P15 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B0_P15, A3 => B0_IN2B, A2 => B0_IN9B, A1 => B0_IN10B, 
	A0 => B0_IN11B);
GLB_B0_G0 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => B0_G0, A0 => GND);
GLB_B0_F3 : PGORF72_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => B0_F3, A1 => B0_P15, A0 => B0_P16);
GLB_B0_CLK : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.200000 ns, TFALL => 0.200000 ns)
	PORT MAP (Z0 => B0_CLK, A0 => CLOCKX_clk0);
GLB_GND_1127 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.200000 ns, TFALL => 1.200000 ns)
	PORT MAP (Z0 => GND_1127, A0 => B0_X3O);
GLB_B0_IN11 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => B0_IN11, A0 => ST3_PIN_grpi);
GLB_B0_IN10 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => B0_IN10, A0 => ST1_PIN_grpi);
GLB_B0_IN2 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => B0_IN2, A0 => ST2_PIN_grpi);
GLB_B0_X3O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => B0_X3O, A1 => GND, A0 => B0_G0);
GLB_ISRDY_PIN : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 1.400000 ns, LHCQ => 1.400000 ns, HLRQ => 4.900000 ns, SUD0 => 0.300000 ns, 
        SUD1 => 0.300000 ns, HOLDD0 => 3.500000 ns, HOLDD1 => 3.500000 ns, POSC1 => 0.000000 ns, 
        POSC0 => 0.000000 ns, NEGC1 => 0.000000 ns, NEGC0 => 0.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => ISRDY_PIN, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => B0_CLK, 
	D0 => B0_F3);
GLB_B0_IN11B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => B0_IN11B, A0 => ST3_PIN_grpi);
GLB_B0_IN10B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => B0_IN10B, A0 => ST1_PIN_grpi);
GLB_B0_IN9B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => B0_IN9B, A0 => ST0_PIN_grpi);
GLB_B0_IN2B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => B0_IN2B, A0 => ST2_PIN_grpi);
GLB_B1_P8 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B1_P8, A3 => B1_IN2, A2 => B1_IN9, A1 => B1_IN10B, 
	A0 => B1_IN11);
GLB_B1_P3 : PGAND2_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B1_P3, A1 => B1_IN10B, A0 => B1_IN11);
GLB_B1_P2 : PGAND3_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B1_P2, A2 => B1_IN2, A1 => B1_IN9B, A0 => B1_IN11);
GLB_B1_G2 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => B1_G2, A0 => GND);
GLB_OR_968 : PGORF72_jukebox
    GENERIC MAP (TRISE => 0.600000 ns, TFALL => 0.600000 ns)
	PORT MAP (Z0 => OR_968, A1 => B1_P2, A0 => B1_P3);
GLB_B1_P8_xa : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.500000 ns, TFALL => 0.500000 ns)
	PORT MAP (Z0 => B1_P8_xa, A0 => B1_P8);
GLB_CLKBA_D : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.200000 ns, TFALL => 1.200000 ns)
	PORT MAP (Z0 => CLKBA_D, A0 => B1_X1O);
GLB_B1_IN9 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => B1_IN9, A0 => ST0_PIN_grpi);
GLB_B1_IN11 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => B1_IN11, A0 => ST3_PIN_grpi);
GLB_B1_IN2 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => B1_IN2, A0 => ST2_PIN_grpi);
GLB_B1_X1O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => B1_X1O, A1 => B1_P8_xa, A0 => B1_G2);
GLB_B1_IN10B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => B1_IN10B, A0 => ST1_PIN_grpi);
GLB_B1_IN9B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => B1_IN9B, A0 => ST0_PIN_grpi);
GLB_B2_P16 : PGAND8_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B2_P16, A7 => B2_IN2, A6 => B2_IN3, A5 => B2_IN5B, 
	A4 => B2_IN7B, A3 => B2_IN8B, A2 => B2_IN11B, A1 => B2_IN16, 
	A0 => B2_IN17);
GLB_B2_P15 : PGAND9_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B2_P15, A8 => B2_IN2B, A7 => B2_IN3, A6 => B2_IN4, 
	A5 => B2_IN5B, A4 => B2_IN7B, A3 => B2_IN8B, A2 => B2_IN15, 
	A1 => B2_IN16, A0 => B2_IN17);
GLB_B2_P12 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B2_P12, A4 => B2_IN2, A3 => B2_IN3, A2 => B2_IN8B, 
	A1 => B2_IN16, A0 => B2_IN17B);
GLB_B2_P11 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B2_P11, A4 => B2_IN2, A3 => B2_IN3B, A2 => B2_IN7B, 
	A1 => B2_IN8B, A0 => B2_IN16);
GLB_B2_P10 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B2_P10, A5 => B2_IN2B, A4 => B2_IN3B, A3 => B2_IN7B, 
	A2 => B2_IN8, A1 => B2_IN16B, A0 => B2_IN17B);
GLB_B2_P9 : PGAND10_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B2_P9, A9 => B2_IN2B, A8 => B2_IN3, A7 => B2_IN4, 
	A6 => B2_IN5B, A5 => B2_IN7B, A4 => B2_IN8B, A3 => B2_IN11, 
	A2 => B2_IN15, A1 => B2_IN16, A0 => B2_IN17);
GLB_B2_P7 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B2_P7, A3 => B2_IN3B, A2 => B2_IN7B, A1 => B2_IN8B, 
	A0 => B2_IN16);
GLB_B2_P6 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B2_P6, A4 => B2_IN2B, A3 => B2_IN3B, A2 => B2_IN7B, 
	A1 => B2_IN16, A0 => B2_IN17B);
GLB_B2_P5 : PGAND7_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B2_P5, A6 => B2_IN2, A5 => B2_IN5B, A4 => B2_IN7B, 
	A3 => B2_IN8B, A2 => B2_IN11B, A1 => B2_IN16, A0 => B2_IN17);
GLB_B2_P4 : PGAND8_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B2_P4, A7 => B2_IN2B, A6 => B2_IN4, A5 => B2_IN5B, 
	A4 => B2_IN7B, A3 => B2_IN8B, A2 => B2_IN15, A1 => B2_IN16, 
	A0 => B2_IN17);
GLB_B2_P3 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B2_P3, A3 => B2_IN7B, A2 => B2_IN8B, A1 => B2_IN16, 
	A0 => B2_IN17);
GLB_B2_P2 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B2_P2, A3 => B2_IN2B, A2 => B2_IN3B, A1 => B2_IN7B, 
	A0 => B2_IN17B);
GLB_B2_P0 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B2_P0, A3 => B2_IN7B, A2 => B2_IN8B, A1 => B2_IN16, 
	A0 => B2_IN17);
GLB_B2_G2 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => B2_G2, A0 => B2_F4);
GLB_B2_G1 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => B2_G1, A0 => B2_F0);
GLB_B2_G0 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => B2_G0, A0 => B2_F1);
GLB_B2_F4 : PGORF74_jukebox
    GENERIC MAP (TRISE => 0.500000 ns, TFALL => 0.500000 ns)
	PORT MAP (Z0 => B2_F4, A3 => B2_P9, A2 => B2_P10, A1 => B2_P11, 
	A0 => B2_P12);
GLB_B2_F3 : PGORF72_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => B2_F3, A1 => B2_P15, A0 => B2_P16);
GLB_B2_F1 : PGORF74_jukebox
    GENERIC MAP (TRISE => 0.500000 ns, TFALL => 0.500000 ns)
	PORT MAP (Z0 => B2_F1, A3 => B2_P4, A2 => B2_P5, A1 => B2_P6, 
	A0 => B2_P7);
GLB_B2_F0 : PGORF72_jukebox
    GENERIC MAP (TRISE => 0.500000 ns, TFALL => 0.500000 ns)
	PORT MAP (Z0 => B2_F0, A1 => B2_P2, A0 => B2_P3);
GLB_B2_CLK : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.200000 ns, TFALL => 0.200000 ns)
	PORT MAP (Z0 => B2_CLK, A0 => CLOCKX_clk0);
GLB_B2_P0_xa : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.500000 ns, TFALL => 0.500000 ns)
	PORT MAP (Z0 => B2_P0_xa, A0 => B2_P0);
GLB_B2_IN8 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => B2_IN8, A0 => DR0_PIN_grpi);
GLB_B2_IN11 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => B2_IN11, A0 => DTRX_grp);
GLB_B2_IN3 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => B2_IN3, A0 => CAS_Q_part2_grpi);
GLB_B2_IN2 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => B2_IN2, A0 => DR1_PIN_part2_grpi);
GLB_B2_IN15 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => B2_IN15, A0 => ISRDY_PIN_grpi);
GLB_B2_IN4 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => B2_IN4, A0 => MCS3X_grp);
GLB_B2_IN17 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => B2_IN17, A0 => RAS_Q_ffb);
GLB_B2_IN16 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => B2_IN16, A0 => DRAM_Q_ffb);
GLB_B2_X3O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => B2_X3O, A1 => B2_P0_xa, A0 => B2_G0);
GLB_B2_X1O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => B2_X1O, A1 => B2_G1, A0 => B2_G2);
GLB_RAS_Q : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 1.400000 ns, LHCQ => 1.400000 ns, HLRQ => 4.900000 ns, SUD0 => 0.300000 ns, 
        SUD1 => 0.300000 ns, HOLDD0 => 3.500000 ns, HOLDD1 => 3.500000 ns, POSC1 => 0.000000 ns, 
        POSC0 => 0.000000 ns, NEGC1 => 0.000000 ns, NEGC0 => 0.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => RAS_Q, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => B2_CLK, 
	D0 => B2_X3O);
GLB_DRAM_Q : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 1.400000 ns, LHCQ => 1.400000 ns, HLRQ => 4.900000 ns, SUD0 => 0.300000 ns, 
        SUD1 => 0.300000 ns, HOLDD0 => 3.500000 ns, HOLDD1 => 3.500000 ns, POSC1 => 0.000000 ns, 
        POSC0 => 0.000000 ns, NEGC1 => 0.000000 ns, NEGC0 => 0.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => DRAM_Q, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => B2_CLK, 
	D0 => B2_X1O);
GLB_MUX_Q : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 1.400000 ns, LHCQ => 1.400000 ns, HLRQ => 4.900000 ns, SUD0 => 0.300000 ns, 
        SUD1 => 0.300000 ns, HOLDD0 => 3.500000 ns, HOLDD1 => 3.500000 ns, POSC1 => 0.000000 ns, 
        POSC0 => 0.000000 ns, NEGC1 => 0.000000 ns, NEGC0 => 0.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => MUX_Q, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => B2_CLK, 
	D0 => B2_F3);
GLB_B2_IN16B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => B2_IN16B, A0 => DRAM_Q_ffb);
GLB_B2_IN11B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => B2_IN11B, A0 => DTRX_grp);
GLB_B2_IN5B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => B2_IN5B, A0 => MCS2X_grp);
GLB_B2_IN17B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => B2_IN17B, A0 => RAS_Q_ffb);
GLB_B2_IN3B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => B2_IN3B, A0 => CAS_Q_part2_grpi);
GLB_B2_IN2B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => B2_IN2B, A0 => DR1_PIN_part2_grpi);
GLB_B2_IN8B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => B2_IN8B, A0 => DR0_PIN_grpi);
GLB_B2_IN7B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => B2_IN7B, A0 => MUX_Q_grpi);
GLB_B3_P19 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B3_P19, A5 => B3_IN6, A4 => B3_IN7B, A3 => B3_IN8B, 
	A2 => B3_IN11B, A1 => B3_IN15, A0 => B3_IN16);
GLB_B3_P18 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B3_P18, A5 => B3_IN2B, A4 => B3_IN6B, A3 => B3_IN7, 
	A2 => B3_IN8B, A1 => B3_IN15B, A0 => B3_IN16);
GLB_B3_P17 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B3_P17, A5 => B3_IN2, A4 => B3_IN6, A3 => B3_IN7, 
	A2 => B3_IN8B, A1 => B3_IN15B, A0 => B3_IN16);
GLB_B3_P16 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B3_P16, A4 => B3_IN2B, A3 => B3_IN6, A2 => B3_IN7B, 
	A1 => B3_IN15B, A0 => B3_IN16B);
GLB_B3_P15 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B3_P15, A4 => B3_IN6, A3 => B3_IN7B, A2 => B3_IN8B, 
	A1 => B3_IN15B, A0 => B3_IN16B);
GLB_B3_P14 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B3_P14, A5 => B3_IN4, A4 => B3_IN6, A3 => B3_IN7B, 
	A2 => B3_IN8B, A1 => B3_IN15, A0 => B3_IN16);
GLB_B3_P13 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B3_P13, A5 => B3_IN2, A4 => B3_IN6, A3 => B3_IN7B, 
	A2 => B3_IN8B, A1 => B3_IN15, A0 => B3_IN16);
GLB_B3_G3 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => B3_G3, A0 => B3_F5);
GLB_B3_G1 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => B3_G1, A0 => B3_F5);
GLB_B3_F5 : PGORF77_jukebox
    GENERIC MAP (TRISE => 0.500000 ns, TFALL => 0.500000 ns)
	PORT MAP (Z0 => B3_F5, A6 => B3_P13, A5 => B3_P14, A4 => B3_P15, 
	A3 => B3_P16, A2 => B3_P19, A1 => B3_P17, A0 => B3_P18);
GLB_B3_CLK : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.200000 ns, TFALL => 0.200000 ns)
	PORT MAP (Z0 => B3_CLK, A0 => CLOCKX_clk0);
GLB_B3_IN7 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => B3_IN7, A0 => MUX_Q_grpi);
GLB_B3_IN4 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => B3_IN4, A0 => MCS3X_grp);
GLB_B3_IN16 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => B3_IN16, A0 => CAS_Q_part2_ffb);
GLB_B3_IN15 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => B3_IN15, A0 => RAS_Q_grpi);
GLB_B3_IN6 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => B3_IN6, A0 => DRAM_Q_grpi);
GLB_B3_IN2 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => B3_IN2, A0 => DR1_PIN_part2_grpi);
GLB_B3_X2O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => B3_X2O, A1 => GND, A0 => B3_G1);
GLB_B3_X0O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => B3_X0O, A1 => GND, A0 => B3_G3);
GLB_CAS_Q_part1 : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 1.400000 ns, LHCQ => 1.400000 ns, HLRQ => 4.900000 ns, SUD0 => 0.300000 ns, 
        SUD1 => 0.300000 ns, HOLDD0 => 3.500000 ns, HOLDD1 => 3.500000 ns, POSC1 => 0.000000 ns, 
        POSC0 => 0.000000 ns, NEGC1 => 0.000000 ns, NEGC0 => 0.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => CAS_Q_part1, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => B3_CLK, 
	D0 => B3_X2O);
GLB_CAS_Q_part2 : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 1.400000 ns, LHCQ => 1.400000 ns, HLRQ => 4.900000 ns, SUD0 => 0.300000 ns, 
        SUD1 => 0.300000 ns, HOLDD0 => 3.500000 ns, HOLDD1 => 3.500000 ns, POSC1 => 0.000000 ns, 
        POSC0 => 0.000000 ns, NEGC1 => 0.000000 ns, NEGC0 => 0.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => CAS_Q_part2, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => B3_CLK, 
	D0 => B3_X0O);
GLB_B3_IN11B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => B3_IN11B, A0 => ISRDY_PIN_grpi);
GLB_B3_IN6B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => B3_IN6B, A0 => DRAM_Q_grpi);
GLB_B3_IN2B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => B3_IN2B, A0 => DR1_PIN_part2_grpi);
GLB_B3_IN16B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => B3_IN16B, A0 => CAS_Q_part2_ffb);
GLB_B3_IN15B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => B3_IN15B, A0 => RAS_Q_grpi);
GLB_B3_IN8B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => B3_IN8B, A0 => DR0_PIN_grpi);
GLB_B3_IN7B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => B3_IN7B, A0 => MUX_Q_grpi);
GLB_B4_P16 : PGAND2_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B4_P16, A1 => B4_IN10B, A0 => B4_IN11);
GLB_B4_P15 : PGAND3_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B4_P15, A2 => B4_IN2, A1 => B4_IN9B, A0 => B4_IN11);
GLB_B4_P4 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B4_P4, A3 => B4_IN2, A2 => B4_IN9B, A1 => B4_IN10B, 
	A0 => B4_IN11B);
GLB_B4_G1 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => B4_G1, A0 => GND);
GLB_OR_1124 : PGORF72_jukebox
    GENERIC MAP (TRISE => 0.600000 ns, TFALL => 0.600000 ns)
	PORT MAP (Z0 => OR_1124, A1 => B4_P15, A0 => B4_P16);
GLB_B4_P4_xa : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.500000 ns, TFALL => 0.500000 ns)
	PORT MAP (Z0 => B4_P4_xa, A0 => B4_P4);
GLB_AND_969 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.200000 ns, TFALL => 1.200000 ns)
	PORT MAP (Z0 => AND_969, A0 => B4_X2O);
GLB_B4_IN11 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => B4_IN11, A0 => ST3_PIN_grpi);
GLB_B4_IN2 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => B4_IN2, A0 => ST2_PIN_grpi);
GLB_B4_X2O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => B4_X2O, A1 => B4_P4_xa, A0 => B4_G1);
GLB_B4_IN11B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => B4_IN11B, A0 => ST3_PIN_grpi);
GLB_B4_IN10B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => B4_IN10B, A0 => ST1_PIN_grpi);
GLB_B4_IN9B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => B4_IN9B, A0 => ST0_PIN_grpi);
GLB_B6_P4 : PGAND3_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B6_P4, A2 => B6_IN9, A1 => B6_IN10B, A0 => B6_IN11);
GLB_B6_G1 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => B6_G1, A0 => GND);
GLB_B6_P4_xa : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.500000 ns, TFALL => 0.500000 ns)
	PORT MAP (Z0 => B6_P4_xa, A0 => B6_P4);
GLB_DIOR_D : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.200000 ns, TFALL => 1.200000 ns)
	PORT MAP (Z0 => DIOR_D, A0 => B6_X2O);
GLB_B6_IN11 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => B6_IN11, A0 => ST3_PIN_grpi);
GLB_B6_IN9 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => B6_IN9, A0 => ST0_PIN_grpi);
GLB_B6_X2O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => B6_X2O, A1 => B6_P4_xa, A0 => B6_G1);
GLB_B6_IN10B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (ZN0 => B6_IN10B, A0 => ST1_PIN_grpi);
GLB_B7_G2 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => B7_G2, A0 => GND);
GLB_GND_1126 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.200000 ns, TFALL => 1.200000 ns)
	PORT MAP (Z0 => GND_1126, A0 => B7_X1O);
GLB_B7_X1O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => B7_X1O, A1 => GND, A0 => B7_G2);
IOC_L2L_KEYWD_RESET : PXIN_jukebox
    GENERIC MAP (TRISE => 1.200000 ns, TFALL => 1.200000 ns)
	PORT MAP (Z0 => L2L_KEYWD_RESETb, XI0 => XRESET);
IOC_IO11_IBUFO : PXIN_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO11_IBUFO, XI0 => MCS3);
IOC_IO10_IBUFO : PXIN_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO10_IBUFO, XI0 => MCS2);
IOC_IO9_IBUFO : PXIN_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO9_IBUFO, XI0 => MCS1);
IOC_IO8_IBUFO : PXIN_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO8_IBUFO, XI0 => MCS0);
IOC_IO17_IBUFO : PXIN_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO17_IBUFO, XI0 => ENC);
IOC_IO4_IBUFO : PXIN_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO4_IBUFO, XI0 => DTR);
IOC_CLOCKX : PXIN_jukebox
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => CLOCKX, XI0 => CLOCK);
IOC_IO16_IBUFO : PXIN_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO16_IBUFO, XI0 => BTN);
IOC_IO1_IBUFO : PXIN_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO1_IBUFO, XI0 => A0);
IOC_ST3 : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => ST3, A0 => IO12_OBUFI);
IOC_IO12_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (Z0 => IO12_OBUFI, A0 => ST3_PIN_iomux);
IOC_ST2 : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => ST2, A0 => IO5_OBUFI);
IOC_IO5_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (Z0 => IO5_OBUFI, A0 => ST2_PIN_iomux);
IOC_ST1 : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => ST1, A0 => IO13_OBUFI);
IOC_IO13_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (Z0 => IO13_OBUFI, A0 => ST1_PIN_iomux);
IOC_ST0 : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => ST0, A0 => IO2_OBUFI);
IOC_IO2_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (Z0 => IO2_OBUFI, A0 => ST0_PIN_iomux);
IOC_SRDY : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => SRDY, A0 => IO0_OBUFI);
IOC_IO0_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (Z0 => IO0_OBUFI, A0 => SRDY_Q_iomux);
IOC_RAS : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => RAS, A0 => IO31_OBUFI);
IOC_IO31_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (Z0 => IO31_OBUFI, A0 => RAS_Q_iomux);
IOC_OE2 : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => OE2, A0 => IO22_OBUFI);
IOC_IO22_OBUFI : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (ZN0 => IO22_OBUFI, A0 => AND_969_iomux);
IOC_OE1 : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => OE1, A0 => IO24_OBUFI);
IOC_IO24_OBUFI : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (ZN0 => IO24_OBUFI, A0 => OR_1124_iomux);
IOC_MUX : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => MUX, A0 => IO28_OBUFI);
IOC_IO28_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (Z0 => IO28_OBUFI, A0 => MUX_Q_iomux);
IOC_ISRDY : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => ISRDY, A0 => IO20_OBUFI);
IOC_IO20_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (Z0 => IO20_OBUFI, A0 => ISRDY_PIN_iomux);
IOC_INT3 : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => INT3, A0 => IO14_OBUFI);
IOC_IO14_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (Z0 => IO14_OBUFI, A0 => INT3_Q_iomux);
IOC_INT0 : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => INT0, A0 => IO15_OBUFI);
IOC_IO15_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (Z0 => IO15_OBUFI, A0 => INT0_Q_iomux);
IOC_DSRDY : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => DSRDY, A0 => IO7_OBUFI);
IOC_IO7_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (Z0 => IO7_OBUFI, A0 => DSRDY_PIN_part1_iomux);
IOC_DRAM : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => DRAM, A0 => IO29_OBUFI);
IOC_IO29_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (Z0 => IO29_OBUFI, A0 => DRAM_Q_iomux);
IOC_DR1 : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => DR1, A0 => IO6_OBUFI);
IOC_IO6_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (Z0 => IO6_OBUFI, A0 => DR1_PIN_part1_iomux);
IOC_DR0 : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => DR0, A0 => IO3_OBUFI);
IOC_IO3_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (Z0 => IO3_OBUFI, A0 => DR0_PIN_iomux);
IOC_DIR1 : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => DIR1, A0 => IO23_OBUFI);
IOC_IO23_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (Z0 => IO23_OBUFI, A0 => GND_1127_iomux);
IOC_DIOW : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => DIOW, A0 => IO25_OBUFI);
IOC_IO25_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (Z0 => IO25_OBUFI, A0 => GND_1126_iomux);
IOC_DIOR : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => DIOR, A0 => IO26_OBUFI);
IOC_IO26_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (Z0 => IO26_OBUFI, A0 => DIOR_D_iomux);
IOC_CS0 : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => CS0, A0 => IO27_OBUFI);
IOC_IO27_OBUFI : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (ZN0 => IO27_OBUFI, A0 => OR_968_iomux);
IOC_CLKBA : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => CLKBA, A0 => IO21_OBUFI);
IOC_IO21_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (Z0 => IO21_OBUFI, A0 => CLKBA_D_iomux);
IOC_CAS : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => CAS, A0 => IO30_OBUFI);
IOC_IO30_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (Z0 => IO30_OBUFI, A0 => CAS_Q_part1_iomux);
GRP_DR0_PIN_ffb : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.800000 ns, TFALL => 0.800000 ns)
	PORT MAP (Z0 => DR0_PIN_ffb, A0 => DR0_PIN);
GRP_DR0_PIN_grpi : PGBUFI_jukebox
    GENERIC MAP (TRISE => 2.100000 ns, TFALL => 2.100000 ns)
	PORT MAP (Z0 => DR0_PIN_grpi, A0 => DR0_PIN);
GRP_DR0_PIN_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => DR0_PIN_iomux, A0 => DR0_PIN);
GRP_CAS_Q_part2_grpi : PGBUFI_jukebox
    GENERIC MAP (TRISE => 2.100000 ns, TFALL => 2.100000 ns)
	PORT MAP (Z0 => CAS_Q_part2_grpi, A0 => CAS_Q_part2);
GRP_CAS_Q_part2_ffb : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.800000 ns, TFALL => 0.800000 ns)
	PORT MAP (Z0 => CAS_Q_part2_ffb, A0 => CAS_Q_part2);
GRP_DR1_PIN_part2_ffb : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.800000 ns, TFALL => 0.800000 ns)
	PORT MAP (Z0 => DR1_PIN_part2_ffb, A0 => DR1_PIN_part2);
GRP_DR1_PIN_part2_grpi : PGBUFI_jukebox
    GENERIC MAP (TRISE => 2.100000 ns, TFALL => 2.100000 ns)
	PORT MAP (Z0 => DR1_PIN_part2_grpi, A0 => DR1_PIN_part2);
GRP_DRAM_Q_ffb : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.800000 ns, TFALL => 0.800000 ns)
	PORT MAP (Z0 => DRAM_Q_ffb, A0 => DRAM_Q);
GRP_DRAM_Q_grpi : PGBUFI_jukebox
    GENERIC MAP (TRISE => 2.100000 ns, TFALL => 2.100000 ns)
	PORT MAP (Z0 => DRAM_Q_grpi, A0 => DRAM_Q);
GRP_DRAM_Q_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => DRAM_Q_iomux, A0 => DRAM_Q);
GRP_MUX_Q_grpi : PGBUFI_jukebox
    GENERIC MAP (TRISE => 2.200000 ns, TFALL => 2.200000 ns)
	PORT MAP (Z0 => MUX_Q_grpi, A0 => MUX_Q);
GRP_MUX_Q_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => MUX_Q_iomux, A0 => MUX_Q);
GRP_RAS_Q_ffb : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.800000 ns, TFALL => 0.800000 ns)
	PORT MAP (Z0 => RAS_Q_ffb, A0 => RAS_Q);
GRP_RAS_Q_grpi : PGBUFI_jukebox
    GENERIC MAP (TRISE => 2.100000 ns, TFALL => 2.100000 ns)
	PORT MAP (Z0 => RAS_Q_grpi, A0 => RAS_Q);
GRP_RAS_Q_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => RAS_Q_iomux, A0 => RAS_Q);
GRP_CLOCKX_clk0 : PXIN_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => CLOCKX_clk0, XI0 => CLOCKX);
GRP_ST2_PIN_ffb : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.800000 ns, TFALL => 0.800000 ns)
	PORT MAP (Z0 => ST2_PIN_ffb, A0 => ST2_PIN);
GRP_ST2_PIN_grpi : PGBUFI_jukebox
    GENERIC MAP (TRISE => 2.200000 ns, TFALL => 2.200000 ns)
	PORT MAP (Z0 => ST2_PIN_grpi, A0 => ST2_PIN);
GRP_ST2_PIN_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => ST2_PIN_iomux, A0 => ST2_PIN);
GRP_SRDY_Q_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => SRDY_Q_iomux, A0 => SRDY_Q);
GRP_INT3_Q_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => INT3_Q_iomux, A0 => INT3_Q);
GRP_INT0_Q_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => INT0_Q_iomux, A0 => INT0_Q);
GRP_A0X_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => A0X_grp, A0 => IO1_IBUFO);
GRP_BTNX_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => BTNX_grp, A0 => IO16_IBUFO);
GRP_DSRDY_PIN_part2_grpi : PGBUFI_jukebox
    GENERIC MAP (TRISE => 2.100000 ns, TFALL => 2.100000 ns)
	PORT MAP (Z0 => DSRDY_PIN_part2_grpi, A0 => DSRDY_PIN_part2);
GRP_ENCX_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => ENCX_grp, A0 => IO17_IBUFO);
GRP_ISRDY_PIN_grpi : PGBUFI_jukebox
    GENERIC MAP (TRISE => 2.200000 ns, TFALL => 2.200000 ns)
	PORT MAP (Z0 => ISRDY_PIN_grpi, A0 => ISRDY_PIN);
GRP_ISRDY_PIN_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => ISRDY_PIN_iomux, A0 => ISRDY_PIN);
GRP_MCS0X_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => MCS0X_grp, A0 => IO8_IBUFO);
GRP_MCS1X_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => MCS1X_grp, A0 => IO9_IBUFO);
GRP_ST0_PIN_ffb : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.800000 ns, TFALL => 0.800000 ns)
	PORT MAP (Z0 => ST0_PIN_ffb, A0 => ST0_PIN);
GRP_ST0_PIN_grpi : PGBUFI_jukebox
    GENERIC MAP (TRISE => 2.200000 ns, TFALL => 2.200000 ns)
	PORT MAP (Z0 => ST0_PIN_grpi, A0 => ST0_PIN);
GRP_ST0_PIN_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => ST0_PIN_iomux, A0 => ST0_PIN);
GRP_ST1_PIN_ffb : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.800000 ns, TFALL => 0.800000 ns)
	PORT MAP (Z0 => ST1_PIN_ffb, A0 => ST1_PIN);
GRP_ST1_PIN_grpi : PGBUFI_jukebox
    GENERIC MAP (TRISE => 2.200000 ns, TFALL => 2.200000 ns)
	PORT MAP (Z0 => ST1_PIN_grpi, A0 => ST1_PIN);
GRP_ST1_PIN_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => ST1_PIN_iomux, A0 => ST1_PIN);
GRP_ST3_PIN_grpi : PGBUFI_jukebox
    GENERIC MAP (TRISE => 2.300000 ns, TFALL => 2.300000 ns)
	PORT MAP (Z0 => ST3_PIN_grpi, A0 => ST3_PIN);
GRP_ST3_PIN_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => ST3_PIN_iomux, A0 => ST3_PIN);
GRP_DR1_PIN_part1_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => DR1_PIN_part1_iomux, A0 => DR1_PIN_part1);
GRP_DSRDY_PIN_part1_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => DSRDY_PIN_part1_iomux, A0 => DSRDY_PIN_part1);
GRP_DTRX_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => DTRX_grp, A0 => IO4_IBUFO);
GRP_MCS2X_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => MCS2X_grp, A0 => IO10_IBUFO);
GRP_MCS3X_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => MCS3X_grp, A0 => IO11_IBUFO);
GRP_GND_1127_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => GND_1127_iomux, A0 => GND_1127);
GRP_OR_968_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => OR_968_iomux, A0 => OR_968);
GRP_CLKBA_D_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => CLKBA_D_iomux, A0 => CLKBA_D);
GRP_CAS_Q_part1_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => CAS_Q_part1_iomux, A0 => CAS_Q_part1);
GRP_OR_1124_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => OR_1124_iomux, A0 => OR_1124);
GRP_AND_969_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => AND_969_iomux, A0 => AND_969);
GRP_DIOR_D_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => DIOR_D_iomux, A0 => DIOR_D);
GRP_GND_1126_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => GND_1126_iomux, A0 => GND_1126);
GRP_L2L_KEYWD_RESET_glb : PXIN_jukebox
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => L2L_KEYWD_RESET_glbb, XI0 => L2L_KEYWD_RESETb);
END jukebox_STRUCTURE;
