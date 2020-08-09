%% Stroop DATA Extraction
% January 23, 2020 SungJun Cho
% If you have a problem or question regarding this code, please email me at
% scho20@uchicago.edu

% PURPOSE: The code below aims to extract the necessary data (.xlsx) from the raw
% data file (.csv) for the pregnenolone study.

% IMPORTANT: The codes and data files should be located in 'Desktop' file
% unless you specify the alternative path.

% 1. Specify the file
fprintf('Note: Make sure the raw file is in your folder. \n')
file_name_raw = input('What is the name of the file you want to use as an input (e.g. 822v2_EPRIME_raw.csv)?  ', 's');
file_name_new = input('What is the name of the resulting file you want use (e.g. Stroop_822.xlsx)?  ', 's');

% 2. Extract Raw Data
raw_data = readtable(file_name_raw);
%raw_data.Properties.VariableNames{35} = 'running_trial';

colors = raw_data.color_Trial_; % colors in the trial
running_trial = raw_data.Running_Trial_; % running trial cateogory
answer = raw_data.ShowStimuli1_CRESP; % right answer
response = raw_data.ShowStimuli1_RESP; % response of the subject patient
correctness = raw_data.ShowStimuli1_ACC; % comparison of answer and response
reaction_time = raw_data.ShowStimuli1_RT; % time from onset of stimuli to response
session = raw_data.Session; % number of the session

%3. Converting each array to same size
colors = colors(~cellfun(@isempty, colors));
running_trial = running_trial(~cellfun(@isempty, running_trial));

answer = double_organize(answer);
response = double_organize(response);
reaction_time = double_organize(reaction_time);

if isequal(length(answer), length(response), length(reaction_time),...
        length(colors), length(running_trial))
    difference = size(session,1) - size(answer,1);
end

correctness = correctness(difference+1:end);
session = session(difference+1:end);

if ~isequal(length(correctness), length(session))
error('Size of the array does not match. \n')
end

% 4. Wrting Excel as an output
sheet = 1;
header = {'Color', 'Running_Trial', 'CRESP', 'RESP', 'Correctness', 'Reaction_Time', 'Session'};

xlswrite(file_name_new, header, sheet);
xlswrite(file_name_new, colors, sheet, 'A2');
xlswrite(file_name_new, running_trial, sheet, 'B2');
xlswrite(file_name_new, answer, sheet, 'C2');
xlswrite(file_name_new, response, sheet, 'D2');
xlswrite(file_name_new, correctness, sheet, 'E2');
xlswrite(file_name_new, reaction_time, sheet, 'F2');
xlswrite(file_name_new, session, sheet, 'G2');