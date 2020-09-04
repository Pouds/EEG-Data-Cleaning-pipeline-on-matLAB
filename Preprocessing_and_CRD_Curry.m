 %Written my Julie Schneider & Bambi DeLaRosa May 2016
 %Editting in progress by Sonali P 9/1/2020


SLI_paths; %Changed this

resample= 512; %set resample rate
lowcut=0.1; %set high pass filter
highcut=80; %set low pass filter


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% loop over subjects 
for s = [1] %EDIT FOR SUBJECT OF INTEREST (see subjects script for code)

    % get subject info, same name as subjects.m (function)
    [datafolder subject captype capchan capfile badcell] = SLI_subjects(s);
    subject
    

        % make output directories for each subject and condition         
        pathtran = [pathresearch filesep subject filesep];
        if ~exist(pathtran, 'dir')
            mkdir(pathtran);
        end
        newsetname= [subject '_preproc.set']; %output file new name

        clear EEG ALLEEG
        % start EEGLAB
        eeglab;
filename= B_BEE List 1.mff
       
% load mff file
       EEG = pop_mffimport('fileName', code) ;
        
      %  );pop_mffimport([pathdata datafolder subject '.mff'], 'dataformat', 'auto', 'keystroke', 'on');
       
      [ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET, 'setname', [subject '_preproc'], 'gui', 'off' );
 
        %making set name to subject
        EEG=pop_editset(EEG, 'subject', subject);
         eeglab redraw
        
        %remove unused channels
        EEG=pop_select(EEG, 'nochannel', {'VEO' 'VEOG' 'HEO' 'HEOG' 'M1' 'M2' 'EKG' 'EMG'});
        [ALLEEG EEG CURRENTSET]= pop_newset(ALLEEG, EEG, 1, 'overwrite', 'on', 'gui', 'off');
        [ALLEEG EEG]= eeg_store(ALLEEG, EEG, CURRENTSET);
        
        %resample at new rate 
        EEG=pop_resample(EEG,resample);
        [ALLEEG EEG CURRENTSET]=pop_newset(ALLEEG, EEG,1, 'overwrite', 'on', 'gui', 'off');
        [ALLEEG EEG]= eeg_store(ALLEEG, EEG, CURRENTSET);
        
        %high pass filter
        EEG = pop_eegfilt( EEG, lowcut, 0, [], [0], 0, 0, 'fir1', 0);
        [ALLEEG EEG CURRENTSET]=pop_newset(ALLEEG, EEG,1, 'overwrite', 'on', 'gui', 'off');
        [ALLEEG EEG]= eeg_store(ALLEEG, EEG, CURRENTSET);        

        %low pass filter
        EEG = pop_eegfilt( EEG, 0, highcut, [], [0], 0, 0, 'fir1', 0);
        [ALLEEG EEG CURRENTSET]=pop_newset(ALLEEG, EEG,1, 'overwrite', 'on', 'gui', 'off');
        [ALLEEG EEG]= eeg_store(ALLEEG, EEG, CURRENTSET); 
        
        %clean raw EEG data
        EEG = clean_rawdata(EEG, CURRENTSET, [0.25 0.75], 0.8, 4, 5, 'off');
        EEG = eeg_checkset( EEG );
        pop_eegplot( EEG, 1, 1, 1);
        EEG = eeg_checkset( EEG );
        
        %saving output file
         EEG = eeg_checkset( EEG ); 
         EEG = pop_saveset( EEG, [pathtran newsetname]);
         [ALLEEG EEG] = eeg_store(ALLEEG, EEG, CURRENTSET);
end

