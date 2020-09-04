%Written my Julie Schneider & Bambi DeLaRosa May 2016
%run ica and save
WRAP_paths_Sdrive;
    
for s = [1 3:5 7:30 32:34] %CHANGE TO SUBJECT OF INTEREST (see subjects script)
 
        clear EEG ALLEEG
        % start EEGLAB
        eeglab;
        
% get subject info, same name as subjects.m (function)
[datafolder subject captype capchan capfile badcell] = VR_subjects2019(s);
subject

%load current dataset
EEG= pop_loadset('filename',[subject '_preproc_CRD.set'],'filepath',[pathresearch 'VR' filesep 'VR-HPfilt' filesep subject filesep]);

% make output directories for each subject and condition         
pathtran = [pathresearch 'VR' filesep 'VR-HPfilt' filesep subject filesep];
   if ~exist(pathtran, 'dir')
         mkdir(pathtran);
   end
       newsetname= [subject '_CRD_ICA.set']; %output file new name
       
EEG= pop_runica(EEG,'extended',1,'interupt', 'on');
[ALLEEG EEG] = eeg_store(ALLEEG,EEG,CURRENTSET)
eeglab redraw

%load channel information
EEG= pop_chanedit(EEG, 'lookup', 'C:\EEGfiles\Data\Neuroscan Caps\Synamps2 Quik-Cap64.dat'); %edit based on location of chanlocs file
[ALLEEG EEG] = eeg_store(ALLEEG,EEG,CURRENTSET)
eeglab redraw

EEG = pop_saveset( EEG, [pathtran newsetname]);
[ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);

end

% [ALLEEG EEG CURRENTSET ALLCOM] = eeglab;
% EEG = pop_loadset('filename','072814_1m_8y_EOC_cleaned.set','filepath','C:\\EEGfiles\\Research\\EOC\\Pre-processing\\072814_1m_8y_EOC\\');
% [ALLEEG, EEG, CURRENTSET] = eeg_store( ALLEEG, EEG, 0 );
% EEG = eeg_checkset( EEG );
% EEG = pop_runica(EEG, 'extended',1,'interupt','on');
% [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
% EEG = eeg_checkset( EEG );
% EEG = pop_saveset( EEG, 'filename','072814_1m_8y_EOC_ICA_manual.set','filepath','C:\\EEGfiles\\Research\\EOC\\ICA Data\\072814_1m_8y_EOC\\');
% [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
% EEG=pop_chanedit(EEG, 'lookup','C:\\Users\\jxs114631\\Desktop\\SynAmps2 Quik-Cap64.DAT');
% [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
% Saving dataset...
% Done.