# Input file for parmfit

# 												::::: AMBER ::::::
puts "			::::: AMBER ::::::			"

# Leap

exec tleap -f leap.in

#exec sander -O -i min.in -o min.out -p prmtop -c inpcrd -r min.rst 
#exec sander -O -i coord.in -o coord.out -p prmtop -c min.rst -r coord.rst -x coord.mdcrd 



# 										  :::::: GAUSSIAN ::::::
puts "			::::: GAUSSIAN ::::::			"

# gaussian input files 

#exec paramfit -i 1_Job_Control.in -p prmtop -c coord.mdcrd -q quantum_A.dat > 1_Job_Control.out

# generating quantum output (standard)

#for {set i 0} {$i < 100} {incr i} {
	#puts "step [expr { $i + 1 }] of 200"
	#exec g09 Job.$i.com
#}

# changing the gaussian out to the one readable by parmfit

#exec sh 2_qm_output.sh



# 											:::::: FITTING ::::::
puts "			::::: FITTING ::::::			"

exec paramfit -i 3_fit_K_A.in -p prmtop -c pcoord.mdcrd -q pquantum_A.dat  >  3_fit_K_A.out
