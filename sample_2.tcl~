# THIS CODE STARTS FROM GAUSSIAN RIGID SCAN AND FORMS A MDCRD FILE AND A QUANTUM ENERGY FILE WHICH IS THEN SUBSEQUENTLY READ BY THE PARMFIT PROCEDURE TO CALCULATE THE MM PARAMETERS

set f [open "[lindex $::argv 0]" "r"]
set data [read $f]
close $f

set g [open "coord.mdcrd" "w"]

puts $g "MOL"

set h [open "quantum_A.dat" "w"]


set num_ori 200

set count 0

set k 0

set rem -1
set rem1 -1
set rem2 -1

while { $count != $num_ori } {
	if { [lindex $data $k] == "Standard" && [lindex $data [expr { $k + 1 }]] == "orientation:" } {
		incr count
	
		while { [lindex $data $k] != 1 } {
			incr k
		}
		if { $count != $rem && $count != $rem1 && $count != $rem2} {
			while { [lindex $data $k] != "---------------------------------------------------------------------"  } {
				puts $g "	[lindex $data [expr { $k + 3 }]]	[lindex $data [expr { $k + 4 }]]	[lindex $data [expr { $k + 5 }]]"
				incr k 6
			}

			while { [lindex $data $k] != "SCF" || [lindex $data [expr { $k + 1 }]] != "Done:" } {
				incr k
			}
			puts $h "[lindex $data [expr { $k + 4 }]]"
		} else { 
			incr rem 10
			incr rem1 10
			incr rem2 10
		}

		puts "				***** FRAME $count *****"
	}
	incr k
}
