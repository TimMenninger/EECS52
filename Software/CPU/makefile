##############################################################################
# 
# Makefile
#
# EE/CS 52: 80188 MP3 Jukebox Project
#
# Revision History
# 2/16/2010	 Glen George	 Initial Revision
#
##############################################################################


### VARIABLES ################################################################

# C Compiler Definition
CC=ic86
ASM=asm86
LINK=link86
LOC=loc86
HEXMAKE=oh86

# Directory Definitions
# GLENDIR = directory containing Glen's code
# SRCDIR = directory containing my code
SRCDIR=src
OBJDIR=obj
GLENDIR=$(SRCDIR)\juke301
INCLUDEDIR=include

# Output executable name
EXENAME=jukebox

# Compiler Flags
#  include($(INCLUDEDIR)) was originally a CFLAG
CFLAGS= debug mod186 extend code small rom noalign
ASMFLAGS= m1 ep db
LOCFLAGS= AD(SM(CODE(2000H), DATA(1000H), STACK(7000H))) NOIC


# Jukebox file targets
# Supplied code
GLENOBJS= lib188.obj \
		  mainloop.obj \
		  stubfncs.obj \
		  simide.obj \
		  fatutil.obj \
		  keyupdat.obj \
		  trakutil.obj \
		  ffrev.obj \
		  playmp3.obj
# Written code
JUKEOBJS= buttons.obj \
          encoder.obj \
          chipslct.obj \
		  irqvects.obj \
          ivt.obj \
          queues.obj \
		  main.obj


# low-level assembly files

# Should be all of the same object files, but now we need the directory and
# comma-separation.  The first list can have a maximum of 6 and the rest
# can have a maximum of 5 .obj files.
LNKOBJS1= $(OBJDIR)\encoder.obj, \
          $(OBJDIR)\queues.obj, \
          $(OBJDIR)\buttons.obj, \
          $(OBJDIR)\lib188.obj, \
		  $(OBJDIR)\simide.obj, \
		  $(OBJDIR)\fatutil.obj
LNKOBJS2= $(OBJDIR)\keyupdat.obj, \
          $(OBJDIR)\trakutil.obj, \
		  $(OBJDIR)\ffrev.obj, \
          $(OBJDIR)\playmp3.obj, \
		  $(OBJDIR)\stubfncs.obj
LNKOBJS3= $(OBJDIR)\mainloop.obj, \
          $(OBJDIR)\chipslct.obj, \
          $(OBJDIR)\irqvects.obj, \
          $(OBJDIR)\ivt.obj, \
          $(OBJDIR)\main.obj
# ROMOBJS= c0smrom.obj $(SYSOBJS)

	
### COMMAND LINE TARGETS #####################################################

# Target for building debug version of code
juke: $(JUKEOBJS) $(GLENOBJS)
	$(LINK) $(LNKOBJS1) to $(EXENAME)1.lnk
	$(LINK) $(EXENAME)1.lnk, $(LNKOBJS2) to $(EXENAME)2.lnk
	$(LINK) $(EXENAME)2.lnk, $(LNKOBJS3) to $(EXENAME)3.lnk
    $(LINK) $(EXENAME)3.lnk, $(GLENDIR)\ic86.lib to $(EXENAME).lnk
	$(LOC) $(EXENAME).lnk $(LOCFLAGS)
    del $(EXENAME).lnk
    del $(EXENAME)1.lnk
    del $(EXENAME)2.lnk
    del $(EXENAME)3.lnk


# Target for building ROM version of code
jukerom: $(ROMOBJS) $(JUKEOBJS)
	$(LINK) $(ROMOBJS) $(JUKEOBJS)
	$(HEXMAKE) jukebox


# Target for cleaning house
.PHONY: clean
clean:
	del jukebox
    del jukebox.hex
    make organize

# Target for removing unneeded files (everything except executables)    
organize:
    del *.mp2
    del *.lnk
    del *.obj
    del $(OBJDIR)\*.obj
    del $(SRCDIR)\*.obj
    del $(GLENDIR)\*.obj
    del *.lst
    del $(OBJDIR)\*.lst
    del $(SRCDIR)\*.lst
    del $(GLENDIR)\*.lst
    del *.mp1
    del $(OBJDIR)\*.mp1
    del $(SRCDIR)\*.mp1
    del $(GLENDIR)\*.mp1


### GENERAL TARGETS ##########################################################

# Targets for Jukebox Code (Supplied by Glen)
mainloop.obj : $(GLENDIR)\mainloop.c $(GLENDIR)\interfac.h $(GLENDIR)\mp3defs.h \
						 $(GLENDIR)\keyproc.h $(GLENDIR)\updatfnc.h \
						 $(GLENDIR)\trakutil.h $(GLENDIR)\fatutil.h
	$(CC) $(GLENDIR)\$(@,.obj=.c) $(CFLAGS) object($(OBJDIR)\$@)

playmp3.obj	 : $(GLENDIR)\playmp3.c $(GLENDIR)\mp3defs.h $(GLENDIR)\keyproc.h \
						 $(GLENDIR)\updatfnc.h $(GLENDIR)\trakutil.h $(GLENDIR)\fatutil.h
	$(CC) $(GLENDIR)\$(@,.obj=.c) $(CFLAGS) object($(OBJDIR)\$@)

ffrev.obj	 : $(GLENDIR)\ffrev.c $(GLENDIR)\mp3defs.h $(GLENDIR)\keyproc.h \
						 $(GLENDIR)\updatfnc.h $(GLENDIR)\trakutil.h $(GLENDIR)\fatutil.h
	$(CC) $(GLENDIR)\$(@,.obj=.c) $(CFLAGS) object($(OBJDIR)\$@)

keyupdat.obj : $(GLENDIR)\keyupdat.c $(GLENDIR)\interfac.h $(GLENDIR)\mp3defs.h \
						 $(GLENDIR)\keyproc.h $(GLENDIR)\updatfnc.h \
						 $(GLENDIR)\trakutil.h $(GLENDIR)\fatutil.h
	$(CC) $(GLENDIR)\$(@,.obj=.c) $(CFLAGS) object($(OBJDIR)\$@)

trakutil.obj : $(GLENDIR)\trakutil.c $(GLENDIR)\interfac.h $(GLENDIR)\mp3defs.h \
						 $(GLENDIR)\trakutil.h $(GLENDIR)\fatutil.h $(GLENDIR)\vfat.h
	$(CC) $(GLENDIR)\$(@,.obj=.c) $(CFLAGS) object($(OBJDIR)\$@)

fatutil.obj	 : $(GLENDIR)\fatutil.c $(GLENDIR)\mp3defs.h $(GLENDIR)\interfac.h \
						 $(GLENDIR)\vfat.h $(GLENDIR)\fatutil.h
	$(CC) $(GLENDIR)\$(@,.obj=.c) $(CFLAGS) object($(OBJDIR)\$@)

stubfncs.obj : $(GLENDIR)\stubfncs.c $(GLENDIR)\mp3defs.h
	$(CC) $(GLENDIR)\$(@,.obj=.c) $(CFLAGS) object($(OBJDIR)\$@)

simide.obj	 : $(GLENDIR)\simide.c $(GLENDIR)\mp3defs.h $(GLENDIR)\interfac.h
	$(CC) $(GLENDIR)\$(@,.obj=.c) $(CFLAGS) object($(OBJDIR)\$@)

lib188.obj	 : $(GLENDIR)\lib188.asm
	$(ASM) $(GLENDIR)\$(@,.obj=.asm) $(ASMFLAGS) object($(OBJDIR)\$@)
    

# Targets for Jukebox Code (Created by me)

irqvects.obj : $(SRCDIR)\irqvects.asm $(SRCDIR)\irqvects.inc
	$(ASM) $(SRCDIR)\$(@,.obj=.asm) $(ASMFLAGS) object($(OBJDIR)\$@)

chipslct.obj : $(SRCDIR)\chipslct.asm $(SRCDIR)\chipslct.inc
	$(ASM) $(SRCDIR)\$(@,.obj=.asm) $(ASMFLAGS) object($(OBJDIR)\$@)

ivt.obj      : $(SRCDIR)\ivt.asm $(SRCDIR)\ivt.inc
	$(ASM) $(SRCDIR)\$(@,.obj=.asm) $(ASMFLAGS) object($(OBJDIR)\$@)

queues.obj   : $(SRCDIR)\queues.asm $(SRCDIR)\queues.inc
	$(ASM) $(SRCDIR)\$(@,.obj=.asm) $(ASMFLAGS) object($(OBJDIR)\$@)

buttons.obj  : $(SRCDIR)\buttons.asm $(SRCDIR)\buttons.inc
	$(ASM) $(SRCDIR)\$(@,.obj=.asm) $(ASMFLAGS) object($(OBJDIR)\$@)

encoder.obj  : $(SRCDIR)\encoder.asm $(SRCDIR)\encoder.inc
	$(ASM) $(SRCDIR)\$(@,.obj=.asm) $(ASMFLAGS) object($(OBJDIR)\$@)

main.obj	 : $(SRCDIR)\main.asm
	$(ASM) $(SRCDIR)\$(@,.obj=.asm) $(ASMFLAGS) object($(OBJDIR)\$@)
