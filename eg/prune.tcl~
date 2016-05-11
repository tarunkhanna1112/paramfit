set natoms [lindex $::argv 0]
set nframes [lindex $::argv 1]

set srf [lindex $::argv 2]
set erf [lindex $::argv 3]

set f [open "coord.mdcrd" "r"]
set data [read $f]
close $f

set g [open "quantum_A.dat" "r"]
set data1 [read $g]
close $g

set f1 [open "pcoord.mdcrd" "w"]
puts $f1 "MOL"

set g1 [open "pquantum_A.dat" "w"]

set k 1

while { $k < [llength $data] } {	
	set x [lindex $data $k]
	set y [lindex $data [expr { $k + 1 }]]
	set z [lindex $data [expr { $k + 2 }]]

	set pos [expr { $k / 105 }]
	set pos [expr { $pos + 1 }]

	if { $pos >= $srf && $pos <= $erf } {
	} else { 
		puts $f1 "	$x $y $z"
	}
	incr k 3
}
close $f1

set k 0

while { $k < [llength $data1] } {
	set pos [expr { $k + 1 }]
	if { $pos >= $srf && $pos <= $erf } {
	} else {
		puts $g1 "[lindex $data1 $k]"
	}
	incr k
}

close $g1
