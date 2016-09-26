
########## Tcl recorder starts at 04/28/16 12:50:52 ##########

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
if [runCmd "\"$cpld_bin/ahdl2blf\" \"pldzero.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"pldzero.bl2\" -omod Jukebox -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" pldzero.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" pldzero.bl3 -pla -o pldzero.tt2 -dev p16v8 -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" pldzero.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 12:50:52 ###########


########## Tcl recorder starts at 04/28/16 12:51:05 ##########

# Commands to make the Process: 
# JEDEC File
if [runCmd "\"$cpld_bin/fuseasm\" pldzero.tt3 -dev p16v8 -o pldzero.jed -ivec NoInput.tmv -rep pldzero.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 12:51:06 ###########


########## Tcl recorder starts at 04/28/16 16:52:09 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"pldzero.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"pldzero.bl2\" -omod Jukebox -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" pldzero.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" pldzero.bl3 -pla -o pldzero.tt2 -dev p16v8 -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" pldzero.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 16:52:09 ###########


########## Tcl recorder starts at 04/28/16 17:06:51 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"pldzero.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"pldzero.bl2\" -omod Jukebox -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" pldzero.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" pldzero.bl3 -pla -o pldzero.tt2 -dev p16v8 -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" pldzero.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 17:06:51 ###########


########## Tcl recorder starts at 04/28/16 17:07:21 ##########

# Commands to make the Process: 
# JEDEC File
if [runCmd "\"$cpld_bin/fuseasm\" pldzero.tt3 -dev p16v8 -o pldzero.jed -ivec NoInput.tmv -rep pldzero.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 17:07:21 ###########


########## Tcl recorder starts at 04/28/16 17:10:44 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"pldzero.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 17:10:44 ###########


########## Tcl recorder starts at 04/28/16 17:10:44 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"pldzero.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"pldzero.bl2\" -omod Jukebox -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" pldzero.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" pldzero.bl3 -pla -o pldzero.tt2 -dev p16v8 -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" pldzero.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 17:10:44 ###########


########## Tcl recorder starts at 04/28/16 17:10:48 ##########

# Commands to make the Process: 
# JEDEC File
if [runCmd "\"$cpld_bin/fuseasm\" pldzero.tt3 -dev p16v8 -o pldzero.jed -ivec NoInput.tmv -rep pldzero.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 17:10:48 ###########


########## Tcl recorder starts at 04/28/16 17:18:22 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"pldzero.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 17:18:22 ###########


########## Tcl recorder starts at 04/28/16 17:19:29 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"pldzero.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 17:19:29 ###########


########## Tcl recorder starts at 04/28/16 17:19:37 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"pldzero.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"pldzero.bl2\" -omod Jukebox -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" pldzero.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" pldzero.bl3 -pla -o pldzero.tt2 -dev p16v8 -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" pldzero.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 17:19:37 ###########


########## Tcl recorder starts at 04/28/16 17:19:52 ##########

# Commands to make the Process: 
# Simulate JEDEC File
if [runCmd "\"$cpld_bin/ahdl2blf\" \"pldzero.abl\" -vec -ovec \"pldzero.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" pldzero.tt3 -dev p16v8 -o pldzero.jed -ivec pldzero.tmv -rep pldzero.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/jedsim\" PLDzero.jed -o pldzero.smj -ostatus pldzero.sts -tra table detail -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 17:19:52 ###########


########## Tcl recorder starts at 04/28/16 17:19:59 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"pldzero.abl\" -vec -ovec \"pldzero.tmv\" -sim PLDzero  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" \"Jukebox.bl0\" -o \"Jukebox.lsi\" -template \"$install_dir/ispcpld/plsi/latsim/plsi.tft\" -testfix -bus rebuild -prj pldzero -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" Jukebox.bl0 -o Jukebox.btp -template \"$install_dir/ispcpld/pld/j2mod.tft\" -testfix -bus rebuild -prj pldzero -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pldzero.psl w} rspFile] {
	puts stderr "Cannot create response file pldzero.psl: $rspFile"
} else {
	puts $rspFile "-dev p16v8 -part LAT GAL16V8D-25LP GAL -o pldzero.tim
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/timsel\" @pldzero.psl"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pldzero.psl
if [catch {open pldzero._sp w} rspFile] {
	puts stderr "Cannot create response file pldzero._sp: $rspFile"
} else {
	puts $rspFile "#insert -- NOTE: Do not edit this file.
#insert -- Auto generated by Post-Route Verilog Simulation Models
#insert --
#unixpath
#unixpath $install_dir/ispcpld/pld/verilog
#libfile pldlib.v
#unixpath
#vlog \"$proj_dir/pldzero.vt\"
#insert -- End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"pldzero._sp\" \"pldzero.vtl\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pldzero._sp
if [catch {open pldzero._sp w} rspFile] {
	puts stderr "Cannot create response file pldzero._sp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by Post-Route Verilog Simulation Models
#insert #
#unixpath
#unixpath $install_dir/ispcpld/pld/verilog
#libfile pldlib.v
#unixpath
#vlog \"$proj_dir/pldzero.vt\"
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"pldzero._sp\" \"pldzero.vatl\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pldzero._sp
if [runCmd "\"$cpld_bin/j2sim\" pldzero.jed -dly custom pldzero.tim -pldbus default Jukebox.btp -o pldzero.sim -module Jukebox -suppress -err automake.err"] {
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
-cfg oaipldtg.fdk \"pldzero.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 04/28/16 17:20:00 ###########


########## Tcl recorder starts at 04/28/16 17:20:22 ##########

# Commands to make the Process: 
# JEDEC File
if [runCmd "\"$cpld_bin/ahdl2blf\" \"pldzero.abl\" -vec -ovec \"pldzero.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/ahdl2blf\" \"pldzero.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"pldzero.bl2\" -omod Jukebox -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" pldzero.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" pldzero.bl3 -pla -o pldzero.tt2 -dev p16v8 -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" pldzero.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" pldzero.tt3 -dev p16v8 -o pldzero.jed -ivec pldzero.tmv -rep pldzero.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 17:20:22 ###########


########## Tcl recorder starts at 04/28/16 17:20:30 ##########

# Commands to make the Process: 
# JEDEC File
if [runCmd "\"$cpld_bin/ahdl2blf\" \"pldzero.abl\" -vec -ovec \"pldzero.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/ahdl2blf\" \"pldzero.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"pldzero.bl2\" -omod Jukebox -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" pldzero.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" pldzero.bl3 -pla -o pldzero.tt2 -dev p16v8 -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" pldzero.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" pldzero.tt3 -dev p16v8 -o pldzero.jed -ivec pldzero.tmv -rep pldzero.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 17:20:30 ###########


########## Tcl recorder starts at 04/28/16 17:23:48 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/blif2eqn\" \"Jukebox.bl0\" -o \"Jukebox.lsi\" -template \"$install_dir/ispcpld/plsi/latsim/plsi.tft\" -testfix -bus rebuild -prj pldzero -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" Jukebox.bl0 -o Jukebox.btp -template \"$install_dir/ispcpld/pld/j2mod.tft\" -testfix -bus rebuild -prj pldzero -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/j2sim\" pldzero.jed -dly custom pldzero.tim -pldbus default Jukebox.btp -o pldzero.sim -module Jukebox -suppress -err automake.err"] {
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
-cfg oaipldtg.fdk \"pldzero.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 04/28/16 17:23:48 ###########


########## Tcl recorder starts at 04/28/16 17:26:31 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"pldzero.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 17:26:32 ###########


########## Tcl recorder starts at 04/28/16 17:26:43 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"pldzero.abl\" -ojhd only -def _PLSI_ _LATTICE_ -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 17:26:43 ###########


########## Tcl recorder starts at 04/28/16 17:27:02 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"pldzero.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"pldzero.bl2\" -omod Jukebox -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" pldzero.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" pldzero.bl3 -pla -o pldzero.tt2 -dev p16v8 -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" pldzero.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 17:27:02 ###########


########## Tcl recorder starts at 04/28/16 17:27:07 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/ahdl2blf\" \"pldzero.abl\" -vec -ovec \"pldzero.tmv\" -sim PLDzero  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" \"Jukebox.bl0\" -o \"Jukebox.lsi\" -template \"$install_dir/ispcpld/plsi/latsim/plsi.tft\" -testfix -bus rebuild -prj pldzero -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" Jukebox.bl0 -o Jukebox.btp -template \"$install_dir/ispcpld/pld/j2mod.tft\" -testfix -bus rebuild -prj pldzero -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/ahdl2blf\" \"pldzero.abl\" -vec -ovec \"pldzero.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" pldzero.tt3 -dev p16v8 -o pldzero.jed -ivec pldzero.tmv -rep pldzero.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [catch {open pldzero.psl w} rspFile] {
	puts stderr "Cannot create response file pldzero.psl: $rspFile"
} else {
	puts $rspFile "-dev p16v8 -part LAT GAL16V8D-25LP GAL -o pldzero.tim
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/timsel\" @pldzero.psl"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pldzero.psl
if [catch {open pldzero._sp w} rspFile] {
	puts stderr "Cannot create response file pldzero._sp: $rspFile"
} else {
	puts $rspFile "#insert -- NOTE: Do not edit this file.
#insert -- Auto generated by Post-Route Verilog Simulation Models
#insert --
#unixpath
#unixpath $install_dir/ispcpld/pld/verilog
#libfile pldlib.v
#unixpath
#vlog \"$proj_dir/pldzero.vt\"
#insert -- End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"pldzero._sp\" \"pldzero.vtl\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pldzero._sp
if [catch {open pldzero._sp w} rspFile] {
	puts stderr "Cannot create response file pldzero._sp: $rspFile"
} else {
	puts $rspFile "#simulator Aldec
#insert # NOTE: Do not edit this file.
#insert # Auto generated by Post-Route Verilog Simulation Models
#insert #
#unixpath
#unixpath $install_dir/ispcpld/pld/verilog
#libfile pldlib.v
#unixpath
#vlog \"$proj_dir/pldzero.vt\"
#insert # End
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/chipsim\" \"pldzero._sp\" \"pldzero.vatl\" none"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
file delete pldzero._sp
if [runCmd "\"$cpld_bin/j2sim\" pldzero.jed -dly custom pldzero.tim -pldbus default Jukebox.btp -o pldzero.sim -module Jukebox -suppress -err automake.err"] {
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
-cfg oaipldtg.fdk \"pldzero.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 04/28/16 17:27:07 ###########


########## Tcl recorder starts at 04/28/16 17:35:34 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"pldzero.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"pldzero.bl2\" -omod Jukebox -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" pldzero.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" pldzero.bl3 -pla -o pldzero.tt2 -dev p16v8 -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" pldzero.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 17:35:34 ###########


########## Tcl recorder starts at 04/28/16 17:36:03 ##########

# Commands to make the Process: 
# JEDEC File
if [runCmd "\"$cpld_bin/fuseasm\" pldzero.tt3 -dev p16v8 -o pldzero.jed -ivec pldzero.tmv -rep pldzero.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 17:36:03 ###########


########## Tcl recorder starts at 04/28/16 17:37:16 ##########

# Commands to make the Process: 
# Timing Simulation
if [runCmd "\"$cpld_bin/blif2eqn\" \"Jukebox.bl0\" -o \"Jukebox.lsi\" -template \"$install_dir/ispcpld/plsi/latsim/plsi.tft\" -testfix -bus rebuild -prj pldzero -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/blif2eqn\" Jukebox.bl0 -o Jukebox.btp -template \"$install_dir/ispcpld/pld/j2mod.tft\" -testfix -bus rebuild -prj pldzero -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/j2sim\" pldzero.jed -dly custom pldzero.tim -pldbus default Jukebox.btp -o pldzero.sim -module Jukebox -suppress -err automake.err"] {
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
-cfg oaipldtg.fdk \"pldzero.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 04/28/16 17:37:16 ###########


########## Tcl recorder starts at 04/28/16 17:38:22 ##########

# Commands to make the Process: 
# Timing Simulation
# - none -
# Application to view the Process: 
# Timing Simulation
if [catch {open simcp._sp w} rspFile] {
	puts stderr "Cannot create response file simcp._sp: $rspFile"
} else {
	puts $rspFile "simcp.post1 -ini simcpls.ini -all simcp.post1
-cfg oaipldtg.fdk \"pldzero.lts\" -map \"Jukebox.lsi\"
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

########## Tcl recorder end at 04/28/16 17:38:22 ###########


########## Tcl recorder starts at 04/28/16 17:38:30 ##########

# Commands to make the Process: 
# JEDEC Simulation Waveform
if [runCmd "\"$cpld_bin/jedsim\" PLDzero.jed -o pldzero.smj -ostatus pldzero.sts -tra table detail -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
# Application to view the Process: 
# JEDEC Simulation Waveform
if [runCmd "\"$cpld_bin/waves\" -hst jedec.hst"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 17:38:30 ###########


########## Tcl recorder starts at 04/28/16 17:39:23 ##########

# Commands to make the Process: 
# JEDEC File
if [runCmd "\"$cpld_bin/ahdl2blf\" \"pldzero.abl\" -vec -ovec \"pldzero.tmv\"  -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/ahdl2blf\" \"pldzero.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"pldzero.bl2\" -omod Jukebox -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" pldzero.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" pldzero.bl3 -pla -o pldzero.tt2 -dev p16v8 -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" pldzero.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fuseasm\" pldzero.tt3 -dev p16v8 -o pldzero.jed -ivec pldzero.tmv -rep pldzero.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 17:39:23 ###########


########## Tcl recorder starts at 05/20/16 05:29:46 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"pldzero.abl\" -mod Jukebox -ojhd compile -def _PLSI_ _LATTICE_  -err automake.err "] {
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
if [runCmd "\"$cpld_bin/iblflink\" \"Jukebox.bl1\" -o \"pldzero.bl2\" -omod Jukebox -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" pldzero.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" pldzero.bl3 -pla -o pldzero.tt2 -dev p16v8 -define N -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/fit\" pldzero.tt2 -dev p16v8 -str -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/20/16 05:29:46 ###########


########## Tcl recorder starts at 05/20/16 05:29:54 ##########

# Commands to make the Process: 
# JEDEC File
if [runCmd "\"$cpld_bin/fuseasm\" pldzero.tt3 -dev p16v8 -o pldzero.jed -ivec pldzero.tmv -rep pldzero.rpt -doc brief -con ptblown -for brief -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/20/16 05:29:54 ###########

