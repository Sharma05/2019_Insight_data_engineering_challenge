
# Insight_data_engineering_challenge_2019




Summary:

The pharmacy_counting.m script reads the text file from the input folder. The data structure is organised and tabulated. The first new column is the drug names, which is then sorted in an ascending order to effectively index the unique doctor names for each prescribed drug name. This approach is avoids counting the doctor name prescribing the same drug twice or more. The total cost for the drugs, unique drug names and number of prescribers are then tabulated, and the output is recorded as sample_output_pharm.txt

Instructions:

Used Matlab 2018b

The main code is excuted from the main directory.

The following can be executed from the terminal directly.

matlab -nodisplay -nosplash -nodesktop -r "try, run('./src/pharmacy_counting.m'), catch, exit, end, exit"

#test

#matlab -nodisplay -nosplash -nodesktop -r "try, run('./insight_test_priya/temp/src/pharmacy_counting.m'), catch, exit, end, exit"
