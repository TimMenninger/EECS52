
########## Tcl recorder starts at 09/25/16 08:35:31 ##########

set version "2.0"
set proj_dir "C:/Users/Tim/Desktop/Classes/eecs52/Software/ABEL/src/support"
cd $proj_dir

# Get directory paths
set pver $version
regsub -all {\.} $pver {_} pver
set lscfile "lsc_"
append lscfile $pver ".ini"
set lsvini_dir [lindex [array get env LSC_INI_PATH] 1]
set lsvini_path [file join $lsvini_dir $lscfile]
if {[catch {set fid [open $lsvini_path]} msg]} {
	 puts "File Open Error: $lsvini_path"
	 return false
} else {set data [read $fid]; close $fid }
foreach line [split $data '\n'] { 
	set lline [string tolower $line]
	set lline [string trim $lline]
	if {[string compare $lline "\[paths\]"] == 0} { set path 1; continue}
	if {$path && [regexp {^\[} $lline]} {set path 0; break}
	if {$path && [regexp {^bin} $lline]} {set cpld_bin $line; continue}
	if {$path && [regexp {^fpgapath} $lline]} {set fpga_dir $line; continue}
	if {$path && [regexp {^fpgabinpath} $lline]} {set fpga_bin $line}}

set cpld_bin [string range $cpld_bin [expr [string first "=" $cpld_bin]+1] end]
regsub -all "\"" $cpld_bin "" cpld_bin
set cpld_bin [file join $cpld_bin]
set install_dir [string range $cpld_bin 0 [expr [string first "ispcpld" $cpld_bin]-2]]
regsub -all "\"" $install_dir "" install_dir
set install_dir [file join $install_dir]
set fpga_dir [string range $fpga_dir [expr [string first "=" $fpga_dir]+1] end]
regsub -all "\"" $fpga_dir "" fpga_dir
set fpga_dir [file join $fpga_dir]
set fpga_bin [string range $fpga_bin [expr [string first "=" $fpga_bin]+1] end]
regsub -all "\"" $fpga_bin "" fpga_bin
set fpga_bin [file join $fpga_bin]

if {[string match "*$fpga_bin;*" $env(PATH)] == 0 } {
   set env(PATH) "$fpga_bin;$env(PATH)" }

if {[string match "*$cpld_bin;*" $env(PATH)] == 0 } {
   set env(PATH) "$cpld_bin;$env(PATH)" }

lappend auto_path [file join $install_dir "ispcpld" "tcltk" "lib" "ispwidget" "runproc"]
package require runcmd

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 08:35:31 ###########


########## Tcl recorder starts at 09/25/16 08:48:05 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 08:48:05 ###########


########## Tcl recorder starts at 09/25/16 08:48:37 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 08:48:37 ###########


########## Tcl recorder starts at 09/25/16 08:48:41 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 08:48:41 ###########


########## Tcl recorder starts at 09/25/16 08:49:05 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 08:49:05 ###########


########## Tcl recorder starts at 09/25/16 08:49:09 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 08:49:09 ###########


########## Tcl recorder starts at 09/25/16 08:50:06 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 08:50:06 ###########


########## Tcl recorder starts at 09/25/16 08:50:11 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 08:50:11 ###########


########## Tcl recorder starts at 09/25/16 08:50:47 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 08:50:47 ###########


########## Tcl recorder starts at 09/25/16 08:50:49 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 08:50:49 ###########


########## Tcl recorder starts at 09/25/16 08:51:20 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 08:51:20 ###########


########## Tcl recorder starts at 09/25/16 08:51:22 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 08:51:22 ###########


########## Tcl recorder starts at 09/25/16 14:51:09 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 14:51:09 ###########


########## Tcl recorder starts at 09/25/16 14:51:10 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 14:51:10 ###########


########## Tcl recorder starts at 09/25/16 14:51:23 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 14:51:23 ###########


########## Tcl recorder starts at 09/25/16 14:51:25 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 14:51:25 ###########


########## Tcl recorder starts at 09/25/16 14:52:58 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 14:52:58 ###########


########## Tcl recorder starts at 09/25/16 14:53:10 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 14:53:10 ###########


########## Tcl recorder starts at 09/25/16 14:53:12 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 14:53:12 ###########


########## Tcl recorder starts at 09/25/16 14:53:49 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 14:53:49 ###########


########## Tcl recorder starts at 09/25/16 14:53:51 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 14:53:51 ###########


########## Tcl recorder starts at 09/25/16 14:54:55 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 14:54:55 ###########


########## Tcl recorder starts at 09/25/16 14:55:00 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 14:55:00 ###########


########## Tcl recorder starts at 09/25/16 14:55:36 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 14:55:36 ###########


########## Tcl recorder starts at 09/25/16 14:56:14 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 14:56:14 ###########


########## Tcl recorder starts at 09/25/16 14:59:38 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 14:59:38 ###########


########## Tcl recorder starts at 09/25/16 14:59:40 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 14:59:40 ###########


########## Tcl recorder starts at 09/25/16 15:00:09 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:00:09 ###########


########## Tcl recorder starts at 09/25/16 15:00:11 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:00:11 ###########


########## Tcl recorder starts at 09/25/16 15:00:50 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:00:50 ###########


########## Tcl recorder starts at 09/25/16 15:01:00 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:01:00 ###########


########## Tcl recorder starts at 09/25/16 15:01:02 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:01:02 ###########


########## Tcl recorder starts at 09/25/16 15:01:48 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:01:48 ###########


########## Tcl recorder starts at 09/25/16 15:01:55 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:01:55 ###########


########## Tcl recorder starts at 09/25/16 15:02:23 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:02:23 ###########


########## Tcl recorder starts at 09/25/16 15:02:27 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:02:27 ###########


########## Tcl recorder starts at 09/25/16 15:04:29 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:04:29 ###########


########## Tcl recorder starts at 09/25/16 15:07:37 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:07:37 ###########


########## Tcl recorder starts at 09/25/16 15:07:47 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:07:47 ###########


########## Tcl recorder starts at 09/25/16 15:08:55 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:08:55 ###########


########## Tcl recorder starts at 09/25/16 15:09:11 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:09:11 ###########


########## Tcl recorder starts at 09/25/16 15:09:13 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:09:13 ###########


########## Tcl recorder starts at 09/25/16 15:09:36 ##########

# Commands to make the Process: 
# Simulate JEDEC File
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -vec -ovec \"gal16v8.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"Jukebox.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"gal16v8.bl2\" -omod Jukebox -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" gal16v8.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" gal16v8.bl3 -pla -o gal16v8.tt2 -dev p16v8 -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" gal16v8.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" gal16v8.tt3 -dev p16v8 -o gal16v8.jed -ivec gal16v8.tmv -rep gal16v8.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/jedsim\" gal16v8.jed -o gal16v8.smj -ostatus gal16v8.sts -tra table detail -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:09:36 ###########


########## Tcl recorder starts at 09/25/16 15:10:35 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -vec -ovec \"gal16v8.tmv\" -sim gal16v8  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" \"Jukebox.bl0\" -o \"Jukebox.lsi\" -template \"$install_dir/ispcpld/plsi/latsim/plsi.tft\" -testfix -bus rebuild -prj gal16v8 -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" Jukebox.bl0 -o Jukebox.btp -template \"$install_dir/ispcpld/pld/j2mod.tft\" -testfix -bus rebuild -prj gal16v8 -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -vec -ovec \"gal16v8.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"Jukebox.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"gal16v8.bl2\" -omod Jukebox -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" gal16v8.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" gal16v8.bl3 -pla -o gal16v8.tt2 -dev p16v8 -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" gal16v8.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" gal16v8.tt3 -dev p16v8 -o gal16v8.jed -ivec gal16v8.tmv -rep gal16v8.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open gal16v8.psl w} rspFile] {
	puts stderr "Cannot create response file gal16v8.psl: $rspFile"
} else {
	puts $rspFile "-dev p16v8 -part LAT GAL16V8D-20QPI GAL -o gal16v8.tim
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/timsel\" @gal16v8.psl"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8.psl
if [catch {open gal16v8._sp w} rspFile] {
	puts stderr "Cannot create response file gal16v8._sp: $rspFile"
} else {
	puts $rspFile "#insert -- NOTE: Do not edit this file.
#insert -- Auto generated by Post-Route Verilog Simulation Models
#insert --
#unixpath
#unixpath $install_dir/ispcpld/pld/verilog
#libfile pldlib.v
#unixpath
#vlog \"$proj_dir/gal16v8.vt\"
#insert -- End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"gal16v8._sp\" \"gal16v8.vtl\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8._sp
if [catch {open gal16v8._sp w} rspFile] {
	puts stderr "Cannot create response file gal16v8._sp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by Post-Route Verilog Simulation Models
#insert #
#unixpath
#unixpath $install_dir/ispcpld/pld/verilog
#libfile pldlib.v
#unixpath
#vlog \"$proj_dir/gal16v8.vt\"
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"gal16v8._sp\" \"gal16v8.vatl\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8._sp
if [runCmd "\"$cpld_bin/j2sim\" gal16v8.jed -dly custom gal16v8.tim -pldbus default Jukebox.btp -o gal16v8.sim -module Jukebox -suppress -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Timing Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.post1 -ini simcpls.ini -all simcp.post1
-cfg oaipldtg.fdk \"gal16v8.lts\" -map \"Jukebox.lsi\"
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:10:35 ###########


########## Tcl recorder starts at 09/25/16 15:10:52 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:10:53 ###########


########## Tcl recorder starts at 09/25/16 15:10:54 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -vec -ovec \"gal16v8.tmv\" -sim gal16v8  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" \"Jukebox.bl0\" -o \"Jukebox.lsi\" -template \"$install_dir/ispcpld/plsi/latsim/plsi.tft\" -testfix -bus rebuild -prj gal16v8 -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" Jukebox.bl0 -o Jukebox.btp -template \"$install_dir/ispcpld/pld/j2mod.tft\" -testfix -bus rebuild -prj gal16v8 -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -vec -ovec \"gal16v8.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"Jukebox.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"gal16v8.bl2\" -omod Jukebox -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" gal16v8.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" gal16v8.bl3 -pla -o gal16v8.tt2 -dev p16v8 -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" gal16v8.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" gal16v8.tt3 -dev p16v8 -o gal16v8.jed -ivec gal16v8.tmv -rep gal16v8.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open gal16v8.psl w} rspFile] {
	puts stderr "Cannot create response file gal16v8.psl: $rspFile"
} else {
	puts $rspFile "-dev p16v8 -part LAT GAL16V8D-20QPI GAL -o gal16v8.tim
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/timsel\" @gal16v8.psl"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8.psl
if [catch {open gal16v8._sp w} rspFile] {
	puts stderr "Cannot create response file gal16v8._sp: $rspFile"
} else {
	puts $rspFile "#insert -- NOTE: Do not edit this file.
#insert -- Auto generated by Post-Route Verilog Simulation Models
#insert --
#unixpath
#unixpath $install_dir/ispcpld/pld/verilog
#libfile pldlib.v
#unixpath
#vlog \"$proj_dir/gal16v8.vt\"
#insert -- End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"gal16v8._sp\" \"gal16v8.vtl\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8._sp
if [catch {open gal16v8._sp w} rspFile] {
	puts stderr "Cannot create response file gal16v8._sp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by Post-Route Verilog Simulation Models
#insert #
#unixpath
#unixpath $install_dir/ispcpld/pld/verilog
#libfile pldlib.v
#unixpath
#vlog \"$proj_dir/gal16v8.vt\"
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"gal16v8._sp\" \"gal16v8.vatl\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8._sp
if [runCmd "\"$cpld_bin/j2sim\" gal16v8.jed -dly custom gal16v8.tim -pldbus default Jukebox.btp -o gal16v8.sim -module Jukebox -suppress -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Timing Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.post1 -ini simcpls.ini -all simcp.post1
-cfg oaipldtg.fdk \"gal16v8.lts\" -map \"Jukebox.lsi\"
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:10:54 ###########


########## Tcl recorder starts at 09/25/16 15:11:03 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:11:04 ###########


########## Tcl recorder starts at 09/25/16 15:11:39 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:11:39 ###########


########## Tcl recorder starts at 09/25/16 15:11:44 ##########

# Commands to make the Process: 
# Simulate JEDEC File
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -vec -ovec \"gal16v8.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"Jukebox.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"gal16v8.bl2\" -omod Jukebox -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" gal16v8.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" gal16v8.bl3 -pla -o gal16v8.tt2 -dev p16v8 -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" gal16v8.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" gal16v8.tt3 -dev p16v8 -o gal16v8.jed -ivec gal16v8.tmv -rep gal16v8.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/jedsim\" gal16v8.jed -o gal16v8.smj -ostatus gal16v8.sts -tra table detail -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:11:44 ###########


########## Tcl recorder starts at 09/25/16 15:11:55 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -vec -ovec \"gal16v8.tmv\" -sim gal16v8  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" \"Jukebox.bl0\" -o \"Jukebox.lsi\" -template \"$install_dir/ispcpld/plsi/latsim/plsi.tft\" -testfix -bus rebuild -prj gal16v8 -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" Jukebox.bl0 -o Jukebox.btp -template \"$install_dir/ispcpld/pld/j2mod.tft\" -testfix -bus rebuild -prj gal16v8 -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -vec -ovec \"gal16v8.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"Jukebox.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"gal16v8.bl2\" -omod Jukebox -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" gal16v8.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" gal16v8.bl3 -pla -o gal16v8.tt2 -dev p16v8 -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" gal16v8.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" gal16v8.tt3 -dev p16v8 -o gal16v8.jed -ivec gal16v8.tmv -rep gal16v8.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open gal16v8.psl w} rspFile] {
	puts stderr "Cannot create response file gal16v8.psl: $rspFile"
} else {
	puts $rspFile "-dev p16v8 -part LAT GAL16V8D-20QPI GAL -o gal16v8.tim
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/timsel\" @gal16v8.psl"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8.psl
if [catch {open gal16v8._sp w} rspFile] {
	puts stderr "Cannot create response file gal16v8._sp: $rspFile"
} else {
	puts $rspFile "#insert -- NOTE: Do not edit this file.
#insert -- Auto generated by Post-Route Verilog Simulation Models
#insert --
#unixpath
#unixpath $install_dir/ispcpld/pld/verilog
#libfile pldlib.v
#unixpath
#vlog \"$proj_dir/gal16v8.vt\"
#insert -- End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"gal16v8._sp\" \"gal16v8.vtl\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8._sp
if [catch {open gal16v8._sp w} rspFile] {
	puts stderr "Cannot create response file gal16v8._sp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by Post-Route Verilog Simulation Models
#insert #
#unixpath
#unixpath $install_dir/ispcpld/pld/verilog
#libfile pldlib.v
#unixpath
#vlog \"$proj_dir/gal16v8.vt\"
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"gal16v8._sp\" \"gal16v8.vatl\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8._sp
if [runCmd "\"$cpld_bin/j2sim\" gal16v8.jed -dly custom gal16v8.tim -pldbus default Jukebox.btp -o gal16v8.sim -module Jukebox -suppress -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Timing Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.post1 -ini simcpls.ini -all simcp.post1
-cfg oaipldtg.fdk \"gal16v8.lts\" -map \"Jukebox.lsi\"
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:11:55 ###########


########## Tcl recorder starts at 09/25/16 15:13:13 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:13:13 ###########


########## Tcl recorder starts at 09/25/16 15:13:18 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:13:18 ###########


########## Tcl recorder starts at 09/25/16 15:13:22 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -vec -ovec \"gal16v8.tmv\" -sim gal16v8  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" \"Jukebox.bl0\" -o \"Jukebox.lsi\" -template \"$install_dir/ispcpld/plsi/latsim/plsi.tft\" -testfix -bus rebuild -prj gal16v8 -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" Jukebox.bl0 -o Jukebox.btp -template \"$install_dir/ispcpld/pld/j2mod.tft\" -testfix -bus rebuild -prj gal16v8 -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -vec -ovec \"gal16v8.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"Jukebox.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"gal16v8.bl2\" -omod Jukebox -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" gal16v8.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" gal16v8.bl3 -pla -o gal16v8.tt2 -dev p16v8 -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" gal16v8.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" gal16v8.tt3 -dev p16v8 -o gal16v8.jed -ivec gal16v8.tmv -rep gal16v8.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open gal16v8.psl w} rspFile] {
	puts stderr "Cannot create response file gal16v8.psl: $rspFile"
} else {
	puts $rspFile "-dev p16v8 -part LAT GAL16V8D-20QPI GAL -o gal16v8.tim
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/timsel\" @gal16v8.psl"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8.psl
if [catch {open gal16v8._sp w} rspFile] {
	puts stderr "Cannot create response file gal16v8._sp: $rspFile"
} else {
	puts $rspFile "#insert -- NOTE: Do not edit this file.
#insert -- Auto generated by Post-Route Verilog Simulation Models
#insert --
#unixpath
#unixpath $install_dir/ispcpld/pld/verilog
#libfile pldlib.v
#unixpath
#vlog \"$proj_dir/gal16v8.vt\"
#insert -- End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"gal16v8._sp\" \"gal16v8.vtl\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8._sp
if [catch {open gal16v8._sp w} rspFile] {
	puts stderr "Cannot create response file gal16v8._sp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by Post-Route Verilog Simulation Models
#insert #
#unixpath
#unixpath $install_dir/ispcpld/pld/verilog
#libfile pldlib.v
#unixpath
#vlog \"$proj_dir/gal16v8.vt\"
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"gal16v8._sp\" \"gal16v8.vatl\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8._sp
if [runCmd "\"$cpld_bin/j2sim\" gal16v8.jed -dly custom gal16v8.tim -pldbus default Jukebox.btp -o gal16v8.sim -module Jukebox -suppress -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Timing Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.post1 -ini simcpls.ini -all simcp.post1
-cfg oaipldtg.fdk \"gal16v8.lts\" -map \"Jukebox.lsi\"
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:13:22 ###########


########## Tcl recorder starts at 09/25/16 15:14:36 ##########

# Commands to make the Process: 
# Functional Simulation
if [runCmd "\"$cpld_bin/iblifopt\" \"Jukebox.bl0\" -o \"Jukebox.blo\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.blo\" -o \"gal16v8.blh\" -omod gal16v8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"gal16v8.blh\" -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i \"gal16v8.bli\" -o \"gal16v8.blj\" -idev PLSI -propadd -dev pla_basic -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre1 -ini simcpls.ini -unit simcp.pre1
-cfg oaipldtg.fdk \"gal16v8.lts\" -map \"Jukebox.lsi\"
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:14:36 ###########


########## Tcl recorder starts at 09/25/16 15:16:33 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:16:33 ###########


########## Tcl recorder starts at 09/25/16 15:16:42 ##########

# Commands to make the Process: 
# Compile Test Vectors
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -vec -ovec \"gal16v8.tmv\" -sim gal16v8  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:16:42 ###########


########## Tcl recorder starts at 09/25/16 15:16:44 ##########

# Commands to make the Process: 
# Functional Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" \"Jukebox.bl0\" -o \"Jukebox.lsi\" -template \"$install_dir/ispcpld/plsi/latsim/plsi.tft\" -testfix -bus rebuild -prj gal16v8 -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"Jukebox.bl0\" -o \"Jukebox.blo\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.blo\" -o \"gal16v8.blh\" -omod gal16v8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"gal16v8.blh\" -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i \"gal16v8.bli\" -o \"gal16v8.blj\" -idev PLSI -propadd -dev pla_basic -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre1 -ini simcpls.ini -unit simcp.pre1
-cfg oaipldtg.fdk \"gal16v8.lts\" -map \"Jukebox.lsi\"
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:16:44 ###########


########## Tcl recorder starts at 09/25/16 15:17:07 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:17:07 ###########


########## Tcl recorder starts at 09/25/16 15:17:11 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:17:11 ###########


########## Tcl recorder starts at 09/25/16 15:17:13 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:17:13 ###########


########## Tcl recorder starts at 09/25/16 15:19:48 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:19:48 ###########


########## Tcl recorder starts at 09/25/16 15:26:11 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:26:11 ###########


########## Tcl recorder starts at 09/25/16 15:26:38 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:26:38 ###########


########## Tcl recorder starts at 09/25/16 15:26:41 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:26:41 ###########


########## Tcl recorder starts at 09/25/16 15:26:45 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -vec -ovec \"gal16v8.tmv\" -sim gal16v8  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" \"Jukebox.bl0\" -o \"Jukebox.lsi\" -template \"$install_dir/ispcpld/plsi/latsim/plsi.tft\" -testfix -bus rebuild -prj gal16v8 -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" Jukebox.bl0 -o Jukebox.btp -template \"$install_dir/ispcpld/pld/j2mod.tft\" -testfix -bus rebuild -prj gal16v8 -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -vec -ovec \"gal16v8.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"Jukebox.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"gal16v8.bl2\" -omod Jukebox -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" gal16v8.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" gal16v8.bl3 -pla -o gal16v8.tt2 -dev p16v8 -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" gal16v8.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" gal16v8.tt3 -dev p16v8 -o gal16v8.jed -ivec gal16v8.tmv -rep gal16v8.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open gal16v8.psl w} rspFile] {
	puts stderr "Cannot create response file gal16v8.psl: $rspFile"
} else {
	puts $rspFile "-dev p16v8 -part LAT GAL16V8D-20QPI GAL -o gal16v8.tim
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/timsel\" @gal16v8.psl"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8.psl
if [catch {open gal16v8._sp w} rspFile] {
	puts stderr "Cannot create response file gal16v8._sp: $rspFile"
} else {
	puts $rspFile "#insert -- NOTE: Do not edit this file.
#insert -- Auto generated by Post-Route Verilog Simulation Models
#insert --
#unixpath
#unixpath $install_dir/ispcpld/pld/verilog
#libfile pldlib.v
#unixpath
#vlog \"$proj_dir/gal16v8.vt\"
#insert -- End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"gal16v8._sp\" \"gal16v8.vtl\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8._sp
if [catch {open gal16v8._sp w} rspFile] {
	puts stderr "Cannot create response file gal16v8._sp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by Post-Route Verilog Simulation Models
#insert #
#unixpath
#unixpath $install_dir/ispcpld/pld/verilog
#libfile pldlib.v
#unixpath
#vlog \"$proj_dir/gal16v8.vt\"
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"gal16v8._sp\" \"gal16v8.vatl\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8._sp
if [runCmd "\"$cpld_bin/j2sim\" gal16v8.jed -dly custom gal16v8.tim -pldbus default Jukebox.btp -o gal16v8.sim -module Jukebox -suppress -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Timing Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.post1 -ini simcpls.ini -all simcp.post1
-cfg oaipldtg.fdk \"gal16v8.lts\" -map \"Jukebox.lsi\"
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:26:45 ###########


########## Tcl recorder starts at 09/25/16 15:26:59 ##########

# Commands to make the Process: 
# Functional Simulation
if [runCmd "\"$cpld_bin/iblifopt\" \"Jukebox.bl0\" -o \"Jukebox.blo\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.blo\" -o \"gal16v8.blh\" -omod gal16v8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"gal16v8.blh\" -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i \"gal16v8.bli\" -o \"gal16v8.blj\" -idev PLSI -propadd -dev pla_basic -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre1 -ini simcpls.ini -unit simcp.pre1
-cfg oaipldtg.fdk \"gal16v8.lts\" -map \"Jukebox.lsi\"
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:26:59 ###########


########## Tcl recorder starts at 09/25/16 15:27:28 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/fit\" gal16v8.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" gal16v8.tt3 -dev p16v8 -o gal16v8.jed -ivec gal16v8.tmv -rep gal16v8.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open gal16v8.psl w} rspFile] {
	puts stderr "Cannot create response file gal16v8.psl: $rspFile"
} else {
	puts $rspFile "-dev p16v8 -part LAT GAL16V8D-20QPI GAL -o gal16v8.tim
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/timsel\" @gal16v8.psl"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8.psl
if [catch {open gal16v8._sp w} rspFile] {
	puts stderr "Cannot create response file gal16v8._sp: $rspFile"
} else {
	puts $rspFile "#insert -- NOTE: Do not edit this file.
#insert -- Auto generated by Post-Route Verilog Simulation Models
#insert --
#unixpath
#unixpath $install_dir/ispcpld/pld/verilog
#libfile pldlib.v
#unixpath
#vlog \"$proj_dir/gal16v8.vt\"
#insert -- End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"gal16v8._sp\" \"gal16v8.vtl\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8._sp
if [catch {open gal16v8._sp w} rspFile] {
	puts stderr "Cannot create response file gal16v8._sp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by Post-Route Verilog Simulation Models
#insert #
#unixpath
#unixpath $install_dir/ispcpld/pld/verilog
#libfile pldlib.v
#unixpath
#vlog \"$proj_dir/gal16v8.vt\"
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"gal16v8._sp\" \"gal16v8.vatl\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8._sp
if [runCmd "\"$cpld_bin/j2sim\" gal16v8.jed -dly custom gal16v8.tim -pldbus default Jukebox.btp -o gal16v8.sim -module Jukebox -suppress -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Timing Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.post1 -ini simcpls.ini -all simcp.post1
-cfg oaipldtg.fdk \"gal16v8.lts\" -map \"Jukebox.lsi\"
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:27:28 ###########


########## Tcl recorder starts at 09/25/16 15:29:10 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:29:10 ###########


########## Tcl recorder starts at 09/25/16 15:29:15 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:29:15 ###########


########## Tcl recorder starts at 09/25/16 15:29:18 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -vec -ovec \"gal16v8.tmv\" -sim gal16v8  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" \"Jukebox.bl0\" -o \"Jukebox.lsi\" -template \"$install_dir/ispcpld/plsi/latsim/plsi.tft\" -testfix -bus rebuild -prj gal16v8 -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" Jukebox.bl0 -o Jukebox.btp -template \"$install_dir/ispcpld/pld/j2mod.tft\" -testfix -bus rebuild -prj gal16v8 -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -vec -ovec \"gal16v8.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"Jukebox.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"gal16v8.bl2\" -omod Jukebox -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" gal16v8.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" gal16v8.bl3 -pla -o gal16v8.tt2 -dev p16v8 -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" gal16v8.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" gal16v8.tt3 -dev p16v8 -o gal16v8.jed -ivec gal16v8.tmv -rep gal16v8.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open gal16v8.psl w} rspFile] {
	puts stderr "Cannot create response file gal16v8.psl: $rspFile"
} else {
	puts $rspFile "-dev p16v8 -part LAT GAL16V8D-20QPI GAL -o gal16v8.tim
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/timsel\" @gal16v8.psl"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8.psl
if [catch {open gal16v8._sp w} rspFile] {
	puts stderr "Cannot create response file gal16v8._sp: $rspFile"
} else {
	puts $rspFile "#insert -- NOTE: Do not edit this file.
#insert -- Auto generated by Post-Route Verilog Simulation Models
#insert --
#unixpath
#unixpath $install_dir/ispcpld/pld/verilog
#libfile pldlib.v
#unixpath
#vlog \"$proj_dir/gal16v8.vt\"
#insert -- End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"gal16v8._sp\" \"gal16v8.vtl\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8._sp
if [catch {open gal16v8._sp w} rspFile] {
	puts stderr "Cannot create response file gal16v8._sp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by Post-Route Verilog Simulation Models
#insert #
#unixpath
#unixpath $install_dir/ispcpld/pld/verilog
#libfile pldlib.v
#unixpath
#vlog \"$proj_dir/gal16v8.vt\"
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"gal16v8._sp\" \"gal16v8.vatl\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8._sp
if [runCmd "\"$cpld_bin/j2sim\" gal16v8.jed -dly custom gal16v8.tim -pldbus default Jukebox.btp -o gal16v8.sim -module Jukebox -suppress -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Timing Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.post1 -ini simcpls.ini -all simcp.post1
-cfg oaipldtg.fdk \"gal16v8.lts\" -map \"Jukebox.lsi\"
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:29:18 ###########


########## Tcl recorder starts at 09/25/16 15:40:22 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"gal16v8.bl2\" -omod Jukebox -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" gal16v8.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" gal16v8.bl3 -pla -o gal16v8.tt2 -dev p16v8 -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" gal16v8.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:40:22 ###########


########## Tcl recorder starts at 09/25/16 15:41:26 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/fit\" gal16v8.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:41:26 ###########


########## Tcl recorder starts at 09/25/16 15:55:19 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:55:19 ###########


########## Tcl recorder starts at 09/25/16 15:55:52 ##########

# Commands to make the Process: 
# Functional Simulation
if [runCmd "\"$cpld_bin/blif2eqn\" \"Jukebox.bl0\" -o \"Jukebox.lsi\" -template \"$install_dir/ispcpld/plsi/latsim/plsi.tft\" -testfix -bus rebuild -prj gal16v8 -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"Jukebox.bl0\" -o \"Jukebox.blo\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.blo\" -o \"gal16v8.blh\" -omod gal16v8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"gal16v8.blh\" -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i \"gal16v8.bli\" -o \"gal16v8.blj\" -idev PLSI -propadd -dev pla_basic -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre1 -ini simcpls.ini -unit simcp.pre1
-cfg oaipldtg.fdk \"gal16v8.lts\" -map \"Jukebox.lsi\"
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:55:52 ###########


########## Tcl recorder starts at 09/25/16 15:55:59 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/blif2eqn\" Jukebox.bl0 -o Jukebox.btp -template \"$install_dir/ispcpld/pld/j2mod.tft\" -testfix -bus rebuild -prj gal16v8 -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"Jukebox.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"gal16v8.bl2\" -omod Jukebox -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" gal16v8.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" gal16v8.bl3 -pla -o gal16v8.tt2 -dev p16v8 -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" gal16v8.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" gal16v8.tt3 -dev p16v8 -o gal16v8.jed -ivec gal16v8.tmv -rep gal16v8.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open gal16v8.psl w} rspFile] {
	puts stderr "Cannot create response file gal16v8.psl: $rspFile"
} else {
	puts $rspFile "-dev p16v8 -part LAT GAL16V8D-20QPI GAL -o gal16v8.tim
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/timsel\" @gal16v8.psl"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8.psl
if [catch {open gal16v8._sp w} rspFile] {
	puts stderr "Cannot create response file gal16v8._sp: $rspFile"
} else {
	puts $rspFile "#insert -- NOTE: Do not edit this file.
#insert -- Auto generated by Post-Route Verilog Simulation Models
#insert --
#unixpath
#unixpath $install_dir/ispcpld/pld/verilog
#libfile pldlib.v
#unixpath
#vlog \"$proj_dir/gal16v8.vt\"
#insert -- End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"gal16v8._sp\" \"gal16v8.vtl\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8._sp
if [catch {open gal16v8._sp w} rspFile] {
	puts stderr "Cannot create response file gal16v8._sp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by Post-Route Verilog Simulation Models
#insert #
#unixpath
#unixpath $install_dir/ispcpld/pld/verilog
#libfile pldlib.v
#unixpath
#vlog \"$proj_dir/gal16v8.vt\"
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"gal16v8._sp\" \"gal16v8.vatl\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8._sp
if [runCmd "\"$cpld_bin/j2sim\" gal16v8.jed -dly custom gal16v8.tim -pldbus default Jukebox.btp -o gal16v8.sim -module Jukebox -suppress -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Timing Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.post1 -ini simcpls.ini -all simcp.post1
-cfg oaipldtg.fdk \"gal16v8.lts\" -map \"Jukebox.lsi\"
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:55:59 ###########


########## Tcl recorder starts at 09/25/16 15:56:59 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:56:59 ###########


########## Tcl recorder starts at 09/25/16 15:57:05 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:57:05 ###########


########## Tcl recorder starts at 09/25/16 15:57:16 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:57:16 ###########


########## Tcl recorder starts at 09/25/16 15:57:18 ##########

# Commands to make the Process: 
# Compile Logic
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:57:18 ###########


########## Tcl recorder starts at 09/25/16 15:57:26 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/iblifopt\" \"Jukebox.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"gal16v8.bl2\" -omod Jukebox -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" gal16v8.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" gal16v8.bl3 -pla -o gal16v8.tt2 -dev p16v8 -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" gal16v8.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:57:26 ###########


########## Tcl recorder starts at 09/25/16 15:57:55 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:57:55 ###########


########## Tcl recorder starts at 09/25/16 15:57:57 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"Jukebox.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"gal16v8.bl2\" -omod Jukebox -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" gal16v8.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" gal16v8.bl3 -pla -o gal16v8.tt2 -dev p16v8 -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" gal16v8.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:57:57 ###########


########## Tcl recorder starts at 09/25/16 15:58:31 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:58:31 ###########


########## Tcl recorder starts at 09/25/16 15:58:32 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"Jukebox.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"gal16v8.bl2\" -omod Jukebox -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" gal16v8.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" gal16v8.bl3 -pla -o gal16v8.tt2 -dev p16v8 -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" gal16v8.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 15:58:32 ###########


########## Tcl recorder starts at 09/25/16 16:00:00 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 16:00:00 ###########


########## Tcl recorder starts at 09/25/16 16:00:02 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"Jukebox.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"gal16v8.bl2\" -omod Jukebox -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" gal16v8.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" gal16v8.bl3 -pla -o gal16v8.tt2 -dev p16v8 -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" gal16v8.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 16:00:02 ###########


########## Tcl recorder starts at 09/25/16 16:01:24 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 16:01:24 ###########


########## Tcl recorder starts at 09/25/16 16:01:36 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 16:01:36 ###########


########## Tcl recorder starts at 09/25/16 16:01:41 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"Jukebox.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"gal16v8.bl2\" -omod Jukebox -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" gal16v8.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" gal16v8.bl3 -pla -o gal16v8.tt2 -dev p16v8 -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" gal16v8.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 16:01:42 ###########


########## Tcl recorder starts at 09/25/16 16:10:29 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 16:10:29 ###########


########## Tcl recorder starts at 09/25/16 16:10:51 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 16:10:51 ###########


########## Tcl recorder starts at 09/25/16 16:12:24 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 16:12:25 ###########


########## Tcl recorder starts at 09/25/16 16:17:33 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 16:17:33 ###########


########## Tcl recorder starts at 09/25/16 16:19:37 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 16:19:37 ###########


########## Tcl recorder starts at 09/25/16 16:20:08 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"Jukebox.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"gal16v8.bl2\" -omod Jukebox -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" gal16v8.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" gal16v8.bl3 -pla -o gal16v8.tt2 -dev p16v8 -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" gal16v8.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 16:20:08 ###########


########## Tcl recorder starts at 09/25/16 16:21:02 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -vec -ovec \"gal16v8.tmv\" -sim gal16v8  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" \"Jukebox.bl0\" -o \"Jukebox.lsi\" -template \"$install_dir/ispcpld/plsi/latsim/plsi.tft\" -testfix -bus rebuild -prj gal16v8 -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" Jukebox.bl0 -o Jukebox.btp -template \"$install_dir/ispcpld/pld/j2mod.tft\" -testfix -bus rebuild -prj gal16v8 -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -vec -ovec \"gal16v8.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" gal16v8.tt3 -dev p16v8 -o gal16v8.jed -ivec gal16v8.tmv -rep gal16v8.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open gal16v8.psl w} rspFile] {
	puts stderr "Cannot create response file gal16v8.psl: $rspFile"
} else {
	puts $rspFile "-dev p16v8 -part LAT GAL16V8D-20QPI GAL -o gal16v8.tim
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/timsel\" @gal16v8.psl"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8.psl
if [catch {open gal16v8._sp w} rspFile] {
	puts stderr "Cannot create response file gal16v8._sp: $rspFile"
} else {
	puts $rspFile "#insert -- NOTE: Do not edit this file.
#insert -- Auto generated by Post-Route Verilog Simulation Models
#insert --
#unixpath
#unixpath $install_dir/ispcpld/pld/verilog
#libfile pldlib.v
#unixpath
#vlog \"$proj_dir/gal16v8.vt\"
#insert -- End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"gal16v8._sp\" \"gal16v8.vtl\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8._sp
if [catch {open gal16v8._sp w} rspFile] {
	puts stderr "Cannot create response file gal16v8._sp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by Post-Route Verilog Simulation Models
#insert #
#unixpath
#unixpath $install_dir/ispcpld/pld/verilog
#libfile pldlib.v
#unixpath
#vlog \"$proj_dir/gal16v8.vt\"
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"gal16v8._sp\" \"gal16v8.vatl\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8._sp
if [runCmd "\"$cpld_bin/j2sim\" gal16v8.jed -dly custom gal16v8.tim -pldbus default Jukebox.btp -o gal16v8.sim -module Jukebox -suppress -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Timing Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.post1 -ini simcpls.ini -all simcp.post1
-cfg oaipldtg.fdk \"gal16v8.lts\" -map \"Jukebox.lsi\"
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 16:21:02 ###########


########## Tcl recorder starts at 09/25/16 16:22:19 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 16:22:19 ###########


########## Tcl recorder starts at 09/25/16 16:22:25 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"Jukebox.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"gal16v8.bl2\" -omod Jukebox -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" gal16v8.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" gal16v8.bl3 -pla -o gal16v8.tt2 -dev p16v8 -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" gal16v8.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 16:22:25 ###########


########## Tcl recorder starts at 09/25/16 16:22:32 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -vec -ovec \"gal16v8.tmv\" -sim gal16v8  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" \"Jukebox.bl0\" -o \"Jukebox.lsi\" -template \"$install_dir/ispcpld/plsi/latsim/plsi.tft\" -testfix -bus rebuild -prj gal16v8 -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" Jukebox.bl0 -o Jukebox.btp -template \"$install_dir/ispcpld/pld/j2mod.tft\" -testfix -bus rebuild -prj gal16v8 -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -vec -ovec \"gal16v8.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" gal16v8.tt3 -dev p16v8 -o gal16v8.jed -ivec gal16v8.tmv -rep gal16v8.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open gal16v8.psl w} rspFile] {
	puts stderr "Cannot create response file gal16v8.psl: $rspFile"
} else {
	puts $rspFile "-dev p16v8 -part LAT GAL16V8D-20QPI GAL -o gal16v8.tim
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/timsel\" @gal16v8.psl"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8.psl
if [catch {open gal16v8._sp w} rspFile] {
	puts stderr "Cannot create response file gal16v8._sp: $rspFile"
} else {
	puts $rspFile "#insert -- NOTE: Do not edit this file.
#insert -- Auto generated by Post-Route Verilog Simulation Models
#insert --
#unixpath
#unixpath $install_dir/ispcpld/pld/verilog
#libfile pldlib.v
#unixpath
#vlog \"$proj_dir/gal16v8.vt\"
#insert -- End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"gal16v8._sp\" \"gal16v8.vtl\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8._sp
if [catch {open gal16v8._sp w} rspFile] {
	puts stderr "Cannot create response file gal16v8._sp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by Post-Route Verilog Simulation Models
#insert #
#unixpath
#unixpath $install_dir/ispcpld/pld/verilog
#libfile pldlib.v
#unixpath
#vlog \"$proj_dir/gal16v8.vt\"
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"gal16v8._sp\" \"gal16v8.vatl\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8._sp
if [runCmd "\"$cpld_bin/j2sim\" gal16v8.jed -dly custom gal16v8.tim -pldbus default Jukebox.btp -o gal16v8.sim -module Jukebox -suppress -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Timing Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.post1 -ini simcpls.ini -all simcp.post1
-cfg oaipldtg.fdk \"gal16v8.lts\" -map \"Jukebox.lsi\"
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 16:22:32 ###########


########## Tcl recorder starts at 09/25/16 16:22:52 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 16:22:52 ###########


########## Tcl recorder starts at 09/25/16 16:22:54 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"Jukebox.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"gal16v8.bl2\" -omod Jukebox -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" gal16v8.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" gal16v8.bl3 -pla -o gal16v8.tt2 -dev p16v8 -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" gal16v8.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 16:22:54 ###########


########## Tcl recorder starts at 09/25/16 16:23:00 ##########

# Commands to make the Process: 
# Functional Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -vec -ovec \"gal16v8.tmv\" -sim gal16v8  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" \"Jukebox.bl0\" -o \"Jukebox.lsi\" -template \"$install_dir/ispcpld/plsi/latsim/plsi.tft\" -testfix -bus rebuild -prj gal16v8 -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"Jukebox.bl0\" -o \"Jukebox.blo\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.blo\" -o \"gal16v8.blh\" -omod gal16v8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"gal16v8.blh\" -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i \"gal16v8.bli\" -o \"gal16v8.blj\" -idev PLSI -propadd -dev pla_basic -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre1 -ini simcpls.ini -unit simcp.pre1
-cfg oaipldtg.fdk \"gal16v8.lts\" -map \"Jukebox.lsi\"
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 16:23:00 ###########


########## Tcl recorder starts at 09/25/16 16:25:33 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 16:25:33 ###########


########## Tcl recorder starts at 09/25/16 16:25:43 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"Jukebox.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"gal16v8.bl2\" -omod Jukebox -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" gal16v8.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" gal16v8.bl3 -pla -o gal16v8.tt2 -dev p16v8 -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" gal16v8.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 16:25:43 ###########


########## Tcl recorder starts at 09/25/16 16:25:48 ##########

# Commands to make the Process: 
# Functional Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -vec -ovec \"gal16v8.tmv\" -sim gal16v8  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" \"Jukebox.bl0\" -o \"Jukebox.lsi\" -template \"$install_dir/ispcpld/plsi/latsim/plsi.tft\" -testfix -bus rebuild -prj gal16v8 -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"Jukebox.bl0\" -o \"Jukebox.blo\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.blo\" -o \"gal16v8.blh\" -omod gal16v8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"gal16v8.blh\" -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i \"gal16v8.bli\" -o \"gal16v8.blj\" -idev PLSI -propadd -dev pla_basic -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Functional Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.pre1 -ini simcpls.ini -unit simcp.pre1
-cfg oaipldtg.fdk \"gal16v8.lts\" -map \"Jukebox.lsi\"
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 16:25:48 ###########


########## Tcl recorder starts at 09/25/16 16:25:53 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/blif2eqn\" Jukebox.bl0 -o Jukebox.btp -template \"$install_dir/ispcpld/pld/j2mod.tft\" -testfix -bus rebuild -prj gal16v8 -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" gal16v8.tt3 -dev p16v8 -o gal16v8.jed -ivec gal16v8.tmv -rep gal16v8.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open gal16v8.psl w} rspFile] {
	puts stderr "Cannot create response file gal16v8.psl: $rspFile"
} else {
	puts $rspFile "-dev p16v8 -part LAT GAL16V8D-20QPI GAL -o gal16v8.tim
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/timsel\" @gal16v8.psl"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8.psl
if [catch {open gal16v8._sp w} rspFile] {
	puts stderr "Cannot create response file gal16v8._sp: $rspFile"
} else {
	puts $rspFile "#insert -- NOTE: Do not edit this file.
#insert -- Auto generated by Post-Route Verilog Simulation Models
#insert --
#unixpath
#unixpath $install_dir/ispcpld/pld/verilog
#libfile pldlib.v
#unixpath
#vlog \"$proj_dir/gal16v8.vt\"
#insert -- End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"gal16v8._sp\" \"gal16v8.vtl\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8._sp
if [catch {open gal16v8._sp w} rspFile] {
	puts stderr "Cannot create response file gal16v8._sp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by Post-Route Verilog Simulation Models
#insert #
#unixpath
#unixpath $install_dir/ispcpld/pld/verilog
#libfile pldlib.v
#unixpath
#vlog \"$proj_dir/gal16v8.vt\"
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"gal16v8._sp\" \"gal16v8.vatl\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete gal16v8._sp
if [runCmd "\"$cpld_bin/j2sim\" gal16v8.jed -dly custom gal16v8.tim -pldbus default Jukebox.btp -o gal16v8.sim -module Jukebox -suppress -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# Timing Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.post1 -ini simcpls.ini -all simcp.post1
-cfg oaipldtg.fdk \"gal16v8.lts\" -map \"Jukebox.lsi\"
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/simcp\" @simcp._sp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 16:25:53 ###########


########## Tcl recorder starts at 09/25/16 16:33:40 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"../gal16v8.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 09/25/16 16:33:40 ###########

