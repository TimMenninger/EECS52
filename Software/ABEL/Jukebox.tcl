
########## Tcl recorder starts at 02/13/16 02:49:30 ##########

set version "2.0"
set proj_dir "C:/Users/Tim/Desktop/Classes/eecs52/Software"
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
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 02:49:30 ###########


########## Tcl recorder starts at 02/13/16 02:56:37 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 02:56:37 ###########


########## Tcl recorder starts at 02/13/16 03:09:58 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:09:58 ###########


########## Tcl recorder starts at 02/13/16 03:10:34 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:10:34 ###########


########## Tcl recorder starts at 02/13/16 03:10:51 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:10:51 ###########


########## Tcl recorder starts at 02/13/16 03:11:31 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:11:31 ###########


########## Tcl recorder starts at 02/13/16 03:11:34 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:11:34 ###########


########## Tcl recorder starts at 02/13/16 03:11:59 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:11:59 ###########


########## Tcl recorder starts at 02/13/16 03:12:27 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:12:27 ###########


########## Tcl recorder starts at 02/13/16 03:12:38 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:12:38 ###########


########## Tcl recorder starts at 02/13/16 03:14:20 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:14:20 ###########


########## Tcl recorder starts at 02/13/16 03:14:27 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:14:27 ###########


########## Tcl recorder starts at 02/13/16 03:14:47 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:14:47 ###########


########## Tcl recorder starts at 02/13/16 03:14:50 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:14:50 ###########


########## Tcl recorder starts at 02/13/16 03:17:20 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:17:20 ###########


########## Tcl recorder starts at 02/13/16 03:17:22 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:17:23 ###########


########## Tcl recorder starts at 02/13/16 03:18:36 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:18:37 ###########


########## Tcl recorder starts at 02/13/16 03:18:38 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:18:38 ###########


########## Tcl recorder starts at 02/13/16 03:18:59 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:18:59 ###########


########## Tcl recorder starts at 02/13/16 03:19:02 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:19:02 ###########


########## Tcl recorder starts at 02/13/16 03:19:40 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:19:40 ###########


########## Tcl recorder starts at 02/13/16 03:19:42 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:19:42 ###########


########## Tcl recorder starts at 02/13/16 03:27:45 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:27:45 ###########


########## Tcl recorder starts at 02/13/16 03:29:26 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:29:26 ###########


########## Tcl recorder starts at 02/13/16 03:29:29 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:29:29 ###########


########## Tcl recorder starts at 02/13/16 03:32:03 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:32:03 ###########


########## Tcl recorder starts at 02/13/16 03:38:06 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:38:06 ###########


########## Tcl recorder starts at 02/13/16 03:38:09 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:38:09 ###########


########## Tcl recorder starts at 02/13/16 03:38:30 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:38:30 ###########


########## Tcl recorder starts at 02/13/16 03:38:32 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:38:33 ###########


########## Tcl recorder starts at 02/13/16 03:39:32 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:39:32 ###########


########## Tcl recorder starts at 02/13/16 03:39:35 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:39:35 ###########


########## Tcl recorder starts at 02/13/16 03:40:07 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:40:07 ###########


########## Tcl recorder starts at 02/13/16 03:48:42 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:48:42 ###########


########## Tcl recorder starts at 02/13/16 03:51:32 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:51:32 ###########


########## Tcl recorder starts at 02/13/16 03:55:52 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:55:52 ###########


########## Tcl recorder starts at 02/13/16 03:57:33 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:57:33 ###########


########## Tcl recorder starts at 02/13/16 03:57:37 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:57:37 ###########


########## Tcl recorder starts at 02/13/16 03:57:54 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:57:54 ###########


########## Tcl recorder starts at 02/13/16 03:57:57 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:57:57 ###########


########## Tcl recorder starts at 02/13/16 03:58:28 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:58:28 ###########


########## Tcl recorder starts at 02/13/16 03:58:30 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:58:30 ###########


########## Tcl recorder starts at 02/13/16 03:58:50 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:58:50 ###########


########## Tcl recorder starts at 02/13/16 03:58:52 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 03:58:53 ###########


########## Tcl recorder starts at 02/13/16 04:01:56 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 04:01:56 ###########


########## Tcl recorder starts at 02/13/16 04:19:22 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 04:19:22 ###########


########## Tcl recorder starts at 02/13/16 04:35:28 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 04:35:28 ###########


########## Tcl recorder starts at 02/13/16 04:46:43 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 04:46:43 ###########


########## Tcl recorder starts at 02/13/16 04:47:00 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 04:47:00 ###########


########## Tcl recorder starts at 02/13/16 04:50:03 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 04:50:03 ###########


########## Tcl recorder starts at 02/13/16 04:50:08 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 04:50:08 ###########


########## Tcl recorder starts at 02/13/16 04:50:48 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 04:50:48 ###########


########## Tcl recorder starts at 02/13/16 04:50:52 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 04:50:52 ###########


########## Tcl recorder starts at 02/13/16 04:51:20 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 04:51:20 ###########


########## Tcl recorder starts at 02/13/16 04:51:22 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 04:51:23 ###########


########## Tcl recorder starts at 02/13/16 05:02:59 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 05:02:59 ###########


########## Tcl recorder starts at 02/13/16 05:03:45 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 05:03:45 ###########


########## Tcl recorder starts at 02/13/16 05:13:33 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 05:13:34 ###########


########## Tcl recorder starts at 02/13/16 05:23:49 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 05:23:49 ###########


########## Tcl recorder starts at 02/13/16 05:23:53 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 05:23:53 ###########


########## Tcl recorder starts at 02/13/16 05:41:13 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 05:41:13 ###########


########## Tcl recorder starts at 02/13/16 05:42:01 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 05:42:01 ###########


########## Tcl recorder starts at 02/13/16 05:53:32 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 05:53:32 ###########


########## Tcl recorder starts at 02/13/16 05:53:38 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 05:53:38 ###########


########## Tcl recorder starts at 02/13/16 06:04:43 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:04:43 ###########


########## Tcl recorder starts at 02/13/16 06:04:59 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:04:59 ###########


########## Tcl recorder starts at 02/13/16 06:05:08 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:05:08 ###########


########## Tcl recorder starts at 02/13/16 06:05:12 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:05:12 ###########


########## Tcl recorder starts at 02/13/16 06:06:50 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:06:50 ###########


########## Tcl recorder starts at 02/13/16 06:06:53 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:06:53 ###########


########## Tcl recorder starts at 02/13/16 06:06:57 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:06:57 ###########


########## Tcl recorder starts at 02/13/16 06:07:14 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:07:14 ###########


########## Tcl recorder starts at 02/13/16 06:07:18 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:07:18 ###########


########## Tcl recorder starts at 02/13/16 06:08:15 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\" -sim Jukebox  -def _PLSI_ _LATTICE_  -err automake.err "] {
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
-cfg plsi.fdk \"jukebox.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 02/13/16 06:08:15 ###########


########## Tcl recorder starts at 02/13/16 06:09:54 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:09:54 ###########


########## Tcl recorder starts at 02/13/16 06:10:00 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:10:00 ###########


########## Tcl recorder starts at 02/13/16 06:10:13 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\" -sim Jukebox  -def _PLSI_ _LATTICE_  -err automake.err "] {
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
-cfg plsi.fdk \"jukebox.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 02/13/16 06:10:13 ###########


########## Tcl recorder starts at 02/13/16 06:13:11 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:13:11 ###########


########## Tcl recorder starts at 02/13/16 06:13:16 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:13:16 ###########


########## Tcl recorder starts at 02/13/16 06:13:25 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\" -sim Jukebox  -def _PLSI_ _LATTICE_  -err automake.err "] {
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
-cfg plsi.fdk \"jukebox.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 02/13/16 06:13:25 ###########


########## Tcl recorder starts at 02/13/16 06:15:09 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:15:09 ###########


########## Tcl recorder starts at 02/13/16 06:15:17 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:15:17 ###########


########## Tcl recorder starts at 02/13/16 06:15:27 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\" -sim Jukebox  -def _PLSI_ _LATTICE_  -err automake.err "] {
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
-cfg plsi.fdk \"jukebox.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 02/13/16 06:15:27 ###########


########## Tcl recorder starts at 02/13/16 06:16:23 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:16:23 ###########


########## Tcl recorder starts at 02/13/16 06:16:32 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:16:32 ###########


########## Tcl recorder starts at 02/13/16 06:17:35 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:17:35 ###########


########## Tcl recorder starts at 02/13/16 06:17:40 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:17:40 ###########


########## Tcl recorder starts at 02/13/16 06:17:49 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:17:49 ###########


########## Tcl recorder starts at 02/13/16 06:17:55 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\" -sim Jukebox  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" \"Jukebox.bl0\" -o \"Jukebox.lsi\" -template \"$install_dir/ispcpld/plsi/latsim/plsi.tft\" -testfix -bus rebuild -prj jukebox -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/iblifopt\" \"Jukebox.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
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
-cfg plsi.fdk \"jukebox.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 02/13/16 06:17:55 ###########


########## Tcl recorder starts at 02/13/16 06:18:57 ##########

# Commands to make the Process: 
# Timing Simulation
# - none -
# Application to view the Process: 
# Timing Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.post1 -ini simcpls.ini -all simcp.post1
-cfg plsi.fdk \"jukebox.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 02/13/16 06:18:57 ###########


########## Tcl recorder starts at 02/13/16 06:19:24 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:19:24 ###########


########## Tcl recorder starts at 02/13/16 06:19:51 ##########

# Commands to make the Process: 
# Timing Simulation
# - none -
# Application to view the Process: 
# Timing Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.post1 -ini simcpls.ini -all simcp.post1
-cfg plsi.fdk \"jukebox.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 02/13/16 06:19:51 ###########


########## Tcl recorder starts at 02/13/16 06:20:16 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:20:16 ###########


########## Tcl recorder starts at 02/13/16 06:20:20 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:20:21 ###########


########## Tcl recorder starts at 02/13/16 06:21:11 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\" -sim Jukebox  -def _PLSI_ _LATTICE_  -err automake.err "] {
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
-cfg plsi.fdk \"jukebox.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 02/13/16 06:21:12 ###########


########## Tcl recorder starts at 02/13/16 06:22:40 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:22:40 ###########


########## Tcl recorder starts at 02/13/16 06:22:45 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\" -sim Jukebox  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" \"Jukebox.bl0\" -o \"Jukebox.lsi\" -template \"$install_dir/ispcpld/plsi/latsim/plsi.tft\" -testfix -bus rebuild -prj jukebox -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/iblifopt\" \"Jukebox.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
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
-cfg plsi.fdk \"jukebox.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 02/13/16 06:22:45 ###########


########## Tcl recorder starts at 02/13/16 06:35:37 ##########

set version "2.0"
set proj_dir "C:/Users/Tim/Desktop/Classes/eecs52/Software/ABEL"
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
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:35:37 ###########


########## Tcl recorder starts at 02/13/16 06:35:59 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\" -sim Jukebox  -def _PLSI_ _LATTICE_  -err automake.err "] {
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
-cfg plsi.fdk \"jukebox.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 02/13/16 06:35:59 ###########


########## Tcl recorder starts at 02/13/16 06:38:02 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:38:02 ###########


########## Tcl recorder starts at 02/13/16 06:38:30 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:38:30 ###########


########## Tcl recorder starts at 02/13/16 06:39:05 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\" -sim Jukebox  -def _PLSI_ _LATTICE_  -err automake.err "] {
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
-cfg plsi.fdk \"jukebox.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 02/13/16 06:39:05 ###########


########## Tcl recorder starts at 02/13/16 06:41:00 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:41:00 ###########


########## Tcl recorder starts at 02/13/16 06:41:06 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:41:06 ###########


########## Tcl recorder starts at 02/13/16 06:41:14 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\" -sim Jukebox  -def _PLSI_ _LATTICE_  -err automake.err "] {
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
-cfg plsi.fdk \"jukebox.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 02/13/16 06:41:14 ###########


########## Tcl recorder starts at 02/13/16 06:41:32 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:41:32 ###########


########## Tcl recorder starts at 02/13/16 06:42:31 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:42:31 ###########


########## Tcl recorder starts at 02/13/16 06:43:18 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:43:18 ###########


########## Tcl recorder starts at 02/13/16 06:43:23 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:43:23 ###########


########## Tcl recorder starts at 02/13/16 06:43:33 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:43:33 ###########


########## Tcl recorder starts at 02/13/16 06:43:36 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:43:36 ###########


########## Tcl recorder starts at 02/13/16 06:43:56 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:43:56 ###########


########## Tcl recorder starts at 02/13/16 06:43:59 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:43:59 ###########


########## Tcl recorder starts at 02/13/16 06:44:10 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\" -sim Jukebox  -def _PLSI_ _LATTICE_  -err automake.err "] {
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
-cfg plsi.fdk \"jukebox.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 02/13/16 06:44:10 ###########


########## Tcl recorder starts at 02/13/16 06:53:34 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:53:34 ###########


########## Tcl recorder starts at 02/13/16 06:53:40 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:53:40 ###########


########## Tcl recorder starts at 02/13/16 06:53:50 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\" -sim Jukebox  -def _PLSI_ _LATTICE_  -err automake.err "] {
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
-cfg plsi.fdk \"jukebox.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 02/13/16 06:53:50 ###########


########## Tcl recorder starts at 02/13/16 06:57:04 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:57:04 ###########


########## Tcl recorder starts at 02/13/16 06:57:44 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:57:44 ###########


########## Tcl recorder starts at 02/13/16 06:57:49 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:57:49 ###########


########## Tcl recorder starts at 02/13/16 06:57:58 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\" -sim Jukebox  -def _PLSI_ _LATTICE_  -err automake.err "] {
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
-cfg plsi.fdk \"jukebox.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 02/13/16 06:57:58 ###########


########## Tcl recorder starts at 02/13/16 06:59:16 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:59:16 ###########


########## Tcl recorder starts at 02/13/16 06:59:23 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 06:59:23 ###########


########## Tcl recorder starts at 02/13/16 06:59:31 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\" -sim Jukebox  -def _PLSI_ _LATTICE_  -err automake.err "] {
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
-cfg plsi.fdk \"jukebox.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 02/13/16 06:59:31 ###########


########## Tcl recorder starts at 02/13/16 07:03:29 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 07:03:29 ###########


########## Tcl recorder starts at 02/13/16 07:08:27 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 07:08:27 ###########


########## Tcl recorder starts at 02/13/16 07:08:31 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 07:08:31 ###########


########## Tcl recorder starts at 02/13/16 07:08:39 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\" -sim Jukebox  -def _PLSI_ _LATTICE_  -err automake.err "] {
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
-cfg plsi.fdk \"jukebox.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 02/13/16 07:08:39 ###########


########## Tcl recorder starts at 02/13/16 07:09:51 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 07:09:51 ###########


########## Tcl recorder starts at 02/13/16 07:15:49 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 07:15:49 ###########


########## Tcl recorder starts at 02/13/16 07:16:03 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 07:16:03 ###########


########## Tcl recorder starts at 02/13/16 07:16:10 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\" -sim Jukebox  -def _PLSI_ _LATTICE_  -err automake.err "] {
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
-cfg plsi.fdk \"jukebox.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 02/13/16 07:16:10 ###########


########## Tcl recorder starts at 02/13/16 07:21:30 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 07:21:30 ###########


########## Tcl recorder starts at 02/13/16 07:24:03 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 07:24:03 ###########


########## Tcl recorder starts at 02/13/16 07:27:56 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 07:27:56 ###########


########## Tcl recorder starts at 02/13/16 07:28:04 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 07:28:04 ###########


########## Tcl recorder starts at 02/13/16 15:10:32 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 15:10:32 ###########


########## Tcl recorder starts at 02/13/16 15:10:34 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 15:10:34 ###########


########## Tcl recorder starts at 02/13/16 15:10:43 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\" -sim Jukebox  -def _PLSI_ _LATTICE_  -err automake.err "] {
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
-cfg plsi.fdk \"jukebox.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 02/13/16 15:10:43 ###########


########## Tcl recorder starts at 02/13/16 15:26:03 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 15:26:03 ###########


########## Tcl recorder starts at 02/13/16 15:26:11 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 15:26:11 ###########


########## Tcl recorder starts at 02/13/16 15:29:53 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 15:29:53 ###########


########## Tcl recorder starts at 02/13/16 15:30:52 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 15:30:52 ###########


########## Tcl recorder starts at 02/13/16 15:31:01 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/13/16 15:31:01 ###########


########## Tcl recorder starts at 02/13/16 21:04:35 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\" -sim Jukebox  -def _PLSI_ _LATTICE_  -err automake.err "] {
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
-cfg plsi.fdk \"jukebox.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 02/13/16 21:04:35 ###########


########## Tcl recorder starts at 02/17/16 01:31:42 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 01:31:42 ###########


########## Tcl recorder starts at 02/17/16 01:37:02 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 01:37:02 ###########


########## Tcl recorder starts at 02/17/16 01:41:19 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 01:41:19 ###########


########## Tcl recorder starts at 02/17/16 01:41:26 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 01:41:26 ###########


########## Tcl recorder starts at 02/17/16 01:41:59 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 01:41:59 ###########


########## Tcl recorder starts at 02/17/16 01:42:02 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 01:42:02 ###########


########## Tcl recorder starts at 02/17/16 01:42:35 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 01:42:35 ###########


########## Tcl recorder starts at 02/17/16 01:42:37 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 01:42:37 ###########


########## Tcl recorder starts at 02/17/16 01:43:34 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 01:43:34 ###########


########## Tcl recorder starts at 02/17/16 01:43:37 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 01:43:37 ###########


########## Tcl recorder starts at 02/17/16 01:44:26 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 01:44:26 ###########


########## Tcl recorder starts at 02/17/16 01:44:30 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 01:44:30 ###########


########## Tcl recorder starts at 02/17/16 01:44:53 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\" -sim Jukebox  -def _PLSI_ _LATTICE_  -err automake.err "] {
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
-cfg plsi.fdk \"jukebox.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 02/17/16 01:44:53 ###########


########## Tcl recorder starts at 02/17/16 10:43:57 ##########

# Commands to make the Process: 
# Timing Simulation
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
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
-cfg plsi.fdk \"jukebox.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 02/17/16 10:43:57 ###########


########## Tcl recorder starts at 02/17/16 10:44:40 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 10:44:40 ###########


########## Tcl recorder starts at 02/17/16 10:44:45 ##########

# Commands to make the Process: 
# Timing Simulation
# - none -
# Application to view the Process: 
# Timing Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.post1 -ini simcpls.ini -all simcp.post1
-cfg plsi.fdk \"jukebox.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 02/17/16 10:44:45 ###########


########## Tcl recorder starts at 02/17/16 10:48:40 ##########

# Commands to make the Process: 
# Timing Simulation
# - none -
# Application to view the Process: 
# Timing Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.post1 -ini simcpls.ini -all simcp.post1
-cfg plsi.fdk \"jukebox.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 02/17/16 10:48:41 ###########


########## Tcl recorder starts at 02/17/16 10:55:27 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 10:55:27 ###########


########## Tcl recorder starts at 02/17/16 10:55:44 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 10:55:44 ###########


########## Tcl recorder starts at 02/17/16 10:56:38 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 10:56:38 ###########


########## Tcl recorder starts at 02/17/16 10:56:41 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 10:56:42 ###########


########## Tcl recorder starts at 02/17/16 11:06:19 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 11:06:19 ###########


########## Tcl recorder starts at 02/17/16 11:06:23 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 11:06:23 ###########


########## Tcl recorder starts at 02/17/16 11:13:01 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 11:13:01 ###########


########## Tcl recorder starts at 02/17/16 11:13:04 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 11:13:04 ###########


########## Tcl recorder starts at 02/17/16 11:13:40 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 11:13:40 ###########


########## Tcl recorder starts at 02/17/16 11:13:43 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 11:13:43 ###########


########## Tcl recorder starts at 02/17/16 11:14:10 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 11:14:10 ###########


########## Tcl recorder starts at 02/17/16 11:14:13 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 11:14:14 ###########


########## Tcl recorder starts at 02/17/16 11:21:02 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 11:21:02 ###########


########## Tcl recorder starts at 02/17/16 11:21:05 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 11:21:05 ###########


########## Tcl recorder starts at 02/17/16 11:21:13 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\" -sim Jukebox  -def _PLSI_ _LATTICE_  -err automake.err "] {
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
-cfg plsi.fdk \"jukebox.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 02/17/16 11:21:13 ###########


########## Tcl recorder starts at 02/17/16 11:23:11 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 11:23:11 ###########


########## Tcl recorder starts at 02/17/16 11:23:32 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 11:23:32 ###########


########## Tcl recorder starts at 02/17/16 11:23:41 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\" -sim Jukebox  -def _PLSI_ _LATTICE_  -err automake.err "] {
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
-cfg plsi.fdk \"jukebox.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 02/17/16 11:23:41 ###########


########## Tcl recorder starts at 02/17/16 11:31:39 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 11:31:39 ###########


########## Tcl recorder starts at 02/17/16 11:31:43 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 11:31:43 ###########


########## Tcl recorder starts at 02/17/16 11:31:52 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\" -sim Jukebox  -def _PLSI_ _LATTICE_  -err automake.err "] {
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
-cfg plsi.fdk \"jukebox.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 02/17/16 11:31:52 ###########


########## Tcl recorder starts at 02/17/16 11:35:27 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 11:35:27 ###########


########## Tcl recorder starts at 02/17/16 11:39:44 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 11:39:44 ###########


########## Tcl recorder starts at 02/17/16 11:39:57 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\" -sim Jukebox  -def _PLSI_ _LATTICE_  -err automake.err "] {
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
-cfg plsi.fdk \"jukebox.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 02/17/16 11:39:57 ###########


########## Tcl recorder starts at 02/17/16 11:46:04 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 11:46:04 ###########


########## Tcl recorder starts at 02/17/16 13:58:02 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 13:58:02 ###########


########## Tcl recorder starts at 02/17/16 13:58:06 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 13:58:06 ###########


########## Tcl recorder starts at 02/17/16 13:58:23 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 13:58:23 ###########


########## Tcl recorder starts at 02/17/16 13:58:26 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 13:58:26 ###########


########## Tcl recorder starts at 02/17/16 13:58:36 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\" -sim Jukebox  -def _PLSI_ _LATTICE_  -err automake.err "] {
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
-cfg plsi.fdk \"jukebox.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 02/17/16 13:58:36 ###########


########## Tcl recorder starts at 02/17/16 14:04:02 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 14:04:02 ###########


########## Tcl recorder starts at 02/17/16 14:04:05 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -vec -ovec \"jukebox.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open copytmv.bat w} rspFile] {
	puts stderr "Cannot create response file copytmv.bat: $rspFile"
} else {
	puts $rspFile "Copy jukebox.tmv jukebox.dtv
if \"jukebox.tmv\"==\"jukebox.tmv\" goto end
Copy jukebox.tmv jukebox.tmv
:end
"
	close $rspFile
}
if [runCmd "\"copytmv\""] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete copytmv.bat
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -mod Jukebox -ojhd compile -prj jukebox -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"jukebox.bl2\" -omod Jukebox -propadd -family PLSI -ues jukebox.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" jukebox.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i jukebox.bl3 -o jukebox.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.tt2 -if pla -p ispLSI1016-110LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj jukebox -log jukebox.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i jukebox.laf -if laf -p ispLSI1016-110LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj jukebox -if jukebox.jed -j2s -log jukebox.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 14:04:05 ###########


########## Tcl recorder starts at 02/17/16 14:57:56 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"jukebox.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 02/17/16 14:57:56 ###########

