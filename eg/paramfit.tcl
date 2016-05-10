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

		exec tclsh sample_2.tcl $opt3

		puts ""
		puts "" 
		puts "				## coord.mdcrd AND quantum_A.dat ARE THE FILES GENERATED IN THIS STEP AND WILL BE USED IN LATTER STEPS"
	} else {
		exit
	}
}
	
