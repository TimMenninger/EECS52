
########## Tcl recorder starts at 04/28/16 12:50:21 ##########

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
if [runCmd "\"$cpld_bin/ahdl2blf\" \"cpldzero.abl\" -mod CPLDzero -ojhd compile -prj cpldzero -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"CPLDzero.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"CPLDzero.bl1\" -o \"cpldzero.bl2\" -omod CPLDzero -propadd -family PLSI -ues cpldzero.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" cpldzero.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i cpldzero.bl3 -o cpldzero.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i cpldzero.tt2 -if pla -p ispLSI1016EA-125LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj cpldzero -log cpldzero.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i cpldzero.laf -if laf -p ispLSI1016EA-125LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj cpldzero -if cpldzero.jed -j2s -log cpldzero.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 12:50:21 ###########


########## Tcl recorder starts at 04/28/16 13:32:32 ##########

# Commands to make the Process: 
# Pre-Fit Equations
if [runCmd "\"$cpld_bin/blif2eqn\" cpldzero.tt2 -o cpldzero.eq3 -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 13:32:32 ###########


########## Tcl recorder starts at 04/28/16 13:32:41 ##########

# Commands to make the Process: 
# Constraint Editor
# - none -
# Application to view the Process: 
# Constraint Editor
if [catch {open ce.rsp w} rspFile] {
	puts stderr "Cannot create response file ce.rsp: $rspFile"
} else {
	puts $rspFile "-devfile \"$install_dir/ispcpld/data/lc1k/lea1016_44j.dev\"
-lci cpldzero.lct
-touch cpldzero.irs
-src cpldzero.tt2
-type PLA
"
	close $rspFile
}
if [runCmd "\"$cpld_bin/lciedit\" @ce.rsp"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 13:32:41 ###########


########## Tcl recorder starts at 04/28/16 13:32:57 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"cpldzero.abl\" -mod CPLDzero -ojhd compile -prj cpldzero -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"CPLDzero.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"CPLDzero.bl1\" -o \"cpldzero.bl2\" -omod CPLDzero -propadd -family PLSI -ues cpldzero.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" cpldzero.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i cpldzero.bl3 -o cpldzero.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i cpldzero.tt2 -if pla -p ispLSI1016EA-125LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj cpldzero -log cpldzero.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i cpldzero.laf -if laf -p ispLSI1016EA-125LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj cpldzero -if cpldzero.jed -j2s -log cpldzero.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 13:32:57 ###########


########## Tcl recorder starts at 04/28/16 13:34:47 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"cpldzero.abl\" -mod CPLDzero -ojhd compile -prj cpldzero -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"CPLDzero.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"CPLDzero.bl1\" -o \"cpldzero.bl2\" -omod CPLDzero -propadd -family PLSI -ues cpldzero.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" cpldzero.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i cpldzero.bl3 -o cpldzero.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i cpldzero.tt2 -if pla -p ispLSI1016E-125LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj cpldzero -log cpldzero.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i cpldzero.laf -if laf -p ispLSI1016E-125LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj cpldzero -if cpldzero.jed -j2s -log cpldzero.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 13:34:47 ###########


########## Tcl recorder starts at 04/28/16 13:36:19 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"cpldzero.abl\" -mod CPLDzero -ojhd compile -prj cpldzero -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"CPLDzero.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"CPLDzero.bl1\" -o \"cpldzero.bl2\" -omod CPLDzero -propadd -family PLSI -ues cpldzero.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" cpldzero.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i cpldzero.bl3 -o cpldzero.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i cpldzero.tt2 -if pla -p ispLSI1016EA-125LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj cpldzero -log cpldzero.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i cpldzero.laf -if laf -p ispLSI1016EA-125LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj cpldzero -if cpldzero.jed -j2s -log cpldzero.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 13:36:19 ###########


########## Tcl recorder starts at 04/28/16 13:59:43 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"cpldzero.abl\" -mod CPLDzero -ojhd compile -prj cpldzero -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"CPLDzero.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"CPLDzero.bl1\" -o \"cpldzero.bl2\" -omod CPLDzero -propadd -family PLSI -ues cpldzero.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" cpldzero.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i cpldzero.bl3 -o cpldzero.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i cpldzero.tt2 -if pla -p ispLSI1016-80LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj cpldzero -log cpldzero.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i cpldzero.laf -if laf -p ispLSI1016-80LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj cpldzero -if cpldzero.jed -j2s -log cpldzero.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 13:59:43 ###########


########## Tcl recorder starts at 04/28/16 16:51:16 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"cpldzero.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 16:51:16 ###########


########## Tcl recorder starts at 04/28/16 16:51:17 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"cpldzero.abl\" -mod CPLDzero -ojhd compile -prj cpldzero -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"CPLDzero.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"CPLDzero.bl1\" -o \"cpldzero.bl2\" -omod CPLDzero -propadd -family PLSI -ues cpldzero.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" cpldzero.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i cpldzero.bl3 -o cpldzero.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i cpldzero.tt2 -if pla -p ispLSI1016-80LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj cpldzero -log cpldzero.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i cpldzero.laf -if laf -p ispLSI1016-80LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj cpldzero -if cpldzero.jed -j2s -log cpldzero.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 16:51:17 ###########


########## Tcl recorder starts at 04/28/16 16:51:43 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"cpldzero.abl\" -mod CPLDzero -ojhd compile -prj cpldzero -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"CPLDzero.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"CPLDzero.bl1\" -o \"cpldzero.bl2\" -omod CPLDzero -propadd -family PLSI -ues cpldzero.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" cpldzero.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i cpldzero.bl3 -o cpldzero.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i cpldzero.tt2 -if pla -p ispLSI1016EA-125LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj cpldzero -log cpldzero.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i cpldzero.laf -if laf -p ispLSI1016EA-125LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj cpldzero -if cpldzero.jed -j2s -log cpldzero.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 16:51:43 ###########


########## Tcl recorder starts at 04/28/16 17:28:22 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"cpldzero.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 17:28:22 ###########


########## Tcl recorder starts at 04/28/16 17:28:26 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"cpldzero.abl\" -mod CPLDzero -ojhd compile -prj cpldzero -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"CPLDzero.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"CPLDzero.bl1\" -o \"cpldzero.bl2\" -omod CPLDzero -propadd -family PLSI -ues cpldzero.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" cpldzero.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i cpldzero.bl3 -o cpldzero.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i cpldzero.tt2 -if pla -p ispLSI1016EA-125LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj cpldzero -log cpldzero.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i cpldzero.laf -if laf -p ispLSI1016EA-125LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj cpldzero -if cpldzero.jed -j2s -log cpldzero.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 04/28/16 17:28:26 ###########


########## Tcl recorder starts at 05/08/16 20:58:43 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"cpldzero.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/08/16 20:58:43 ###########


########## Tcl recorder starts at 05/08/16 20:59:41 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"cpldzero.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/08/16 20:59:41 ###########


########## Tcl recorder starts at 05/08/16 21:00:05 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"cpldzero.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/08/16 21:00:05 ###########


########## Tcl recorder starts at 05/08/16 21:00:59 ##########

# Commands to make the Process: 
# Hierarchy
if [runCmd "\"$cpld_bin/ahdl2blf\" \"cpldzero.abl\" -ojhd only -def _PLSI_ _LATTICE_  -err automake.err"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/08/16 21:00:59 ###########


########## Tcl recorder starts at 05/08/16 21:01:02 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"cpldzero.abl\" -mod CPLDzero -ojhd compile -prj cpldzero -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"CPLDzero.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"CPLDzero.bl1\" -o \"cpldzero.bl2\" -omod CPLDzero -propadd -family PLSI -ues cpldzero.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" cpldzero.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i cpldzero.bl3 -o cpldzero.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i cpldzero.tt2 -if pla -p ispLSI1016EA-125LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj cpldzero -log cpldzero.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i cpldzero.laf -if laf -p ispLSI1016EA-125LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj cpldzero -if cpldzero.jed -j2s -log cpldzero.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/08/16 21:01:02 ###########


########## Tcl recorder starts at 05/20/16 05:28:21 ##########

# Commands to make the Process: 
# Fit Design
if [runCmd "\"$cpld_bin/ahdl2blf\" \"cpldzero.abl\" -mod CPLDzero -ojhd compile -prj cpldzero -def _PLSI_ _LATTICE_  -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" \"CPLDzero.bl0\" -red bypin choose -collapse -pterms 8 -family -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblflink\" \"CPLDzero.bl1\" -o \"cpldzero.bl2\" -omod CPLDzero -propadd -family PLSI -ues cpldzero.ues -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/iblifopt\" cpldzero.bl2 -red bypin choose -sweep -collapse all -pterms 8 -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/idiofft\" -i cpldzero.bl3 -o cpldzero.tt2 -propadd -idev PLSI -dev pla_basic -pla -err automake.err "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i cpldzero.tt2 -if pla -p ispLSI1016EA-125LJ44 -pre "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$install_dir/ispcomp/bin/impsrclever\" -prj cpldzero -log cpldzero.irs "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/syndpm\" -i cpldzero.laf -if laf -p ispLSI1016EA-125LJ44 -pd \"$proj_dir\"  -of vhdl -of verilog"] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}
if [runCmd "\"$cpld_bin/synsvf\" -exe \"$install_dir/ispvmsystem/ispufw\" -prj cpldzero -if cpldzero.jed -j2s -log cpldzero.svl "] {
	return
} else {
	vwait done
	if [checkResult $done] {
		return
	}
}

########## Tcl recorder end at 05/20/16 05:28:21 ###########

