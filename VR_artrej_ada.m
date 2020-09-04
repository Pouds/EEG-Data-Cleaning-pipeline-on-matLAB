%Written my Julie Schneider & Bambi DeLaRosa May 2016

%LOAD CHANNEL INFORMATION FIRST!!! 
%Edit>Channel Locations
%C:\EEGfiles\Data\Neuroscan Caps\Synamps2 Quik-Cap64.dat

% loop over subjects 
for s = [28]  

%Using MARA to automatically identify artifactual ICA components
[ALLEEG,EEG,CURRENTSET] = processMARA(ALLEEG,EEG,CURRENTSET);
eeglab redraw

WRAP_paths_Sdrive;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% get subject info, same name as subjects.m (function)
[datafolder subject captype capchan capfile badcell] = VR_subjects(s);
subject
 
%load existing dataset
% EEG=pop_loadset('filename', [subject '_ICA.set'], 'filepath', [pathresearch 'WL Original' filesep subject filesep]);

% make output directories for each subject and condition         
pathtran = [pathresearch 'WRAP' filesep 'VR' filesep subject filesep];
   if ~exist(pathtran, 'dir')
         mkdir(pathtran);
   end
       newsetname= [subject '_artrej.set']; %output file new name
       
ICArejection=[];
for j=1:20 %only remove artifacts that fall between components 1 and 20
    if EEG.reject.gcompreject(j)==1
        ICArejection=[ICArejection j];
    end
end

%removing the artifacts that were identified above and saving as a new
%cleaned file
 EEG=pop_subcomp(EEG,ICArejection,0);
 EEG = pop_saveset( EEG, [pathtran newsetname]);
 [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
 
Artifact_List{s,j}=ICArejection; %list that keeps track of removed components

% make output directories for each subject and condition         
pathtran = [pathresearch 'WRAP' filesep 'VR' filesep subject filesep];
   if ~exist(pathtran, 'dir')
         mkdir(pathtran);
   end
       newsetname2= [subject '_averef.set']; %output file new name
       
EEG = pop_reref( EEG, []);
 EEG=pop_subcomp(EEG,ICArejection,0);
 EEG = pop_saveset( EEG, [pathtran newsetname2]);
 [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
end 