-- VHDL netlist for ints
-- Date: Sun Sep 25 19:08:17 2016
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
USE work.all;

ENTITY ints IS 
    PORT (
        ENC : IN std_logic;
        BTN : IN std_logic;
        INT3 : OUT std_logic;
        INT0 : OUT std_logic
    );
END ints;


ARCHITECTURE ints_STRUCTURE OF ints IS
SIGNAL GND : std_logic := '0';
SIGNAL  IO30_IBUFO, IO31_IBUFO, IO10_OBUFI, BUF_675_iomux,
	 IO11_OBUFI, BUF_673_iomux, A6_P0_xa, BUF_673,
	 A6_X3O, A6_P4_xa, BUF_675, A6_X2O,
	 A6_G1, A6_G0, ENCX_grp, A6_P4,
	 A6_IN14, BTNX_grp, A6_P0, A6_IN15 : std_logic;


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

  COMPONENT PGINVI_ints
    GENERIC (TRISE, TFALL : TIME);
    PORT (
        A0 : IN std_logic;
        ZN0 : OUT std_logic
    );
  END COMPONENT;
  for all :  PGINVI_ints use entity work.PGINVI_ints(behav);

BEGIN

GLB_A6_P4 : PGBUFI_ints
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => A6_P4, A0 => A6_IN14);
GLB_A6_P0 : PGBUFI_ints
    GENERIC MAP (TRISE => 1.900000 ns, TFALL => 1.900000 ns)
	PORT MAP (Z0 => A6_P0, A0 => A6_IN15);
GLB_A6_G1 : PGBUFI_ints
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => A6_G1, A0 => GND);
GLB_A6_G0 : PGBUFI_ints
    GENERIC MAP (TRISE => 0.000000 ns, TFALL => 0.000000 ns)
	PORT MAP (Z0 => A6_G0, A0 => GND);
GLB_A6_P0_xa : PGBUFI_ints
    GENERIC MAP (TRISE => 0.500000 ns, TFALL => 0.500000 ns)
	PORT MAP (Z0 => A6_P0_xa, A0 => A6_P0);
GLB_BUF_673 : PGBUFI_ints
    GENERIC MAP (TRISE => 1.200000 ns, TFALL => 1.200000 ns)
	PORT MAP (Z0 => BUF_673, A0 => A6_X3O);
GLB_A6_P4_xa : PGBUFI_ints
    GENERIC MAP (TRISE => 0.500000 ns, TFALL => 0.500000 ns)
	PORT MAP (Z0 => A6_P4_xa, A0 => A6_P4);
GLB_BUF_675 : PGBUFI_ints
    GENERIC MAP (TRISE => 1.200000 ns, TFALL => 1.200000 ns)
	PORT MAP (Z0 => BUF_675, A0 => A6_X2O);
GLB_A6_IN14 : PGBUFI_ints
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => A6_IN14, A0 => ENCX_grp);
GLB_A6_IN15 : PGBUFI_ints
    GENERIC MAP (TRISE => 0.900000 ns, TFALL => 0.900000 ns)
	PORT MAP (Z0 => A6_IN15, A0 => BTNX_grp);
GLB_A6_X3O : PGXOR2_ints
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => A6_X3O, A1 => A6_P0_xa, A0 => A6_G0);
GLB_A6_X2O : PGXOR2_ints
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => A6_X2O, A1 => A6_P4_xa, A0 => A6_G1);
IOC_IO30_IBUFO : PXIN_ints
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO30_IBUFO, XI0 => ENC);
IOC_IO31_IBUFO : PXIN_ints
    GENERIC MAP (TRISE => 0.300000 ns, TFALL => 0.300000 ns)
	PORT MAP (Z0 => IO31_IBUFO, XI0 => BTN);
IOC_INT3 : PXOUT_ints
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => INT3, A0 => IO10_OBUFI);
IOC_IO10_OBUFI : PGINVI_ints
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (ZN0 => IO10_OBUFI, A0 => BUF_675_iomux);
IOC_INT0 : PXOUT_ints
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (XO0 => INT0, A0 => IO11_OBUFI);
IOC_IO11_OBUFI : PGINVI_ints
    GENERIC MAP (TRISE => 0.400000 ns, TFALL => 0.400000 ns)
	PORT MAP (ZN0 => IO11_OBUFI, A0 => BUF_673_iomux);
GRP_BUF_675_iomux : PGBUFI_ints
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => BUF_675_iomux, A0 => BUF_675);
GRP_BUF_673_iomux : PGBUFI_ints
    GENERIC MAP (TRISE => 1.300000 ns, TFALL => 1.300000 ns)
	PORT MAP (Z0 => BUF_673_iomux, A0 => BUF_673);
GRP_BTNX_grp : PGBUFI_ints
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => BTNX_grp, A0 => IO31_IBUFO);
GRP_ENCX_grp : PGBUFI_ints
    GENERIC MAP (TRISE => 1.700000 ns, TFALL => 1.700000 ns)
	PORT MAP (Z0 => ENCX_grp, A0 => IO30_IBUFO);
END ints_STRUCTURE;
