puts ""
puts ""
puts "			******************************************************************"
puts "			THIS CODE AUTOMISES THE PARAMFIT FUNCTIONALITY OF AMBER MD PACKAGE"
puts "			******************************************************************"

puts ""
puts ""

puts "			WRITTEN BY : TARUN KHANNA"
puts "			IMPERIAL COLLEGE LONDON,U.K (2014-2017)"

puts ""

puts "			## THIS CODE GIVES TWO WAYS TO USE PARAMFIT ##"
puts ""
puts "		1. STARTING FROM AMBER CACCULATIONS THEN GAUSSIAN CALCULATIONS"
puts "		2. STARTING FROM GAUSSIAN CALCULATIONS TO AMBER CALCULATIONS"
puts ""
puts "				ENTER '1' OR '2' TO USE EITHER OF THE ABOVE ROUTES" 
set opt1 [gets stdin]

puts ""

if { $opt1 == 2 } {
	puts "				## MAKE SURE YOU HAVE RUN RIGID SCAN (IN GAUSSIAN) ABOUT THE DESIRED ATOM TYPES BEFORE RUNNING THIS CALCULATION"
	puts "		TYPE 'Y' IF THE LOG FILE FROM THE RIGID SCAN IS PRESENT IN THE FOLDER WHERE THIS SCRIPT IS EXECUTED"
	puts "		OR PRESS 'N' TO EXIT THE CALCULATION"
	set opt2 [gets stdin]

	if { $opt2 == "y" || $opt2 == "Y" } {
		puts "				## ENTER THE NAME OF THE GAUSSIAN LOG FILE"
		set opt3 [gets stdin]
		puts ""
		exec ls $opt3
		
		set f [open "$opt3" "r"]
		set data [read $f]
		close $f

		set k 0
		
		while { [lindex $data $k] != "Variables:" } {
			incr k
			if { $k > [llength $data] } {
				puts "				**** ERROR: CHECK THE RIGID SCAN CALCULATIONS ****"
				exit
			}
		}

		incr k 4
		set opt4 [lindex $data $k]

		puts "$opt4"

		exec tclsh sample_2.tcl $opt3 $opt4

		puts ""
		puts "" 
		puts "				## coord.mdcrd AND quantum_A.dat ARE THE FILES GENERATED IN THIS STEP AND WILL BE USED IN LATTER STEPS"
	} else {
		exit
	}
}

puts ""
puts ""

puts "				## DO YOU WANT TO PRUNE SOME OF THE FRAMES? Y/N"
set opt5 [gets stdin]

if { $opt5 == "y" || $opt5 == "Y" } {
	puts "				## ENTER THE PRMTOP FILE FOR THE MOLECULE"
	set opt6 [gets stdin]
	exec ls $opt6

	set f [open "$opt6" "r"]
	set data [read $f]
	close $f

	set k 0

	while { [lindex $data $k] != "POINTERS" && [lindex $data [expr { $k + 1 }]] != "%FORMAT(10I8)" } {
		incr k
	}

	set opt7 [lindex $data [expr { $k + 2 }]]

	puts ""
	puts "				## ENTER THE STARTING FRAME TO BE PRUNED"
	set opt8 [gets stdin]	
	puts ""

	puts "				## ENTER THE END FRAME TO BE PRUNED"
	set opt9 [gets stdin]
	puts ""
	
	exec tclsh prune.tcl $opt7 $opt6 $opt8 $opt9

	puts "				## pcoord.mdcrd AND pquantum_A.dat ARE THE FILES GENERATED IN THIS STEP AND WILL BE USED IN FUTHER STEPS"
	puts ""
	puts ""
	puts "				**** FOR REST OF THE STEPS OF PARAMFIT USE THE parmfit.tcl AND parmfit_2.tcl ALONG WITH THE .IN FILES DOWNLOADED FROM THE PARAMFIT TUTORIAL PAGE"
	puts "				     THIS SECTION IS NOT AUTOMATED AS REQUIRE MANUAL INTERVENTION AND INSERTION OF K PARAMETER FOR FITTING, REFER THE PARAMFIT TUTORIAL FOR THE" 
	puts "				     NEXT STEPS ****"
} else {
	puts ""
	puts ""
	puts "				**** FOR REST OF THE STEPS OF PARAMFIT USE THE parmfit.tcl AND parmfit_2.tcl ALONG WITH THE .IN FILES DOWNLOADED FROM THE PARAMFIT TUTORIAL PAGE"
	puts "				     THIS SECTION IS NOT AUTOMATED AS REQUIRE MANUAL INTERVENTION AND INSERTION OF K PARAMETER FOR FITTING, REFER THE PARAMFIT TUTORIAL FOR THE" 
	puts "				     NEXT STEPS ****"
}
 

	
		














	
