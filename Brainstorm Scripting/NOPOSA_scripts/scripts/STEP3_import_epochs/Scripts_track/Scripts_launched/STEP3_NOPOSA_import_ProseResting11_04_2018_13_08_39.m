%% IMPORT EPOCHS
% 1) adjust events with audio channel
% 1) import epochs with -0.1 0.4 of Adjusted
% 2) baseline corection -100 - 0



%% PRELIMINARY PREPARATION
clear

run('NOPOSA_startpath')

cd(curr_path)
addpath('functions')

% launch brainstorm, with no gui (but only if is not already running)
if ~brainstorm('status')
    brainstorm %nogui
end


%% SET EXPORT FOLDER FOR REPORTS
export_main_folder=curr_path;
export_folder='Reports';


if ~exist([export_main_folder, '/' export_folder])
    mkdir([export_main_folder, '/' export_folder]) % create folder if it does not exist
end;


%% GET CURRENT SCRIPT NAME

script_name = mfilename('fullpath')

if (length(script_name) == 0)
    error('You must run this script by calling it from the prompt or clicking the Run button!')
end

%%



%% SET PROTOCOL
ProtocolName = 'NOPOSA_analysis1';

% get the protocol index, knowing the name
iProtocol = bst_get('Protocol', ProtocolName);

% set the current protocol
gui_brainstorm('SetCurrentProtocol', iProtocol);

% check info
ProtocolInfo=bst_get('ProtocolInfo')

% get the subject list
my_subjects = bst_get('ProtocolSubjects')


%% SELECT FILES WITH BRAINSTORM FUNCTION
% select all files
% Start a new report
% Input files
sFiles = [];
SubjectNames = {...
    'All'};

% Process: Select data files in: */*
my_sFiles_ini = bst_process('CallProcess', 'process_select_files_data', [], [], ...
    'subjectname',   SubjectNames{1}, ...
    'condition',     '', ...
    'tag',           '', ...
    'includebad',    0, ...
    'includeintra',  0, ...
    'includecommon', 0);


%% SELECT HERE THE CORRECT FILES
my_sFiles = sel_files_bst({my_sFiles_ini.FileName}, 'Prose|Resting');
my_sFiles = sel_files_bst(my_sFiles, 'resample');



%% SECOND PART IMPORT EPOCHS
% DIVIDE BY SUBJECTS
SubjectNames={my_subjects.Subject.Name};
Subj_files_grouped = group_by_str_bst(my_sFiles, SubjectNames);


% loop over subjects
for iSubj=1:length(SubjectNames)
    
    curr_files = Subj_files_grouped{iSubj}
    
    % process import
    % Script generated by Brainstorm (01-Nov-2017)
    
    % Start a new report
    bst_report('Start', curr_files);
    
    Res = bst_process('CallProcess', 'process_import_data_time', curr_files, [], ...
        'subjectname', SubjectNames{iSubj}, ...
        'condition',   '', ...
        'timewindow',  [,], ...
        'split',       10, ...
        'ignoreshort', 1, ...
        'usectfcomp',  1, ...
        'usessp',      1, ...
        'freq',        [], ...
        'baseline',    [,]);
    
    
    % Process: DC offset correction: [All file]
    Res = bst_process('CallProcess', 'process_baseline', Res, [], ...
        'baseline',    [], ...
        'sensortypes', 'MEG', ...
        'method',      'bl', ...  % DC offset correction:    x_std = x - &mu;
        'overwrite',   1);
    
    
    % Save and display report
    ReportFile = bst_report('Save', Res);
    bst_report('Open', ReportFile);
    % bst_report('Export', ReportFile, ExportDir);
    
end

% loop over run



%% BACKUP SCRIPT AND OBJECT WITH DATA

script_name = mfilename('fullpath')

if (length(script_name) == 0)
    error('You must run this script by calling it from the prompt or clicking the Run button!')
end

export_script(script_name, my_sFiles_ini)
