#!/bin/bash

# Run the code on the sample data
PATH="$PATH":"/Applications/MATLAB_R2018b.app/bin"
matlab  -nodisplay -nosplash -nodesktop -r "try, run('./src/pharmacy_counting.m'), catch, exit, end, exit"

# Test if the returned output is matches the sample output.

#matlab  -nodisplay -nosplash -nodesktop -r "try, run('./insight_test_priya/temp/src/pharmacy_counting.m'), catch, exit, end, exit"