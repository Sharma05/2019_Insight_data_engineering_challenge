clear all

% setting the input environment

cd ..
cd input

% reading the input text file that may have any filename
txtfile = dir('*.txt');
filename = txtfile.name;

% open file name to set the number of observations and lines
fileID = fopen(filename,'r');
C_all = textscan(fileID,'%s %s %s %s %s','Delimiter',',');
size_cell = size(C_all{1},1);
N = size_cell-1;
clear C_all
fclose(fileID);

% read the header and data 
fileID = fopen(filename,'r');
C_text = textscan(fileID,'%s %s %s %s %s', 1,'Delimiter',',');
C_data = textscan(fileID,'%n %s %s %s %n',N,'Delimiter',',');
fclose(fileID);

% retreiving and assigning drug cost and drug list to a handle
[drug_cost] = C_data{1,5};
[drug_list] = C_data{1,4};
doctor_names = strcat(C_data{1,2},C_data{1,3}); % joining the first and last name 

% making a new table 
mm = table(drug_list, doctor_names, drug_cost);

% sorting the column 1 (druglist) in table to easily find the number of 
% prescribers once only per drug
B = sortrows(mm,1,'ascend');

%retreiving and assigning drug cost and drug list to a handle from the new
%table
[drug_cost] = B{:,3};
[drug_list] = B{:,1};
doctor_names = B{:,2};

% finding the list of unique drugnames
[drug_names, first_pos, position] = unique(drug_list); 
        

% counting the number of prescribers 
 
 for i = 1:length(drug_names)
 location = find(position==i);
 doctor_names_at_location = (doctor_names(location));
 [doc_count, pos,poss] = unique(doctor_names_at_location);
 num_prescriber(i) = size(doc_count,1)';
 end
 num_prescriber = num_prescriber';
  
%calculating the the total cost associated with each drug type/name
for i = 1:length(drug_names) 
    total_cost(i) = nansum(drug_cost(position==i));
    
end
total_cost = total_cost';

% tabulating the information
mm = table(drug_names,num_prescriber, total_cost);

% sorting the table to set the drug cost in descending order
output_data = sortrows(mm,3,'descend');

% setting the output environment
cd ..
cd output

% saving in the .txt format
writetable(output_data,'sample_output_pharm.txt'); 
