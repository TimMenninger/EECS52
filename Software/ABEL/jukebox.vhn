-- VHDL netlist for jukebox
-- Date: Wed Feb 17 14:04:12 2016
-- Copyright (c) Lattice Semiconductor Corporation
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
        WR : IN std_logic;
        RESET : IN std_logic;
        RD : IN std_logic;
        PCS5 : IN std_logic;
        PCS1 : IN std_logic;
        MCS0 : IN std_logic;
        CLOCK : IN std_logic;
        AD0 : IN std_logic;
        ST5 : OUT std_logic;
        ST4 : OUT std_logic;
        ST3 : OUT std_logic;
        ST2 : OUT std_logic;
        ST1 : OUT std_logic;
        ST0 : OUT std_logic;
        SRDY : OUT std_logic;
        SCLK : OUT std_logic;
        SAB : OUT std_logic;
        RDWR : OUT std_logic;
        POTCS : OUT std_logic;
        ORD : OUT std_logic;
        IDEE2 : OUT std_logic;
        IDEE : OUT std_logic;
        IDECS1 : OUT std_logic;
        IDECS : OUT std_logic;
        DSPCS : OUT std_logic;
        DIR : OUT std_logic;
        DATAE : OUT std_logic;
        DA2 : OUT std_logic;
        DA1 : OUT std_logic;
        DA0 : OUT std_logic
    );
END jukebox;


ARCHITECTURE jukebox_STRUCTURE OF jukebox IS
SIGNAL GND : std_logic := '0';
SIGNAL  L2L_KEYWD_RESETb, IO10_IBUFO, IO18_IBUFO, IO11_IBUFO,
	 IO12_IBUFO, IO0_IBUFO, IO30_IBUFO, CLOCKX,
	 IO1_IBUFO, IO13_OBUFI, ST5_PIN_part1_iomux, IO4_OBUFI,
	 ST4_PIN_iomux, IO5_OBUFI, ST3_PIN_iomux, IO27_OBUFI,
	 ST2_PIN_iomux, IO26_OBUFI, ST1_PIN_iomux, IO31_OBUFI,
	 ST0_PIN_iomux, IO16_OBUFI, SRDY_D_iomux, IO9_OBUFI,
	 SCLK_D_iomux, IO6_OBUFI, AND_1300_iomux, IO3_OBUFI,
	 RDWR_PIN_iomux, IO23_OBUFI, POTCS_D_iomux, IO17_OBUFI,
	 ORD_D_iomux, IO15_OBUFI, IDEE2_D_iomux, IO14_OBUFI,
	 OR_1321_iomux, IO7_OBUFI, IDECS1_D_iomux, IO19_OBUFI,
	 IDECS_D_iomux, IO24_OBUFI, DSPCS_D_iomux, IO8_OBUFI,
	 GND_1342_iomux, IO25_OBUFI, DATAE_D_iomux, IO20_OBUFI,
	 DA2_D_iomux, IO21_OBUFI, DA1_D_iomux, IO22_OBUFI,
	 DA0_D_iomux, ST4_PIN, A1_CLK, ST4_PIN_D0,
	 A1_P16, ST4_PIN_ffb, A1_P15, A1_IN9,
	 A1_IN16, A1_P14, A1_IN12, A1_P13,
	 A1_IN1B, A1_IN2B, A1_IN3B, A1_IN6B,
	 A1_IN9B, A1_IN10, A1_IN11, A1_IN13B,
	 A1_IN14B, A1_IN15B, IDECS1_D, A2_X3O,
	 A2_P4_xa, AND_1300, A2_X2O, A2_P8_xa,
	 SCLK_D, A2_X1O, GND_1342, A2_X0O,
	 A2_G3, A2_G2, A2_G1, A2_G0,
	 A2_F5, A2_P19, A2_P18, A2_P17,
	 A2_IN3, A2_IN6, A2_P16, A2_IN12,
	 A2_P15, A2_IN9B, A2_P14, A2_P13,
	 A2_P8, A2_IN4, A2_IN15, A2_P4,
	 A2_IN3B, A2_IN4B, A2_IN6B, A2_IN9,
	 A2_IN12B, A2_IN15B, ST5_PIN_part1, ST5_PIN_part2,
	 ST5_PIN_part1_D0, ST5_PIN_part2_D0, A3_CLK, OR_1321,
	 A3_X2O, A3_G3, A3_G2, A3_G1,
	 A3_F5, A3_F4, A3_P17, A3_P16,
	 A3_P15, A3_P14, A3_P13, A3_IN9,
	 A3_IN16B, A3_P12, A3_P11, A3_P10,
	 A3_IN11B, ST5_PIN_part2_ffb, A3_P9, A3_IN3,
	 A3_IN6, A3_IN15, A3_IN16, A3_P8,
	 A3_IN2B, A3_IN3B, A3_IN4B, A3_IN6B,
	 A3_IN9B, A3_IN10B, A3_IN12B, A3_IN15B,
	 IDEE2_D, A4_X3O, A4_G0, A4_F5,
	 A4_P19, A4_P18, A4_P17, A4_IN9,
	 A4_P16, A4_P15, A4_IN9B, A4_IN15B,
	 A4_P14, A4_IN3B, A4_IN4, A4_IN6B,
	 A4_IN12B, A4_P13, A4_IN3, A4_IN4B,
	 A4_IN6, A4_IN12, A4_IN15, RDWR_PIN,
	 ST3_PIN, RDWR_PIN_D0, ST3_PIN_D0, A6_CLK,
	 A6_P0_xa, A6_G2, A6_G0, A6_F5,
	 A6_F4, A6_P19, A6_P18, A6_P17,
	 A6_IN0B, A6_P16, A6_IN10B, A6_P15,
	 A6_P14, A6_IN12, A6_P13, A6_IN1,
	 A6_IN11, A6_IN14B, A6_P12, A6_P11,
	 A6_IN4, A6_P10, A6_IN13, A6_P9,
	 A6_IN6, A6_P8, A6_IN3, A6_IN15,
	 A6_IN16, ST3_PIN_ffb, A6_P0, A6_IN2B,
	 A6_IN3B, A6_IN4B, A6_IN6B, A6_IN10,
	 A6_IN11B, A6_IN12B, A6_IN13B, A6_IN15B,
	 A6_IN16B, IDECS_D, B1_X3O, DA0_D,
	 B1_X2O, ORD_D, B1_X1O, DSPCS_D,
	 B1_X0O, B1_G3, B1_G2, B1_G1,
	 B1_G0, B1_F5, B1_F4, B1_F1,
	 B1_F0, B1_P18, B1_P17, B1_P16,
	 B1_P15, B1_P14, B1_P13, B1_P12,
	 B1_P11, B1_P10, B1_P9, B1_IN0B,
	 B1_P8, B1_IN6, B1_P7, B1_P6,
	 B1_IN4, B1_P3, B1_IN6B, B1_P2,
	 B1_IN3B, B1_IN9B, B1_IN11, B1_IN12B,
	 RDWR_PIN_grp, B1_P1, B1_IN0, B1_IN3,
	 B1_IN4B, B1_IN9, B1_IN11B, B1_IN12,
	 SRDY_D, B2_F3, B2_P16, B2_IN0,
	 B2_IN3, B2_IN9, B2_P15, B2_IN6,
	 B2_IN11, B2_IN12, B2_P14, B2_IN0B,
	 B2_IN3B, B2_IN6B, B2_IN9B, B2_IN11B,
	 B2_IN12B, ST0_PIN, ST0_PIN_D0, B3_CLK,
	 B3_G0, B3_F5, B3_P18, B3_IN6,
	 B3_IN14B, B3_IN15B, B3_IN17B, B3_P17,
	 B3_IN5B, B3_P16, B3_P15, B3_P14,
	 B3_IN2B, B3_IN6B, B3_IN9B, B3_IN11,
	 B3_IN12B, ST0_PIN_ffb, B3_P13, B3_IN2,
	 B3_IN3B, B3_IN4B, B3_IN9, B3_IN11B,
	 B3_IN12, B3_IN13B, B3_IN17, ST2_PIN,
	 ST2_PIN_D0, B4_CLK, B4_G0, B4_F5,
	 B4_F0, B4_P19, B4_IN4B, B4_P18,
	 B4_P17, B4_P16, B4_IN0, B4_IN3B,
	 B4_IN5B, B4_P15, B4_IN1B, B4_IN14B,
	 B4_P14, B4_IN3, MCS0X_grp, B4_P13,
	 B4_IN1, B4_IN4, B4_IN5, B4_IN15B,
	 B4_P3, B4_P2, B4_IN2, B4_IN6B,
	 B4_P1, B4_IN9B, B4_IN11, B4_IN17B,
	 ST2_PIN_ffb, B4_P0, B4_IN0B, B4_IN2B,
	 B4_IN6, B4_IN9, B4_IN11B, B4_IN13B,
	 B4_IN17, ST1_PIN, L2L_KEYWD_RESET_glbb, ST1_PIN_D0,
	 B5_CLK, CLOCKX_clk0, B5_P13_xa, DA2_D,
	 B5_X0O, B5_G3, B5_G1, B5_F4,
	 B5_F0, B5_P13, B5_P12, B5_P11,
	 B5_IN12B, RDX_grp, B5_P10, B5_IN4B,
	 WRX_grp, PCS5X_grp, B5_P9, B5_IN3B,
	 B5_IN5B, B5_P8, B5_IN14, B5_P3,
	 B5_IN0, B5_IN2, B5_IN6B, B5_P2,
	 B5_IN6, B5_IN16, ST1_PIN_ffb, PCS1X_grp,
	 AD0X_grp, RESETX_grp, ST5_PIN_part1_grp, B5_P1,
	 B5_IN0B, B5_IN2B, B5_IN11B, B5_IN12,
	 B5_IN13B, B5_IN14B, B5_IN15B, B5_IN16B,
	 DATAE_D, B6_X1O, B6_G2, B6_F4,
	 B6_F0, B6_P12, B6_IN11, B6_P11,
	 B6_P10, B6_P9, B6_P8, B6_IN12,
	 B6_P3, B6_IN0, B6_P2, B6_IN3,
	 B6_IN6B, B6_IN9, B6_IN11B, B6_P1,
	 B6_IN12B, B6_P0, B6_IN0B, B6_IN3B,
	 B6_IN6, B6_IN9B, B7_P0_xa, POTCS_D,
	 B7_X3O, B7_P8_xa, DA1_D, B7_X1O,
	 B7_G2, B7_G0, B7_F1, B7_P8,
	 B7_P7, B7_IN0, B7_IN9, B7_P6,
	 B7_IN6, B7_IN12, ST2_PIN_grp, B7_P5,
	 B7_IN11, B7_IN12B, ST3_PIN_grp, B7_P4,
	 B7_IN3, B7_IN6B, ST4_PIN_grp, ST1_PIN_grp,
	 ST5_PIN_part2_grp, ST0_PIN_grp, B7_P0, B7_IN0B,
	 B7_IN3B, B7_IN9B, B7_IN11B : std_logic;


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

  COMPONENT PGBUFI_jukebox
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PGBUFI_jukebox use entity work.PGBUFI_jukebox(behav);

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

  COMPONENT PGXOR2_jukebox
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A1 : IN std_logic;
        A0 : IN std_logic;
        Z0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PGXOR2_jukebox use entity work.PGXOR2_jukebox(behav);

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

GLB_A1_P16 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A1_P16, A4 => A1_IN2B, A3 => A1_IN3B, A2 => A1_IN6B, 
	A1 => A1_IN13B, A0 => A1_IN16);
GLB_A1_P15 : PGAND8_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A1_P15, A7 => A1_IN1B, A6 => A1_IN2B, A5 => A1_IN6B, 
	A4 => A1_IN9, A3 => A1_IN13B, A2 => A1_IN14B, A1 => A1_IN15B, 
	A0 => A1_IN16);
GLB_A1_P14 : PGAND9_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A1_P14, A8 => A1_IN1B, A7 => A1_IN2B, A6 => A1_IN3B, 
	A5 => A1_IN6B, A4 => A1_IN9B, A3 => A1_IN12, A2 => A1_IN13B, 
	A1 => A1_IN14B, A0 => A1_IN15B);
GLB_A1_P13 : PGAND10_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => A1_P13, A9 => A1_IN1B, A8 => A1_IN2B, A7 => A1_IN3B, 
	A6 => A1_IN6B, A5 => A1_IN9B, A4 => A1_IN10, A3 => A1_IN11, 
	A2 => A1_IN13B, A1 => A1_IN14B, A0 => A1_IN15B);
GLB_ST4_PIN_D0 : PGORF74_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => ST4_PIN_D0, A3 => A1_P13, A2 => A1_P14, A1 => A1_P15, 
	A0 => A1_P16);
GLB_A1_CLK : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A1_CLK, A0 => CLOCKX_clk0);
GLB_A1_IN16 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A1_IN16, A0 => ST4_PIN_ffb);
GLB_A1_IN9 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A1_IN9, A0 => ST3_PIN_grp);
GLB_A1_IN12 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A1_IN12, A0 => PCS5X_grp);
GLB_A1_IN11 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A1_IN11, A0 => RDX_grp);
GLB_A1_IN10 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A1_IN10, A0 => WRX_grp);
GLB_ST4_PIN : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 0.900000 ns, LHCQ => 0.900000 ns, HLRQ => 1.700000 ns, SUD0 => 1.300000 ns, 
        SUD1 => 1.300000 ns, HOLDD0 => 2.300000 ns, HOLDD1 => 2.300000 ns, POSC1 => 4.000000 ns, 
        POSC0 => 4.000000 ns, NEGC1 => 4.000000 ns, NEGC0 => 4.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => ST4_PIN, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => A1_CLK, 
	D0 => ST4_PIN_D0);
GLB_A1_IN15B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A1_IN15B, A0 => ST0_PIN_grp);
GLB_A1_IN14B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A1_IN14B, A0 => MCS0X_grp);
GLB_A1_IN13B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A1_IN13B, A0 => ST5_PIN_part1_grp);
GLB_A1_IN9B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A1_IN9B, A0 => ST3_PIN_grp);
GLB_A1_IN6B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A1_IN6B, A0 => ST1_PIN_grp);
GLB_A1_IN3B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A1_IN3B, A0 => ST2_PIN_grp);
GLB_A1_IN2B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A1_IN2B, A0 => RESETX_grp);
GLB_A1_IN1B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A1_IN1B, A0 => AD0X_grp);
GLB_A2_P19 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => A2_P19, A4 => A2_IN3, A3 => A2_IN4B, A2 => A2_IN6B, 
	A1 => A2_IN9, A0 => A2_IN12B);
GLB_A2_P18 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A2_P18, A4 => A2_IN3, A3 => A2_IN4B, A2 => A2_IN9, 
	A1 => A2_IN12B, A0 => A2_IN15B);
GLB_A2_P17 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A2_P17, A4 => A2_IN3, A3 => A2_IN4B, A2 => A2_IN6, 
	A1 => A2_IN12, A0 => A2_IN15);
GLB_A2_P16 : PGAND3_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A2_P16, A2 => A2_IN4B, A1 => A2_IN9B, A0 => A2_IN12);
GLB_A2_P15 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A2_P15, A3 => A2_IN4B, A2 => A2_IN6B, A1 => A2_IN9B, 
	A0 => A2_IN15B);
GLB_A2_P14 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A2_P14, A3 => A2_IN6B, A2 => A2_IN9, A1 => A2_IN12B, 
	A0 => A2_IN15B);
GLB_A2_P13 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => A2_P13, A3 => A2_IN3B, A2 => A2_IN4, A1 => A2_IN6B, 
	A0 => A2_IN12B);
GLB_A2_P8 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => A2_P8, A5 => A2_IN3B, A4 => A2_IN4, A3 => A2_IN6B, 
	A2 => A2_IN9, A1 => A2_IN12B, A0 => A2_IN15);
GLB_A2_P4 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => A2_P4, A5 => A2_IN3B, A4 => A2_IN4B, A3 => A2_IN6B, 
	A2 => A2_IN9, A1 => A2_IN12B, A0 => A2_IN15B);
GLB_A2_G3 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A2_G3, A0 => GND);
GLB_A2_G2 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A2_G2, A0 => GND);
GLB_A2_G1 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A2_G1, A0 => GND);
GLB_A2_G0 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A2_G0, A0 => A2_F5);
GLB_A2_F5 : PGORF77_jukebox
    GENERIC MAP (TRISE => 3.000000 ns, TFALL => 3.000000 ns)
	PORT MAP (Z0 => A2_F5, A6 => A2_P13, A5 => A2_P14, A4 => A2_P15, 
	A3 => A2_P16, A2 => A2_P19, A1 => A2_P17, A0 => A2_P18);
GLB_IDECS1_D : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => IDECS1_D, A0 => A2_X3O);
GLB_A2_P4_xa : PGBUFI_jukebox
    GENERIC MAP (TRISE => 2.800000 ns, TFALL => 2.800000 ns)
	PORT MAP (Z0 => A2_P4_xa, A0 => A2_P4);
GLB_AND_1300 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => AND_1300, A0 => A2_X2O);
GLB_A2_P8_xa : PGBUFI_jukebox
    GENERIC MAP (TRISE => 2.800000 ns, TFALL => 2.800000 ns)
	PORT MAP (Z0 => A2_P8_xa, A0 => A2_P8);
GLB_SCLK_D : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => SCLK_D, A0 => A2_X1O);
GLB_GND_1342 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => GND_1342, A0 => A2_X0O);
GLB_A2_IN6 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A2_IN6, A0 => ST1_PIN_grp);
GLB_A2_IN3 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A2_IN3, A0 => ST2_PIN_grp);
GLB_A2_IN12 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A2_IN12, A0 => ST5_PIN_part2_grp);
GLB_A2_IN15 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A2_IN15, A0 => ST0_PIN_grp);
GLB_A2_IN4 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A2_IN4, A0 => ST4_PIN_grp);
GLB_A2_IN9 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A2_IN9, A0 => ST3_PIN_grp);
GLB_A2_X3O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => A2_X3O, A1 => GND, A0 => A2_G0);
GLB_A2_X2O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => A2_X2O, A1 => A2_P4_xa, A0 => A2_G1);
GLB_A2_X1O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => A2_X1O, A1 => A2_P8_xa, A0 => A2_G2);
GLB_A2_X0O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => A2_X0O, A1 => GND, A0 => A2_G3);
GLB_A2_IN9B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A2_IN9B, A0 => ST3_PIN_grp);
GLB_A2_IN15B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A2_IN15B, A0 => ST0_PIN_grp);
GLB_A2_IN12B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A2_IN12B, A0 => ST5_PIN_part2_grp);
GLB_A2_IN6B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A2_IN6B, A0 => ST1_PIN_grp);
GLB_A2_IN4B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A2_IN4B, A0 => ST4_PIN_grp);
GLB_A2_IN3B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A2_IN3B, A0 => ST2_PIN_grp);
GLB_A3_P17 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A3_P17, A4 => A3_IN3, A3 => A3_IN4B, A2 => A3_IN6B, 
	A1 => A3_IN9, A0 => A3_IN16B);
GLB_A3_P16 : PGAND3_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A3_P16, A2 => A3_IN4B, A1 => A3_IN9B, A0 => A3_IN16);
GLB_A3_P15 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A3_P15, A3 => A3_IN4B, A2 => A3_IN6B, A1 => A3_IN15B, 
	A0 => A3_IN16B);
GLB_A3_P14 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A3_P14, A4 => A3_IN3, A3 => A3_IN4B, A2 => A3_IN6, 
	A1 => A3_IN15, A0 => A3_IN16);
GLB_A3_P13 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => A3_P13, A4 => A3_IN3, A3 => A3_IN4B, A2 => A3_IN9, 
	A1 => A3_IN15B, A0 => A3_IN16B);
GLB_A3_P12 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => A3_P12, A3 => A3_IN2B, A2 => A3_IN4B, A1 => A3_IN9B, 
	A0 => A3_IN16);
GLB_A3_P11 : PGAND8_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A3_P11, A7 => A3_IN2B, A6 => A3_IN3, A5 => A3_IN4B, 
	A4 => A3_IN6, A3 => A3_IN11B, A2 => A3_IN12B, A1 => A3_IN15, 
	A0 => A3_IN16);
GLB_A3_P10 : PGAND8_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A3_P10, A7 => A3_IN2B, A6 => A3_IN3B, A5 => A3_IN4B, 
	A4 => A3_IN6B, A3 => A3_IN9B, A2 => A3_IN11B, A1 => A3_IN12B, 
	A0 => A3_IN15B);
GLB_A3_P9 : PGAND8_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A3_P9, A7 => A3_IN2B, A6 => A3_IN3, A5 => A3_IN4B, 
	A4 => A3_IN6, A3 => A3_IN10B, A2 => A3_IN12B, A1 => A3_IN15, 
	A0 => A3_IN16);
GLB_A3_P8 : PGAND8_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => A3_P8, A7 => A3_IN2B, A6 => A3_IN3B, A5 => A3_IN4B, 
	A4 => A3_IN6B, A3 => A3_IN9B, A2 => A3_IN10B, A1 => A3_IN12B, 
	A0 => A3_IN15B);
GLB_A3_G3 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A3_G3, A0 => A3_F4);
GLB_A3_G2 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A3_G2, A0 => A3_F4);
GLB_A3_G1 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A3_G1, A0 => A3_F5);
GLB_A3_F5 : PGORF75_jukebox
    GENERIC MAP (TRISE => 3.000000 ns, TFALL => 3.000000 ns)
	PORT MAP (Z0 => A3_F5, A4 => A3_P13, A3 => A3_P14, A2 => A3_P15, 
	A1 => A3_P16, A0 => A3_P17);
GLB_A3_F4 : PGORF75_jukebox
    GENERIC MAP (TRISE => 3.000000 ns, TFALL => 3.000000 ns)
	PORT MAP (Z0 => A3_F4, A4 => A3_P8, A3 => A3_P9, A2 => A3_P10, 
	A1 => A3_P11, A0 => A3_P12);
GLB_A3_CLK : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A3_CLK, A0 => CLOCKX_clk0);
GLB_OR_1321 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => OR_1321, A0 => A3_X2O);
GLB_A3_IN9 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A3_IN9, A0 => ST3_PIN_grp);
GLB_A3_IN16 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A3_IN16, A0 => ST5_PIN_part2_ffb);
GLB_A3_IN15 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A3_IN15, A0 => ST0_PIN_grp);
GLB_A3_IN6 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A3_IN6, A0 => ST1_PIN_grp);
GLB_A3_IN3 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A3_IN3, A0 => ST2_PIN_grp);
GLB_A3_X2O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => A3_X2O, A1 => GND, A0 => A3_G1);
GLB_ST5_PIN_part1_D0 : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => ST5_PIN_part1_D0, A1 => GND, A0 => A3_G2);
GLB_ST5_PIN_part2_D0 : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => ST5_PIN_part2_D0, A1 => GND, A0 => A3_G3);
GLB_ST5_PIN_part1 : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 0.900000 ns, LHCQ => 0.900000 ns, HLRQ => 1.700000 ns, SUD0 => 1.300000 ns, 
        SUD1 => 1.300000 ns, HOLDD0 => 2.300000 ns, HOLDD1 => 2.300000 ns, POSC1 => 4.000000 ns, 
        POSC0 => 4.000000 ns, NEGC1 => 4.000000 ns, NEGC0 => 4.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => ST5_PIN_part1, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => A3_CLK, 
	D0 => ST5_PIN_part1_D0);
GLB_ST5_PIN_part2 : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 0.900000 ns, LHCQ => 0.900000 ns, HLRQ => 1.700000 ns, SUD0 => 1.300000 ns, 
        SUD1 => 1.300000 ns, HOLDD0 => 2.300000 ns, HOLDD1 => 2.300000 ns, POSC1 => 4.000000 ns, 
        POSC0 => 4.000000 ns, NEGC1 => 4.000000 ns, NEGC0 => 4.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => ST5_PIN_part2, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => A3_CLK, 
	D0 => ST5_PIN_part2_D0);
GLB_A3_IN16B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A3_IN16B, A0 => ST5_PIN_part2_ffb);
GLB_A3_IN11B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A3_IN11B, A0 => RDX_grp);
GLB_A3_IN15B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A3_IN15B, A0 => ST0_PIN_grp);
GLB_A3_IN12B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A3_IN12B, A0 => PCS5X_grp);
GLB_A3_IN10B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A3_IN10B, A0 => WRX_grp);
GLB_A3_IN9B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A3_IN9B, A0 => ST3_PIN_grp);
GLB_A3_IN6B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A3_IN6B, A0 => ST1_PIN_grp);
GLB_A3_IN4B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A3_IN4B, A0 => ST4_PIN_grp);
GLB_A3_IN3B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A3_IN3B, A0 => ST2_PIN_grp);
GLB_A3_IN2B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A3_IN2B, A0 => RESETX_grp);
GLB_A4_P19 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => A4_P19, A4 => A4_IN3, A3 => A4_IN4B, A2 => A4_IN6B, 
	A1 => A4_IN9, A0 => A4_IN12B);
GLB_A4_P18 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A4_P18, A4 => A4_IN3, A3 => A4_IN4B, A2 => A4_IN9, 
	A1 => A4_IN12B, A0 => A4_IN15B);
GLB_A4_P17 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A4_P17, A4 => A4_IN4, A3 => A4_IN6B, A2 => A4_IN9, 
	A1 => A4_IN12B, A0 => A4_IN15B);
GLB_A4_P16 : PGAND3_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A4_P16, A2 => A4_IN4B, A1 => A4_IN9B, A0 => A4_IN12);
GLB_A4_P15 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A4_P15, A3 => A4_IN4B, A2 => A4_IN6B, A1 => A4_IN9B, 
	A0 => A4_IN15B);
GLB_A4_P14 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A4_P14, A3 => A4_IN3B, A2 => A4_IN4, A1 => A4_IN6B, 
	A0 => A4_IN12B);
GLB_A4_P13 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => A4_P13, A4 => A4_IN3, A3 => A4_IN4B, A2 => A4_IN6, 
	A1 => A4_IN12, A0 => A4_IN15);
GLB_A4_G0 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A4_G0, A0 => A4_F5);
GLB_A4_F5 : PGORF77_jukebox
    GENERIC MAP (TRISE => 3.000000 ns, TFALL => 3.000000 ns)
	PORT MAP (Z0 => A4_F5, A6 => A4_P13, A5 => A4_P14, A4 => A4_P15, 
	A3 => A4_P16, A2 => A4_P19, A1 => A4_P17, A0 => A4_P18);
GLB_IDEE2_D : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => IDEE2_D, A0 => A4_X3O);
GLB_A4_IN9 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A4_IN9, A0 => ST3_PIN_grp);
GLB_A4_IN4 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A4_IN4, A0 => ST4_PIN_grp);
GLB_A4_IN15 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A4_IN15, A0 => ST0_PIN_grp);
GLB_A4_IN12 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A4_IN12, A0 => ST5_PIN_part2_grp);
GLB_A4_IN6 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A4_IN6, A0 => ST1_PIN_grp);
GLB_A4_IN3 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A4_IN3, A0 => ST2_PIN_grp);
GLB_A4_X3O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => A4_X3O, A1 => GND, A0 => A4_G0);
GLB_A4_IN15B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A4_IN15B, A0 => ST0_PIN_grp);
GLB_A4_IN9B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A4_IN9B, A0 => ST3_PIN_grp);
GLB_A4_IN12B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A4_IN12B, A0 => ST5_PIN_part2_grp);
GLB_A4_IN6B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A4_IN6B, A0 => ST1_PIN_grp);
GLB_A4_IN3B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A4_IN3B, A0 => ST2_PIN_grp);
GLB_A4_IN4B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A4_IN4B, A0 => ST4_PIN_grp);
GLB_A6_P19 : PGAND8_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => A6_P19, A7 => A6_IN2B, A6 => A6_IN3, A5 => A6_IN4B, 
	A4 => A6_IN6, A3 => A6_IN11B, A2 => A6_IN12B, A1 => A6_IN13, 
	A0 => A6_IN15);
GLB_A6_P18 : PGAND7_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A6_P18, A6 => A6_IN2B, A5 => A6_IN4, A4 => A6_IN6B, 
	A3 => A6_IN13B, A2 => A6_IN14B, A1 => A6_IN15B, A0 => A6_IN16);
GLB_A6_P17 : PGAND7_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A6_P17, A6 => A6_IN0B, A5 => A6_IN2B, A4 => A6_IN3, 
	A3 => A6_IN4B, A2 => A6_IN6B, A1 => A6_IN13B, A0 => A6_IN15B);
GLB_A6_P16 : PGAND8_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A6_P16, A7 => A6_IN2B, A6 => A6_IN3, A5 => A6_IN4B, 
	A4 => A6_IN6, A3 => A6_IN10B, A2 => A6_IN12B, A1 => A6_IN13, 
	A0 => A6_IN15);
GLB_A6_P15 : PGAND8_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A6_P15, A7 => A6_IN1, A6 => A6_IN2B, A5 => A6_IN3B, 
	A4 => A6_IN6B, A3 => A6_IN13B, A2 => A6_IN14B, A1 => A6_IN15B, 
	A0 => A6_IN16);
GLB_A6_P14 : PGAND9_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A6_P14, A8 => A6_IN1, A7 => A6_IN2B, A6 => A6_IN3B, 
	A5 => A6_IN4B, A4 => A6_IN6B, A3 => A6_IN12, A2 => A6_IN13B, 
	A1 => A6_IN14B, A0 => A6_IN15B);
GLB_A6_P13 : PGAND10_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => A6_P13, A9 => A6_IN1, A8 => A6_IN2B, A7 => A6_IN3B, 
	A6 => A6_IN4B, A5 => A6_IN6B, A4 => A6_IN10, A3 => A6_IN11, 
	A2 => A6_IN13B, A1 => A6_IN14B, A0 => A6_IN15B);
GLB_A6_P12 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => A6_P12, A5 => A6_IN2B, A4 => A6_IN3B, A3 => A6_IN4, 
	A2 => A6_IN6B, A1 => A6_IN13B, A0 => A6_IN15);
GLB_A6_P11 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A6_P11, A5 => A6_IN2B, A4 => A6_IN3B, A3 => A6_IN4, 
	A2 => A6_IN6B, A1 => A6_IN13B, A0 => A6_IN16);
GLB_A6_P10 : PGAND7_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A6_P10, A6 => A6_IN2B, A5 => A6_IN3, A4 => A6_IN4B, 
	A3 => A6_IN6, A2 => A6_IN13, A1 => A6_IN15, A0 => A6_IN16B);
GLB_A6_P9 : PGAND7_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => A6_P9, A6 => A6_IN2B, A5 => A6_IN3, A4 => A6_IN4B, 
	A3 => A6_IN6, A2 => A6_IN13B, A1 => A6_IN15B, A0 => A6_IN16);
GLB_A6_P8 : PGAND7_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => A6_P8, A6 => A6_IN2B, A5 => A6_IN3, A4 => A6_IN4B, 
	A3 => A6_IN6B, A2 => A6_IN13B, A1 => A6_IN15, A0 => A6_IN16);
GLB_A6_P0 : PGAND10_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => A6_P0, A9 => A6_IN2B, A8 => A6_IN3B, A7 => A6_IN4B, 
	A6 => A6_IN6B, A5 => A6_IN10, A4 => A6_IN11B, A3 => A6_IN12B, 
	A2 => A6_IN13B, A1 => A6_IN15B, A0 => A6_IN16B);
GLB_A6_G2 : PGORF72_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A6_G2, A1 => A6_F4, A0 => A6_F5);
GLB_A6_G0 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A6_G0, A0 => GND);
GLB_A6_F5 : PGORF77_jukebox
    GENERIC MAP (TRISE => 3.000000 ns, TFALL => 3.000000 ns)
	PORT MAP (Z0 => A6_F5, A6 => A6_P13, A5 => A6_P14, A4 => A6_P15, 
	A3 => A6_P16, A2 => A6_P19, A1 => A6_P17, A0 => A6_P18);
GLB_A6_F4 : PGORF75_jukebox
    GENERIC MAP (TRISE => 3.000000 ns, TFALL => 3.000000 ns)
	PORT MAP (Z0 => A6_F4, A4 => A6_P8, A3 => A6_P9, A2 => A6_P10, 
	A1 => A6_P11, A0 => A6_P12);
GLB_A6_CLK : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A6_CLK, A0 => CLOCKX_clk0);
GLB_A6_P0_xa : PGBUFI_jukebox
    GENERIC MAP (TRISE => 2.800000 ns, TFALL => 2.800000 ns)
	PORT MAP (Z0 => A6_P0_xa, A0 => A6_P0);
GLB_A6_IN12 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A6_IN12, A0 => PCS5X_grp);
GLB_A6_IN11 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A6_IN11, A0 => RDX_grp);
GLB_A6_IN1 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A6_IN1, A0 => AD0X_grp);
GLB_A6_IN4 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A6_IN4, A0 => ST4_PIN_grp);
GLB_A6_IN13 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A6_IN13, A0 => ST5_PIN_part1_grp);
GLB_A6_IN6 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A6_IN6, A0 => ST1_PIN_grp);
GLB_A6_IN16 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A6_IN16, A0 => ST3_PIN_ffb);
GLB_A6_IN15 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A6_IN15, A0 => ST0_PIN_grp);
GLB_A6_IN3 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A6_IN3, A0 => ST2_PIN_grp);
GLB_A6_IN10 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => A6_IN10, A0 => WRX_grp);
GLB_RDWR_PIN_D0 : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => RDWR_PIN_D0, A1 => A6_P0_xa, A0 => A6_G0);
GLB_ST3_PIN_D0 : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => ST3_PIN_D0, A1 => GND, A0 => A6_G2);
GLB_RDWR_PIN : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 0.900000 ns, LHCQ => 0.900000 ns, HLRQ => 1.700000 ns, SUD0 => 1.300000 ns, 
        SUD1 => 1.300000 ns, HOLDD0 => 2.300000 ns, HOLDD1 => 2.300000 ns, POSC1 => 4.000000 ns, 
        POSC0 => 4.000000 ns, NEGC1 => 4.000000 ns, NEGC0 => 4.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => RDWR_PIN, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => A6_CLK, 
	D0 => RDWR_PIN_D0);
GLB_ST3_PIN : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 0.900000 ns, LHCQ => 0.900000 ns, HLRQ => 1.700000 ns, SUD0 => 1.300000 ns, 
        SUD1 => 1.300000 ns, HOLDD0 => 2.300000 ns, HOLDD1 => 2.300000 ns, POSC1 => 4.000000 ns, 
        POSC0 => 4.000000 ns, NEGC1 => 4.000000 ns, NEGC0 => 4.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => ST3_PIN, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => A6_CLK, 
	D0 => ST3_PIN_D0);
GLB_A6_IN0B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A6_IN0B, A0 => PCS1X_grp);
GLB_A6_IN10B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A6_IN10B, A0 => WRX_grp);
GLB_A6_IN14B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A6_IN14B, A0 => MCS0X_grp);
GLB_A6_IN16B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A6_IN16B, A0 => ST3_PIN_ffb);
GLB_A6_IN15B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A6_IN15B, A0 => ST0_PIN_grp);
GLB_A6_IN13B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A6_IN13B, A0 => ST5_PIN_part1_grp);
GLB_A6_IN12B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A6_IN12B, A0 => PCS5X_grp);
GLB_A6_IN11B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A6_IN11B, A0 => RDX_grp);
GLB_A6_IN6B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A6_IN6B, A0 => ST1_PIN_grp);
GLB_A6_IN4B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A6_IN4B, A0 => ST4_PIN_grp);
GLB_A6_IN3B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A6_IN3B, A0 => ST2_PIN_grp);
GLB_A6_IN2B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => A6_IN2B, A0 => RESETX_grp);
GLB_B1_P18 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B1_P18, A5 => B1_IN0, A4 => B1_IN3, A3 => B1_IN6, 
	A2 => B1_IN9, A1 => B1_IN11B, A0 => B1_IN12);
GLB_B1_P17 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B1_P17, A4 => B1_IN3B, A3 => B1_IN6, A2 => B1_IN9B, 
	A1 => B1_IN11B, A0 => B1_IN12);
GLB_B1_P16 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B1_P16, A3 => B1_IN0B, A2 => B1_IN3B, A1 => B1_IN6, 
	A0 => B1_IN9B);
GLB_B1_P15 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B1_P15, A3 => B1_IN3B, A2 => B1_IN9B, A1 => B1_IN11, 
	A0 => B1_IN12B);
GLB_B1_P14 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B1_P14, A4 => B1_IN0B, A3 => B1_IN3B, A2 => B1_IN9B, 
	A1 => B1_IN11B, A0 => B1_IN12);
GLB_B1_P13 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => B1_P13, A4 => B1_IN0B, A3 => B1_IN3B, A2 => B1_IN6, 
	A1 => B1_IN11B, A0 => B1_IN12);
GLB_B1_P12 : PGAND3_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => B1_P12, A2 => B1_IN3, A1 => B1_IN6B, A0 => B1_IN11B);
GLB_B1_P11 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B1_P11, A3 => B1_IN0B, A2 => B1_IN3B, A1 => B1_IN9B, 
	A0 => B1_IN11B);
GLB_B1_P10 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B1_P10, A4 => B1_IN0, A3 => B1_IN3, A2 => B1_IN9, 
	A1 => B1_IN11B, A0 => B1_IN12);
GLB_B1_P9 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B1_P9, A4 => B1_IN0B, A3 => B1_IN3B, A2 => B1_IN6, 
	A1 => B1_IN11B, A0 => B1_IN12);
GLB_B1_P8 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => B1_P8, A4 => B1_IN3B, A3 => B1_IN6, A2 => B1_IN9B, 
	A1 => B1_IN11B, A0 => B1_IN12);
GLB_B1_P7 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B1_P7, A3 => B1_IN3, A2 => B1_IN4, A1 => B1_IN6B, 
	A0 => B1_IN11B);
GLB_B1_P6 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B1_P6, A5 => B1_IN0, A4 => B1_IN3, A3 => B1_IN4, 
	A2 => B1_IN9, A1 => B1_IN11B, A0 => B1_IN12);
GLB_B1_P3 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B1_P3, A3 => B1_IN3, A2 => B1_IN4B, A1 => B1_IN6B, 
	A0 => B1_IN11B);
GLB_B1_P2 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B1_P2, A4 => B1_IN0, A3 => B1_IN3B, A2 => B1_IN9B, 
	A1 => B1_IN11, A0 => B1_IN12B);
GLB_B1_P1 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B1_P1, A5 => B1_IN0, A4 => B1_IN3, A3 => B1_IN4B, 
	A2 => B1_IN9, A1 => B1_IN11B, A0 => B1_IN12);
GLB_B1_G3 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B1_G3, A0 => B1_F5);
GLB_B1_G2 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B1_G2, A0 => B1_F0);
GLB_B1_G1 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B1_G1, A0 => B1_F1);
GLB_B1_G0 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B1_G0, A0 => B1_F4);
GLB_B1_F5 : PGORF76_jukebox
    GENERIC MAP (TRISE => 3.000000 ns, TFALL => 3.000000 ns)
	PORT MAP (Z0 => B1_F5, A5 => B1_P13, A4 => B1_P14, A3 => B1_P15, 
	A2 => B1_P16, A1 => B1_P17, A0 => B1_P18);
GLB_B1_F4 : PGORF75_jukebox
    GENERIC MAP (TRISE => 3.000000 ns, TFALL => 3.000000 ns)
	PORT MAP (Z0 => B1_F4, A4 => B1_P8, A3 => B1_P9, A2 => B1_P10, 
	A1 => B1_P11, A0 => B1_P12);
GLB_B1_F1 : PGORF72_jukebox
    GENERIC MAP (TRISE => 3.000000 ns, TFALL => 3.000000 ns)
	PORT MAP (Z0 => B1_F1, A1 => B1_P6, A0 => B1_P7);
GLB_B1_F0 : PGORF73_jukebox
    GENERIC MAP (TRISE => 3.000000 ns, TFALL => 3.000000 ns)
	PORT MAP (Z0 => B1_F0, A2 => B1_P1, A1 => B1_P2, A0 => B1_P3);
GLB_IDECS_D : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => IDECS_D, A0 => B1_X3O);
GLB_DA0_D : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => DA0_D, A0 => B1_X2O);
GLB_ORD_D : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => ORD_D, A0 => B1_X1O);
GLB_DSPCS_D : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => DSPCS_D, A0 => B1_X0O);
GLB_B1_IN6 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B1_IN6, A0 => ST3_PIN_grp);
GLB_B1_IN4 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B1_IN4, A0 => RDWR_PIN_grp);
GLB_B1_IN11 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B1_IN11, A0 => ST4_PIN_grp);
GLB_B1_IN12 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B1_IN12, A0 => ST2_PIN_grp);
GLB_B1_IN9 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B1_IN9, A0 => ST1_PIN_grp);
GLB_B1_IN3 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B1_IN3, A0 => ST5_PIN_part2_grp);
GLB_B1_IN0 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B1_IN0, A0 => ST0_PIN_grp);
GLB_B1_X3O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => B1_X3O, A1 => GND, A0 => B1_G0);
GLB_B1_X2O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => B1_X2O, A1 => GND, A0 => B1_G1);
GLB_B1_X1O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => B1_X1O, A1 => GND, A0 => B1_G2);
GLB_B1_X0O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => B1_X0O, A1 => GND, A0 => B1_G3);
GLB_B1_IN0B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B1_IN0B, A0 => ST0_PIN_grp);
GLB_B1_IN6B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B1_IN6B, A0 => ST3_PIN_grp);
GLB_B1_IN12B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B1_IN12B, A0 => ST2_PIN_grp);
GLB_B1_IN9B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B1_IN9B, A0 => ST1_PIN_grp);
GLB_B1_IN3B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B1_IN3B, A0 => ST5_PIN_part2_grp);
GLB_B1_IN11B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B1_IN11B, A0 => ST4_PIN_grp);
GLB_B1_IN4B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B1_IN4B, A0 => RDWR_PIN_grp);
GLB_B2_P16 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B2_P16, A5 => B2_IN0, A4 => B2_IN3, A3 => B2_IN6, 
	A2 => B2_IN9, A1 => B2_IN11B, A0 => B2_IN12);
GLB_B2_P15 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B2_P15, A5 => B2_IN0B, A4 => B2_IN3B, A3 => B2_IN6, 
	A2 => B2_IN9B, A1 => B2_IN11, A0 => B2_IN12);
GLB_B2_P14 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B2_P14, A5 => B2_IN0B, A4 => B2_IN3B, A3 => B2_IN6B, 
	A2 => B2_IN9B, A1 => B2_IN11B, A0 => B2_IN12B);
GLB_B2_F3 : PGORF73_jukebox
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => B2_F3, A2 => B2_P14, A1 => B2_P15, A0 => B2_P16);
GLB_SRDY_D : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => SRDY_D, A0 => B2_F3);
GLB_B2_IN9 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B2_IN9, A0 => ST1_PIN_grp);
GLB_B2_IN3 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B2_IN3, A0 => ST5_PIN_part2_grp);
GLB_B2_IN0 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B2_IN0, A0 => ST0_PIN_grp);
GLB_B2_IN12 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B2_IN12, A0 => ST2_PIN_grp);
GLB_B2_IN11 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B2_IN11, A0 => ST4_PIN_grp);
GLB_B2_IN6 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B2_IN6, A0 => ST3_PIN_grp);
GLB_B2_IN12B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B2_IN12B, A0 => ST2_PIN_grp);
GLB_B2_IN11B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B2_IN11B, A0 => ST4_PIN_grp);
GLB_B2_IN9B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B2_IN9B, A0 => ST1_PIN_grp);
GLB_B2_IN6B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B2_IN6B, A0 => ST3_PIN_grp);
GLB_B2_IN3B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B2_IN3B, A0 => ST5_PIN_part2_grp);
GLB_B2_IN0B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B2_IN0B, A0 => ST0_PIN_grp);
GLB_B3_P18 : PGAND9_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B3_P18, A8 => B3_IN2B, A7 => B3_IN6, A6 => B3_IN9B, 
	A5 => B3_IN11B, A4 => B3_IN12, A3 => B3_IN13B, A2 => B3_IN14B, 
	A1 => B3_IN15B, A0 => B3_IN17B);
GLB_B3_P17 : PGAND8_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B3_P17, A7 => B3_IN2, A6 => B3_IN3B, A5 => B3_IN5B, 
	A4 => B3_IN9, A3 => B3_IN11B, A2 => B3_IN12, A1 => B3_IN13B, 
	A0 => B3_IN17);
GLB_B3_P16 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B3_P16, A4 => B3_IN2, A3 => B3_IN6B, A2 => B3_IN9B, 
	A1 => B3_IN11B, A0 => B3_IN13B);
GLB_B3_P15 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B3_P15, A5 => B3_IN2, A4 => B3_IN6B, A3 => B3_IN11B, 
	A2 => B3_IN12, A1 => B3_IN13B, A0 => B3_IN17);
GLB_B3_P14 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B3_P14, A5 => B3_IN2B, A4 => B3_IN6B, A3 => B3_IN9B, 
	A2 => B3_IN11, A1 => B3_IN12B, A0 => B3_IN13B);
GLB_B3_P13 : PGAND8_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => B3_P13, A7 => B3_IN2, A6 => B3_IN3B, A5 => B3_IN4B, 
	A4 => B3_IN9, A3 => B3_IN11B, A2 => B3_IN12, A1 => B3_IN13B, 
	A0 => B3_IN17);
GLB_B3_G0 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B3_G0, A0 => B3_F5);
GLB_B3_F5 : PGORF76_jukebox
    GENERIC MAP (TRISE => 3.000000 ns, TFALL => 3.000000 ns)
	PORT MAP (Z0 => B3_F5, A5 => B3_P13, A4 => B3_P14, A3 => B3_P15, 
	A2 => B3_P16, A1 => B3_P17, A0 => B3_P18);
GLB_B3_CLK : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B3_CLK, A0 => CLOCKX_clk0);
GLB_B3_IN6 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B3_IN6, A0 => ST3_PIN_grp);
GLB_B3_IN11 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B3_IN11, A0 => ST4_PIN_grp);
GLB_B3_IN17 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B3_IN17, A0 => ST0_PIN_ffb);
GLB_B3_IN12 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B3_IN12, A0 => ST2_PIN_grp);
GLB_B3_IN9 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B3_IN9, A0 => ST1_PIN_grp);
GLB_B3_IN2 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B3_IN2, A0 => ST5_PIN_part1_grp);
GLB_ST0_PIN_D0 : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => ST0_PIN_D0, A1 => GND, A0 => B3_G0);
GLB_ST0_PIN : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 0.900000 ns, LHCQ => 0.900000 ns, HLRQ => 1.700000 ns, SUD0 => 1.300000 ns, 
        SUD1 => 1.300000 ns, HOLDD0 => 2.300000 ns, HOLDD1 => 2.300000 ns, POSC1 => 4.000000 ns, 
        POSC0 => 4.000000 ns, NEGC1 => 4.000000 ns, NEGC0 => 4.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => ST0_PIN, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => B3_CLK, 
	D0 => ST0_PIN_D0);
GLB_B3_IN17B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B3_IN17B, A0 => ST0_PIN_ffb);
GLB_B3_IN15B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B3_IN15B, A0 => PCS1X_grp);
GLB_B3_IN14B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B3_IN14B, A0 => AD0X_grp);
GLB_B3_IN5B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B3_IN5B, A0 => WRX_grp);
GLB_B3_IN12B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B3_IN12B, A0 => ST2_PIN_grp);
GLB_B3_IN9B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B3_IN9B, A0 => ST1_PIN_grp);
GLB_B3_IN6B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B3_IN6B, A0 => ST3_PIN_grp);
GLB_B3_IN2B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B3_IN2B, A0 => ST5_PIN_part1_grp);
GLB_B3_IN13B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B3_IN13B, A0 => RESETX_grp);
GLB_B3_IN11B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B3_IN11B, A0 => ST4_PIN_grp);
GLB_B3_IN4B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B3_IN4B, A0 => RDX_grp);
GLB_B3_IN3B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B3_IN3B, A0 => PCS5X_grp);
GLB_B4_P19 : PGAND8_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => B4_P19, A7 => B4_IN0, A6 => B4_IN2, A5 => B4_IN3B, 
	A4 => B4_IN4B, A3 => B4_IN9, A2 => B4_IN11B, A1 => B4_IN13B, 
	A0 => B4_IN17);
GLB_B4_P18 : PGAND7_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B4_P18, A6 => B4_IN0B, A5 => B4_IN2B, A4 => B4_IN9B, 
	A3 => B4_IN11B, A2 => B4_IN13B, A1 => B4_IN15B, A0 => B4_IN17);
GLB_B4_P17 : PGAND7_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B4_P17, A6 => B4_IN0, A5 => B4_IN2B, A4 => B4_IN6, 
	A3 => B4_IN9B, A2 => B4_IN11B, A1 => B4_IN13B, A0 => B4_IN17);
GLB_B4_P16 : PGAND8_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B4_P16, A7 => B4_IN0, A6 => B4_IN2, A5 => B4_IN3B, 
	A4 => B4_IN5B, A3 => B4_IN9, A2 => B4_IN11B, A1 => B4_IN13B, 
	A0 => B4_IN17);
GLB_B4_P15 : PGAND8_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B4_P15, A7 => B4_IN0B, A6 => B4_IN1B, A5 => B4_IN2B, 
	A4 => B4_IN6, A3 => B4_IN9B, A2 => B4_IN11, A1 => B4_IN13B, 
	A0 => B4_IN14B);
GLB_B4_P14 : PGAND9_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B4_P14, A8 => B4_IN0B, A7 => B4_IN1, A6 => B4_IN2B, 
	A5 => B4_IN3, A4 => B4_IN6B, A3 => B4_IN9B, A2 => B4_IN11B, 
	A1 => B4_IN13B, A0 => B4_IN15B);
GLB_B4_P13 : PGAND10_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => B4_P13, A9 => B4_IN0B, A8 => B4_IN1, A7 => B4_IN2B, 
	A6 => B4_IN4, A5 => B4_IN5, A4 => B4_IN6B, A3 => B4_IN9B, 
	A2 => B4_IN11B, A1 => B4_IN13B, A0 => B4_IN15B);
GLB_B4_P3 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B4_P3, A4 => B4_IN2, A3 => B4_IN6B, A2 => B4_IN11B, 
	A1 => B4_IN13B, A0 => B4_IN17);
GLB_B4_P2 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B4_P2, A5 => B4_IN0B, A4 => B4_IN2, A3 => B4_IN6B, 
	A2 => B4_IN9, A1 => B4_IN11B, A0 => B4_IN13B);
GLB_B4_P1 : PGAND7_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B4_P1, A6 => B4_IN0B, A5 => B4_IN2B, A4 => B4_IN6, 
	A3 => B4_IN9B, A2 => B4_IN11, A1 => B4_IN13B, A0 => B4_IN17B);
GLB_B4_P0 : PGAND7_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => B4_P0, A6 => B4_IN0B, A5 => B4_IN2B, A4 => B4_IN6, 
	A3 => B4_IN9, A2 => B4_IN11B, A1 => B4_IN13B, A0 => B4_IN17);
GLB_B4_G0 : PGORF72_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B4_G0, A1 => B4_F0, A0 => B4_F5);
GLB_B4_F5 : PGORF77_jukebox
    GENERIC MAP (TRISE => 3.000000 ns, TFALL => 3.000000 ns)
	PORT MAP (Z0 => B4_F5, A6 => B4_P13, A5 => B4_P14, A4 => B4_P15, 
	A3 => B4_P16, A2 => B4_P19, A1 => B4_P17, A0 => B4_P18);
GLB_B4_F0 : PGORF74_jukebox
    GENERIC MAP (TRISE => 3.000000 ns, TFALL => 3.000000 ns)
	PORT MAP (Z0 => B4_F0, A3 => B4_P0, A2 => B4_P1, A1 => B4_P2, 
	A0 => B4_P3);
GLB_B4_CLK : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B4_CLK, A0 => CLOCKX_clk0);
GLB_B4_IN0 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B4_IN0, A0 => ST0_PIN_grp);
GLB_B4_IN3 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B4_IN3, A0 => PCS5X_grp);
GLB_B4_IN5 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B4_IN5, A0 => WRX_grp);
GLB_B4_IN4 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B4_IN4, A0 => RDX_grp);
GLB_B4_IN1 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B4_IN1, A0 => MCS0X_grp);
GLB_B4_IN2 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B4_IN2, A0 => ST5_PIN_part1_grp);
GLB_B4_IN11 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B4_IN11, A0 => ST4_PIN_grp);
GLB_B4_IN17 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B4_IN17, A0 => ST2_PIN_ffb);
GLB_B4_IN9 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B4_IN9, A0 => ST1_PIN_grp);
GLB_B4_IN6 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B4_IN6, A0 => ST3_PIN_grp);
GLB_ST2_PIN_D0 : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => ST2_PIN_D0, A1 => GND, A0 => B4_G0);
GLB_ST2_PIN : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 0.900000 ns, LHCQ => 0.900000 ns, HLRQ => 1.700000 ns, SUD0 => 1.300000 ns, 
        SUD1 => 1.300000 ns, HOLDD0 => 2.300000 ns, HOLDD1 => 2.300000 ns, POSC1 => 4.000000 ns, 
        POSC0 => 4.000000 ns, NEGC1 => 4.000000 ns, NEGC0 => 4.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => ST2_PIN, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => B4_CLK, 
	D0 => ST2_PIN_D0);
GLB_B4_IN4B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B4_IN4B, A0 => RDX_grp);
GLB_B4_IN5B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B4_IN5B, A0 => WRX_grp);
GLB_B4_IN3B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B4_IN3B, A0 => PCS5X_grp);
GLB_B4_IN14B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B4_IN14B, A0 => AD0X_grp);
GLB_B4_IN1B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B4_IN1B, A0 => MCS0X_grp);
GLB_B4_IN15B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B4_IN15B, A0 => PCS1X_grp);
GLB_B4_IN6B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B4_IN6B, A0 => ST3_PIN_grp);
GLB_B4_IN17B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B4_IN17B, A0 => ST2_PIN_ffb);
GLB_B4_IN9B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B4_IN9B, A0 => ST1_PIN_grp);
GLB_B4_IN13B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B4_IN13B, A0 => RESETX_grp);
GLB_B4_IN11B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B4_IN11B, A0 => ST4_PIN_grp);
GLB_B4_IN2B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B4_IN2B, A0 => ST5_PIN_part1_grp);
GLB_B4_IN0B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B4_IN0B, A0 => ST0_PIN_grp);
GLB_B5_P13 : PGAND3_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => B5_P13, A2 => B5_IN2, A1 => B5_IN6B, A0 => B5_IN11B);
GLB_B5_P12 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => B5_P12, A4 => B5_IN0, A3 => B5_IN2, A2 => B5_IN6B, 
	A1 => B5_IN11B, A0 => B5_IN13B);
GLB_B5_P11 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B5_P11, A5 => B5_IN2, A4 => B5_IN6B, A3 => B5_IN11B, 
	A2 => B5_IN12B, A1 => B5_IN13B, A0 => B5_IN16);
GLB_B5_P10 : PGAND8_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B5_P10, A7 => B5_IN0, A6 => B5_IN2, A5 => B5_IN3B, 
	A4 => B5_IN4B, A3 => B5_IN11B, A2 => B5_IN12, A1 => B5_IN13B, 
	A0 => B5_IN16);
GLB_B5_P9 : PGAND8_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B5_P9, A7 => B5_IN0, A6 => B5_IN2, A5 => B5_IN3B, 
	A4 => B5_IN5B, A3 => B5_IN11B, A2 => B5_IN12, A1 => B5_IN13B, 
	A0 => B5_IN16);
GLB_B5_P8 : PGAND9_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => B5_P8, A8 => B5_IN0B, A7 => B5_IN2B, A6 => B5_IN6, 
	A5 => B5_IN11B, A4 => B5_IN12, A3 => B5_IN13B, A2 => B5_IN14, 
	A1 => B5_IN15B, A0 => B5_IN16B);
GLB_B5_P3 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B5_P3, A5 => B5_IN0, A4 => B5_IN2, A3 => B5_IN6B, 
	A2 => B5_IN11B, A1 => B5_IN12, A0 => B5_IN16);
GLB_B5_P2 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B5_P2, A5 => B5_IN0B, A4 => B5_IN2B, A3 => B5_IN6, 
	A2 => B5_IN11B, A1 => B5_IN12, A0 => B5_IN16);
GLB_B5_P1 : PGAND8_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B5_P1, A7 => B5_IN0B, A6 => B5_IN2B, A5 => B5_IN11B, 
	A4 => B5_IN12, A3 => B5_IN13B, A2 => B5_IN14B, A1 => B5_IN15B, 
	A0 => B5_IN16B);
GLB_B5_G3 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B5_G3, A0 => B5_F0);
GLB_B5_G1 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B5_G1, A0 => B5_F4);
GLB_B5_F4 : PGORF75_jukebox
    GENERIC MAP (TRISE => 3.000000 ns, TFALL => 3.000000 ns)
	PORT MAP (Z0 => B5_F4, A4 => B5_P8, A3 => B5_P9, A2 => B5_P10, 
	A1 => B5_P11, A0 => B5_P12);
GLB_B5_F0 : PGORF73_jukebox
    GENERIC MAP (TRISE => 3.000000 ns, TFALL => 3.000000 ns)
	PORT MAP (Z0 => B5_F0, A2 => B5_P1, A1 => B5_P2, A0 => B5_P3);
GLB_B5_CLK : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B5_CLK, A0 => CLOCKX_clk0);
GLB_B5_P13_xa : PGBUFI_jukebox
    GENERIC MAP (TRISE => 2.800000 ns, TFALL => 2.800000 ns)
	PORT MAP (Z0 => B5_P13_xa, A0 => B5_P13);
GLB_DA2_D : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => DA2_D, A0 => B5_X0O);
GLB_B5_IN14 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B5_IN14, A0 => AD0X_grp);
GLB_B5_IN2 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B5_IN2, A0 => ST5_PIN_part1_grp);
GLB_B5_IN0 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B5_IN0, A0 => ST0_PIN_grp);
GLB_B5_IN16 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B5_IN16, A0 => ST1_PIN_ffb);
GLB_B5_IN6 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B5_IN6, A0 => ST3_PIN_grp);
GLB_B5_IN12 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B5_IN12, A0 => ST2_PIN_grp);
GLB_ST1_PIN_D0 : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => ST1_PIN_D0, A1 => GND, A0 => B5_G1);
GLB_B5_X0O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => B5_X0O, A1 => B5_P13_xa, A0 => B5_G3);
GLB_ST1_PIN : PGDFFR_jukebox
    GENERIC MAP (HLCQ => 0.900000 ns, LHCQ => 0.900000 ns, HLRQ => 1.700000 ns, SUD0 => 1.300000 ns, 
        SUD1 => 1.300000 ns, HOLDD0 => 2.300000 ns, HOLDD1 => 2.300000 ns, POSC1 => 4.000000 ns, 
        POSC0 => 4.000000 ns, NEGC1 => 4.000000 ns, NEGC0 => 4.000000 ns, RECRC => 0.000000 ns, 
        HOLDRC => 0.000000 ns)
	PORT MAP (Q0 => ST1_PIN, RNESET => L2L_KEYWD_RESET_glbb, CD => GND, CLK => B5_CLK, 
	D0 => ST1_PIN_D0);
GLB_B5_IN12B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B5_IN12B, A0 => ST2_PIN_grp);
GLB_B5_IN4B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B5_IN4B, A0 => RDX_grp);
GLB_B5_IN5B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B5_IN5B, A0 => WRX_grp);
GLB_B5_IN3B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B5_IN3B, A0 => PCS5X_grp);
GLB_B5_IN6B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B5_IN6B, A0 => ST3_PIN_grp);
GLB_B5_IN16B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B5_IN16B, A0 => ST1_PIN_ffb);
GLB_B5_IN15B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B5_IN15B, A0 => PCS1X_grp);
GLB_B5_IN14B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B5_IN14B, A0 => AD0X_grp);
GLB_B5_IN13B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B5_IN13B, A0 => RESETX_grp);
GLB_B5_IN11B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B5_IN11B, A0 => ST4_PIN_grp);
GLB_B5_IN2B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B5_IN2B, A0 => ST5_PIN_part1_grp);
GLB_B5_IN0B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B5_IN0B, A0 => ST0_PIN_grp);
GLB_B6_P12 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => B6_P12, A3 => B6_IN3B, A2 => B6_IN9B, A1 => B6_IN11, 
	A0 => B6_IN12B);
GLB_B6_P11 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B6_P11, A4 => B6_IN0B, A3 => B6_IN6B, A2 => B6_IN9B, 
	A1 => B6_IN11B, A0 => B6_IN12);
GLB_B6_P10 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B6_P10, A4 => B6_IN0, A3 => B6_IN3, A2 => B6_IN9, 
	A1 => B6_IN11B, A0 => B6_IN12);
GLB_B6_P9 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B6_P9, A4 => B6_IN0B, A3 => B6_IN3B, A2 => B6_IN6, 
	A1 => B6_IN11B, A0 => B6_IN12);
GLB_B6_P8 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => B6_P8, A4 => B6_IN3B, A3 => B6_IN6, A2 => B6_IN9B, 
	A1 => B6_IN11B, A0 => B6_IN12);
GLB_B6_P3 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B6_P3, A3 => B6_IN0, A2 => B6_IN3, A1 => B6_IN6B, 
	A0 => B6_IN11B);
GLB_B6_P2 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B6_P2, A3 => B6_IN3, A2 => B6_IN6B, A1 => B6_IN9, 
	A0 => B6_IN11B);
GLB_B6_P1 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B6_P1, A3 => B6_IN0B, A2 => B6_IN3B, A1 => B6_IN9B, 
	A0 => B6_IN12B);
GLB_B6_P0 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => B6_P0, A3 => B6_IN0B, A2 => B6_IN3B, A1 => B6_IN6, 
	A0 => B6_IN9B);
GLB_B6_G2 : PGORF72_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B6_G2, A1 => B6_F0, A0 => B6_F4);
GLB_B6_F4 : PGORF75_jukebox
    GENERIC MAP (TRISE => 3.000000 ns, TFALL => 3.000000 ns)
	PORT MAP (Z0 => B6_F4, A4 => B6_P8, A3 => B6_P9, A2 => B6_P10, 
	A1 => B6_P11, A0 => B6_P12);
GLB_B6_F0 : PGORF74_jukebox
    GENERIC MAP (TRISE => 3.000000 ns, TFALL => 3.000000 ns)
	PORT MAP (Z0 => B6_F0, A3 => B6_P0, A2 => B6_P1, A1 => B6_P2, 
	A0 => B6_P3);
GLB_DATAE_D : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => DATAE_D, A0 => B6_X1O);
GLB_B6_IN11 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B6_IN11, A0 => ST4_PIN_grp);
GLB_B6_IN12 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B6_IN12, A0 => ST2_PIN_grp);
GLB_B6_IN0 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B6_IN0, A0 => ST0_PIN_grp);
GLB_B6_IN9 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B6_IN9, A0 => ST1_PIN_grp);
GLB_B6_IN3 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B6_IN3, A0 => ST5_PIN_part2_grp);
GLB_B6_IN6 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B6_IN6, A0 => ST3_PIN_grp);
GLB_B6_X1O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => B6_X1O, A1 => GND, A0 => B6_G2);
GLB_B6_IN11B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B6_IN11B, A0 => ST4_PIN_grp);
GLB_B6_IN6B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B6_IN6B, A0 => ST3_PIN_grp);
GLB_B6_IN12B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B6_IN12B, A0 => ST2_PIN_grp);
GLB_B6_IN9B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B6_IN9B, A0 => ST1_PIN_grp);
GLB_B6_IN3B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B6_IN3B, A0 => ST5_PIN_part2_grp);
GLB_B6_IN0B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B6_IN0B, A0 => ST0_PIN_grp);
GLB_B7_P8 : PGAND6_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => B7_P8, A5 => B7_IN0B, A4 => B7_IN3B, A3 => B7_IN6, 
	A2 => B7_IN9B, A1 => B7_IN11B, A0 => B7_IN12B);
GLB_B7_P7 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B7_P7, A4 => B7_IN0, A3 => B7_IN3, A2 => B7_IN9, 
	A1 => B7_IN11B, A0 => B7_IN12);
GLB_B7_P6 : PGAND5_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B7_P6, A4 => B7_IN0B, A3 => B7_IN3B, A2 => B7_IN6, 
	A1 => B7_IN9B, A0 => B7_IN12);
GLB_B7_P5 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => B7_P5, A3 => B7_IN3B, A2 => B7_IN9B, A1 => B7_IN11, 
	A0 => B7_IN12B);
GLB_B7_P4 : PGAND3_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => B7_P4, A2 => B7_IN3, A1 => B7_IN6B, A0 => B7_IN11B);
GLB_B7_P0 : PGAND4_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => B7_P0, A3 => B7_IN0B, A2 => B7_IN3B, A1 => B7_IN9B, 
	A0 => B7_IN11B);
GLB_B7_G2 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B7_G2, A0 => GND);
GLB_B7_G0 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B7_G0, A0 => B7_F1);
GLB_B7_F1 : PGORF74_jukebox
    GENERIC MAP (TRISE => 3.000000 ns, TFALL => 3.000000 ns)
	PORT MAP (Z0 => B7_F1, A3 => B7_P4, A2 => B7_P5, A1 => B7_P6, 
	A0 => B7_P7);
GLB_B7_P0_xa : PGBUFI_jukebox
    GENERIC MAP (TRISE => 2.800000 ns, TFALL => 2.800000 ns)
	PORT MAP (Z0 => B7_P0_xa, A0 => B7_P0);
GLB_POTCS_D : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => POTCS_D, A0 => B7_X3O);
GLB_B7_P8_xa : PGBUFI_jukebox
    GENERIC MAP (TRISE => 2.800000 ns, TFALL => 2.800000 ns)
	PORT MAP (Z0 => B7_P8_xa, A0 => B7_P8);
GLB_DA1_D : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => DA1_D, A0 => B7_X1O);
GLB_B7_IN9 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B7_IN9, A0 => ST1_PIN_grp);
GLB_B7_IN0 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B7_IN0, A0 => ST0_PIN_grp);
GLB_B7_IN12 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B7_IN12, A0 => ST2_PIN_grp);
GLB_B7_IN6 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B7_IN6, A0 => ST3_PIN_grp);
GLB_B7_IN11 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B7_IN11, A0 => ST4_PIN_grp);
GLB_B7_IN3 : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => B7_IN3, A0 => ST5_PIN_part2_grp);
GLB_B7_X3O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => B7_X3O, A1 => B7_P0_xa, A0 => B7_G0);
GLB_B7_X1O : PGXOR2_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => B7_X1O, A1 => B7_P8_xa, A0 => B7_G2);
GLB_B7_IN12B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B7_IN12B, A0 => ST2_PIN_grp);
GLB_B7_IN6B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B7_IN6B, A0 => ST3_PIN_grp);
GLB_B7_IN11B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B7_IN11B, A0 => ST4_PIN_grp);
GLB_B7_IN9B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B7_IN9B, A0 => ST1_PIN_grp);
GLB_B7_IN3B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B7_IN3B, A0 => ST5_PIN_part2_grp);
GLB_B7_IN0B : PGINVI_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (ZN0 => B7_IN0B, A0 => ST0_PIN_grp);
IOC_L2L_KEYWD_RESET : PXIN_jukebox
    GENERIC MAP (TRISE => 7.800000 ns, TFALL => 7.800000 ns)
	PORT MAP (Z0 => L2L_KEYWD_RESETb, XI0 => XRESET);
IOC_IO10_IBUFO : PXIN_jukebox
    GENERIC MAP (TRISE => 1.400000 ns, TFALL => 1.400000 ns)
	PORT MAP (Z0 => IO10_IBUFO, XI0 => WR);
IOC_IO18_IBUFO : PXIN_jukebox
    GENERIC MAP (TRISE => 1.400000 ns, TFALL => 1.400000 ns)
	PORT MAP (Z0 => IO18_IBUFO, XI0 => RESET);
IOC_IO11_IBUFO : PXIN_jukebox
    GENERIC MAP (TRISE => 1.400000 ns, TFALL => 1.400000 ns)
	PORT MAP (Z0 => IO11_IBUFO, XI0 => RD);
IOC_IO12_IBUFO : PXIN_jukebox
    GENERIC MAP (TRISE => 1.400000 ns, TFALL => 1.400000 ns)
	PORT MAP (Z0 => IO12_IBUFO, XI0 => PCS5);
IOC_IO0_IBUFO : PXIN_jukebox
    GENERIC MAP (TRISE => 1.400000 ns, TFALL => 1.400000 ns)
	PORT MAP (Z0 => IO0_IBUFO, XI0 => PCS1);
IOC_IO30_IBUFO : PXIN_jukebox
    GENERIC MAP (TRISE => 1.400000 ns, TFALL => 1.400000 ns)
	PORT MAP (Z0 => IO30_IBUFO, XI0 => MCS0);
IOC_CLOCKX : PXIN_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => CLOCKX, XI0 => CLOCK);
IOC_IO1_IBUFO : PXIN_jukebox
    GENERIC MAP (TRISE => 1.400000 ns, TFALL => 1.400000 ns)
	PORT MAP (Z0 => IO1_IBUFO, XI0 => AD0);
IOC_ST5 : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (XO0 => ST5, A0 => IO13_OBUFI);
IOC_IO13_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO13_OBUFI, A0 => ST5_PIN_part1_iomux);
IOC_ST4 : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (XO0 => ST4, A0 => IO4_OBUFI);
IOC_IO4_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO4_OBUFI, A0 => ST4_PIN_iomux);
IOC_ST3 : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (XO0 => ST3, A0 => IO5_OBUFI);
IOC_IO5_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO5_OBUFI, A0 => ST3_PIN_iomux);
IOC_ST2 : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (XO0 => ST2, A0 => IO27_OBUFI);
IOC_IO27_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO27_OBUFI, A0 => ST2_PIN_iomux);
IOC_ST1 : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (XO0 => ST1, A0 => IO26_OBUFI);
IOC_IO26_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO26_OBUFI, A0 => ST1_PIN_iomux);
IOC_ST0 : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (XO0 => ST0, A0 => IO31_OBUFI);
IOC_IO31_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO31_OBUFI, A0 => ST0_PIN_iomux);
IOC_SRDY : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (XO0 => SRDY, A0 => IO16_OBUFI);
IOC_IO16_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO16_OBUFI, A0 => SRDY_D_iomux);
IOC_SCLK : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (XO0 => SCLK, A0 => IO9_OBUFI);
IOC_IO9_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO9_OBUFI, A0 => SCLK_D_iomux);
IOC_SAB : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (XO0 => SAB, A0 => IO6_OBUFI);
IOC_IO6_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO6_OBUFI, A0 => AND_1300_iomux);
IOC_RDWR : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (XO0 => RDWR, A0 => IO3_OBUFI);
IOC_IO3_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO3_OBUFI, A0 => RDWR_PIN_iomux);
IOC_POTCS : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (XO0 => POTCS, A0 => IO23_OBUFI);
IOC_IO23_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO23_OBUFI, A0 => POTCS_D_iomux);
IOC_ORD : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (XO0 => ORD, A0 => IO17_OBUFI);
IOC_IO17_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO17_OBUFI, A0 => ORD_D_iomux);
IOC_IDEE2 : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (XO0 => IDEE2, A0 => IO15_OBUFI);
IOC_IO15_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO15_OBUFI, A0 => IDEE2_D_iomux);
IOC_IDEE : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (XO0 => IDEE, A0 => IO14_OBUFI);
IOC_IO14_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO14_OBUFI, A0 => OR_1321_iomux);
IOC_IDECS1 : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (XO0 => IDECS1, A0 => IO7_OBUFI);
IOC_IO7_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO7_OBUFI, A0 => IDECS1_D_iomux);
IOC_IDECS : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (XO0 => IDECS, A0 => IO19_OBUFI);
IOC_IO19_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO19_OBUFI, A0 => IDECS_D_iomux);
IOC_DSPCS : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (XO0 => DSPCS, A0 => IO24_OBUFI);
IOC_IO24_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO24_OBUFI, A0 => DSPCS_D_iomux);
IOC_DIR : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (XO0 => DIR, A0 => IO8_OBUFI);
IOC_IO8_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO8_OBUFI, A0 => GND_1342_iomux);
IOC_DATAE : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (XO0 => DATAE, A0 => IO25_OBUFI);
IOC_IO25_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO25_OBUFI, A0 => DATAE_D_iomux);
IOC_DA2 : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (XO0 => DA2, A0 => IO20_OBUFI);
IOC_IO20_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO20_OBUFI, A0 => DA2_D_iomux);
IOC_DA1 : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (XO0 => DA1, A0 => IO21_OBUFI);
IOC_IO21_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO21_OBUFI, A0 => DA1_D_iomux);
IOC_DA0 : PXOUT_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (XO0 => DA0, A0 => IO22_OBUFI);
IOC_IO22_OBUFI : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO22_OBUFI, A0 => DA0_D_iomux);
GRP_ST4_PIN_ffb : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => ST4_PIN_ffb, A0 => ST4_PIN);
GRP_ST4_PIN_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 2.400000 ns, TFALL => 2.400000 ns)
	PORT MAP (Z0 => ST4_PIN_grp, A0 => ST4_PIN);
GRP_ST4_PIN_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => ST4_PIN_iomux, A0 => ST4_PIN);
GRP_AD0X_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.500000 ns, TFALL => 1.500000 ns)
	PORT MAP (Z0 => AD0X_grp, A0 => IO1_IBUFO);
GRP_MCS0X_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.200000 ns, TFALL => 1.200000 ns)
	PORT MAP (Z0 => MCS0X_grp, A0 => IO30_IBUFO);
GRP_PCS5X_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => PCS5X_grp, A0 => IO12_IBUFO);
GRP_RDX_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => RDX_grp, A0 => IO11_IBUFO);
GRP_RESETX_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => RESETX_grp, A0 => IO18_IBUFO);
GRP_ST0_PIN_ffb : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => ST0_PIN_ffb, A0 => ST0_PIN);
GRP_ST0_PIN_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 2.400000 ns, TFALL => 2.400000 ns)
	PORT MAP (Z0 => ST0_PIN_grp, A0 => ST0_PIN);
GRP_ST0_PIN_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => ST0_PIN_iomux, A0 => ST0_PIN);
GRP_ST1_PIN_ffb : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => ST1_PIN_ffb, A0 => ST1_PIN);
GRP_ST1_PIN_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 2.400000 ns, TFALL => 2.400000 ns)
	PORT MAP (Z0 => ST1_PIN_grp, A0 => ST1_PIN);
GRP_ST1_PIN_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => ST1_PIN_iomux, A0 => ST1_PIN);
GRP_ST2_PIN_ffb : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => ST2_PIN_ffb, A0 => ST2_PIN);
GRP_ST2_PIN_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 2.400000 ns, TFALL => 2.400000 ns)
	PORT MAP (Z0 => ST2_PIN_grp, A0 => ST2_PIN);
GRP_ST2_PIN_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => ST2_PIN_iomux, A0 => ST2_PIN);
GRP_ST3_PIN_ffb : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => ST3_PIN_ffb, A0 => ST3_PIN);
GRP_ST3_PIN_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 2.400000 ns, TFALL => 2.400000 ns)
	PORT MAP (Z0 => ST3_PIN_grp, A0 => ST3_PIN);
GRP_ST3_PIN_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => ST3_PIN_iomux, A0 => ST3_PIN);
GRP_ST5_PIN_part1_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.500000 ns, TFALL => 1.500000 ns)
	PORT MAP (Z0 => ST5_PIN_part1_grp, A0 => ST5_PIN_part1);
GRP_ST5_PIN_part1_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => ST5_PIN_part1_iomux, A0 => ST5_PIN_part1);
GRP_WRX_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => WRX_grp, A0 => IO10_IBUFO);
GRP_CLOCKX_clk0 : PXIN_jukebox
    GENERIC MAP (TRISE => 2.400000 ns, TFALL => 2.400000 ns)
	PORT MAP (Z0 => CLOCKX_clk0, XI0 => CLOCKX);
GRP_SCLK_D_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => SCLK_D_iomux, A0 => SCLK_D);
GRP_IDECS1_D_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => IDECS1_D_iomux, A0 => IDECS1_D);
GRP_GND_1342_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => GND_1342_iomux, A0 => GND_1342);
GRP_AND_1300_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => AND_1300_iomux, A0 => AND_1300);
GRP_ST5_PIN_part2_ffb : PGBUFI_jukebox
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => ST5_PIN_part2_ffb, A0 => ST5_PIN_part2);
GRP_ST5_PIN_part2_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => ST5_PIN_part2_grp, A0 => ST5_PIN_part2);
GRP_OR_1321_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => OR_1321_iomux, A0 => OR_1321);
GRP_IDEE2_D_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => IDEE2_D_iomux, A0 => IDEE2_D);
GRP_RDWR_PIN_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.000000 ns, TFALL => 1.000000 ns)
	PORT MAP (Z0 => RDWR_PIN_grp, A0 => RDWR_PIN);
GRP_RDWR_PIN_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => RDWR_PIN_iomux, A0 => RDWR_PIN);
GRP_PCS1X_grp : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => PCS1X_grp, A0 => IO0_IBUFO);
GRP_ORD_D_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => ORD_D_iomux, A0 => ORD_D);
GRP_IDECS_D_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => IDECS_D_iomux, A0 => IDECS_D);
GRP_DSPCS_D_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => DSPCS_D_iomux, A0 => DSPCS_D);
GRP_DA0_D_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => DA0_D_iomux, A0 => DA0_D);
GRP_SRDY_D_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => SRDY_D_iomux, A0 => SRDY_D);
GRP_DA2_D_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => DA2_D_iomux, A0 => DA2_D);
GRP_DATAE_D_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => DATAE_D_iomux, A0 => DATAE_D);
GRP_POTCS_D_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => POTCS_D_iomux, A0 => POTCS_D);
GRP_DA1_D_iomux : PGBUFI_jukebox
    GENERIC MAP (TRISE => 1.800000 ns, TFALL => 1.800000 ns)
	PORT MAP (Z0 => DA1_D_iomux, A0 => DA1_D);
GRP_L2L_KEYWD_RESET_glb : PXIN_jukebox
    GENERIC MAP (TRISE => 0.700000 ns, TFALL => 0.700000 ns)
	PORT MAP (Z0 => L2L_KEYWD_RESET_glbb, XI0 => L2L_KEYWD_RESETb);
END jukebox_STRUCTURE;
