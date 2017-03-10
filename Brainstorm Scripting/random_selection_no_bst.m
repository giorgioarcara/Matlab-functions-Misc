% Script generated by Brainstorm (13-Dec-2016)

% Input files
sFiles = {...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial001.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial002.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial003.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial005.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial006.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial007.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial008.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial009.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial010.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial011.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial012.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial013.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial014.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial015.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial016.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial017.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial018.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial019.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial020.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial021.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial022.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial023.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial025.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial026.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial027.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial028.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial029.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial030.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial031.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial032.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial033.mat', ...
    'CT/CT_ArcaraMapping_20160127_03/data_First_adj_trial034.mat'};


%% SELEZIONE RANDOM %%%
% nota che sovrascrivo sFiles 
% che poi viene utilizzata dopo nella funzione bst_process( ...
sFiles=datasample(sFiles, 10, 'Replace', false)

my_rand_perm=randperm(length(sFiles); %permute randomly elements order
n=20 % select n

sFiles=sFiles(my_rand_perm(1:n)); %get first n elements


% Start a new report
bst_report('Start', sFiles);

% Process: Average: Everything
sFiles = bst_process('CallProcess', 'process_average', sFiles, [], ...
    'avgtype',    1, ...  % Everything
    'avg_func',   1, ...  % Arithmetic average:  mean(x)
    'weighted',   0, ...
    'keepevents', 0);

% Save and display report
ReportFile = bst_report('Save', sFiles);
bst_report('Open', ReportFile);
% bst_report('Export', ReportFile, ExportDir);
