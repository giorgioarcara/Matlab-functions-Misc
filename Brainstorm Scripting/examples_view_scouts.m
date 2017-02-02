%% View Scout 

sFiles = {...
    'Group_analysis/@intra/results_average_161114_0954_zscore_abs_MH001_abs_ssmooth_Fast18.mat', ...
    'Group_analysis/@intra/results_average_161114_0954_zscore_abs_MH002_abs_ssmooth_Fast18.mat', ...
    'Group_analysis/@intra/results_average_161114_0954_zscore_abs_MH003_abs_ssmooth_Fast18.mat'};

% first select parameter from GUI (e.g., atlas, overlay), then send this
% code to display the scout nuber 1 and 10.


view_scouts(sFiles, [1 10], [])


sFiles = {...
    'Group_analysis/@intra/timefreq_hilbert_average_161129_2300_whole_Second_corr_Fast18_ersd_time_MH008_ssmooth_whole_Fast18.mat', ...
    'Group_analysis/@intra/timefreq_hilbert_average_161129_2306_whole_Second_Corr_Slow18_ersd_time_MH008_ssmooth_whole_Slow18.mat', ...
    'Group_analysis/@intra/timefreq_hilbert_average_161129_2312_whole_Second_corr_Fast18_ersd_time_MH009_ssmooth_whole_Fast18.mat', ...
    'Group_analysis/@intra/timefreq_hilbert_average_161129_2318_whole_Second_Corr_Slow18_ersd_time_MH009_ssmooth_whole_Slow18.mat', ...
    'Group_analysis/@intra/timefreq_hilbert_average_161129_2324_whole_Second_corr_Fast18_ersd_time_MH010_ssmooth_whole_Fast18.mat', ...
    'Group_analysis/@intra/timefreq_hilbert_average_161129_2330_whole_Second_Corr_Slow18_ersd_time_MH010_ssmooth_whole_Slow18.mat', ...
    'Group_analysis/@intra/timefreq_hilbert_average_161129_2336_whole_Second_corr_Fast18_ersd_time_MH011_ssmooth_whole_Fast18.mat', ...
    'Group_analysis/@intra/timefreq_hilbert_average_161129_2342_whole_Second_Corr_Slow18_ersd_time_MH011_ssmooth_whole_Slow18.mat', ...
    'Group_analysis/@intra/timefreq_hilbert_average_161129_2348_whole_Second_corr_Fast18_ersd_time_MH012_ssmooth_whole_Fast18.mat', ...
    'Group_analysis/@intra/timefreq_hilbert_average_161129_2355_whole_Second_Corr_Slow18_ersd_time_MH012_ssmooth_whole_Slow18.mat', ...
    'Group_analysis/@intra/timefreq_hilbert_average_161130_0001_whole_Second_corr_Fast18_ersd_time_MH013_ssmooth_whole_Fast18.mat', ...
    'Group_analysis/@intra/timefreq_hilbert_average_161130_0006_whole_Second_Corr_Slow18_ersd_time_MH013_ssmooth_whole_Slow18.mat', ...
    'Group_analysis/@intra/timefreq_hilbert_average_161130_1021_whole_Second_corr_Fast18_ersd_time_MH014_ssmooth_whole_Fast18.mat', ...
    'Group_analysis/@intra/timefreq_hilbert_average_161130_1028_whole_Second_Corr_Slow18_ersd_time_MH014_ssmooth_whole_Slow18.mat'};

view_scouts(sFiles, 13 , [])


% To view time series, make extract values with an electrode
% Process -> run -> extract values

