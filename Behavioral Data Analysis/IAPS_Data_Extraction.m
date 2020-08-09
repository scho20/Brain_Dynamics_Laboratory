%% IAPS DATA Extraction
% January 23, 2020 | SungJun Cho
% If you have a problem or question regarding this code, please email me at
% scho20@uchicago.edu

% PURPOSE: The code below aims to extract the necessary data (.xlsx) from the raw
% data file (.csv) for the pregnenolone study.

% IMPORTANT: The codes and data files should be located in 'Desktop' file
% unless you specify the alternative path.

% 1. Specify the file
fprintf('Note: Make sure the raw file is in your folder. \n')
cur_folder = pwd; % current folder path
display(['Your current folder location is: ', cur_folder])
file_name_raw = input('What is the name of the file you want to use as an input (e.g. 822v1_EPRIME_raw.csv)?  ', 's');
file_name_new = input('What is the name of the resulting file you want use (e.g. IAPS_822.xlsx)?  ', 's');

% 2. Extract Raw Data
raw_data = readtable(file_name_raw);
%raw_data.Properties.VariableNames{35} = 'running_trial';

frame = raw_data.Frame2; % name of image
label = raw_data.Lable; % type of image
session = raw_data.Session; % session number
running_trial = raw_data.Running_Trial_; % running trial cateogory
response = raw_data.Slide6_RESP; % response from the subject patient
reaction_time = raw_data.Slide6_RT; % reaction time

% 3. Wrting Excel as an output
sheet = 1;
header = {'Frame', 'Label', 'Session', 'Running_Trial', 'Response', 'Reaction_Time'};

xlswrite(file_name_new, header, sheet);
xlswrite(file_name_new, frame, sheet, 'A2');
xlswrite(file_name_new, label, sheet, 'B2');
xlswrite(file_name_new, session, sheet, 'C2');
xlswrite(file_name_new, running_trial, sheet, 'D2');
xlswrite(file_name_new, response, sheet, 'E2');
xlswrite(file_name_new, reaction_time, sheet, 'F2');
