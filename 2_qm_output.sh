for ((i=0;i<119;i++)); do
  echo $i
  grep "SCF Done" "Job.${i}.log" | awk '{print $5}' >> quantum_A.dat
	# i=$(($i+1));
done

