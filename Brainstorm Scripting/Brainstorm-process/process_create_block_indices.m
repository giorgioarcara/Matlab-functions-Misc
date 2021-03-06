function varargout = process_create_block_indices( varargin )
% PROCESS_ADD_TAG: Add a comment tag.
%
% USAGE:     sProcess = process_export_conn('GetDescription')
%                       process_export_conn('Run', sProcess, sInputs)

% @=============================================================================
%
% Authors: Giorgio Arcara, Giovanni Pellegrino 23/08/2018,

eval(macro_method);
end


%% ===== GET DESCRIPTION =====
function sProcess = GetDescription() %#ok<DEFNU>
% Description the process
sProcess.Comment     = 'create block indices';
sProcess.FileTag     = '';
sProcess.Category    = 'Custom';
sProcess.SubGroup    = 'Giorgio';
sProcess.Index       = 1022;
%sProcess.Description = 'http://neuroimage.usc.edu/brainstorm/SelectFiles#How_to_control_the_output_file_names';
% Definition of the input accepted by this process
sProcess.InputTypes  = {'data'};
sProcess.OutputTypes = {'data'};
sProcess.nInputs     = 1;
sProcess.nMinFiles   = 1;
%sProcess.Description = 'https://sites.google.com/site/giorgioarcara/erpr';
% Definition of the options


% === FUNC EXPLANATION
sProcess.options.expl.Comment = ['Create an object in matlab WorkSpace with indices that divide <BR>' ...
    ' the files according to block duration' ];
sProcess.options.expl.Type    = 'label';

% Separator
sProcess.options.separator2.Type = 'separator';
sProcess.options.separator2.Comment = ' ';


% === BLOCK SPLIT
sProcess.options.block.Comment = 'block duration (in seconds)';
sProcess.options.block.Type    = 'value';
sProcess.options.block.Value   = {30, '', 0};

% % === TARGET
%  the second number indicates the numbers after decimall separator.
% sProcess.options.tag.Comment = 'block tag';
% sProcess.options.tag.Type    = 'text';
% sProcess.options.tag.Value   = 'min';



end


%% ===== FORMAT COMMENT =====
function Comment = FormatComment(sProcess) %#ok<DEFNU>
Comment = sProcess.Comment;
end
% the comment is apparently a mandatory part of a brainstorm process.

%% ===== RUN =====
function OutputFiles = Run(sProcess, sInputs) %#ok<DEFNU>

Block_dur = sProcess.options.block.Value{1};

OutputFiles = {sInputs.FileName};
List_timing=zeros(length(sInputs),2);

for iFile = 1:length(sInputs)
    
    curr_File = sInputs(iFile);
    
    temp_file=in_bst_data(curr_File.FileName, 'History');
    temp_time=temp_file.History{ismember(temp_file.History(:,2),'import_time'),3};
    temp_time_num=str2num(temp_time);
    
    % get time
    List_timing(iFile, 1)=temp_time_num(1,2); % note! the selection is based on the second element (The end of epoch).
    % define block
    List_timing(iFile, 2)=ceil(temp_time_num(1,2)/Block_dur);    
    
end;

% create output object
FileNames = {sInputs.FileName};
block_indices = List_timing(:,2);

Block_indices{1} = FileNames;
Block_indices{2} = block_indices;

assignin('base', 'Block_indices', Block_indices);




end



