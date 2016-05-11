#												::::: QUALITY OF INITIAL SAMPLE :::::

#exec paramfit -i job_scatterplots.in -p prmtop -c coord.mdcrd  -q quantum_A.dat > scatterplots.out

# 											:::::: FITTING ::::::

# look for the K value in the fit_K_A.out and replace that value of K in 4_job_fit.in 

puts "			::::: FITTING ::::::			"

exec paramfit -i 4_job_fit.in -p prmtop -c pcoord.mdcrd -q pquantum_A.dat  >  initial_fit.out

# 											:::::: PLOTING THE FIT ENERGY ::::::

puts " remove any confifuration which vary in energy a lot"

exec sh plot_energy.x fit_output_energy.dat

puts "IF THE CONFIGURATIONS ARE NOT VARYING A LOT THEN THE K VALUE IN initial_fit.out CAN BE TRUSTED WITH THE UNCERTAINITY GIVEN BY R2 VALUE OF THE FIT"

puts "IF LARGE VARIATION THEN LOOK INTO WEIGHTED AVERAGE"
