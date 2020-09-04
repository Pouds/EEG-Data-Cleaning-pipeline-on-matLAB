function [datafolder subject captype capchan capfile badcell] =SLI_subjects(s)
 
% function [datafolder subject capfile badcell] = binding_subjects(s)
% Generates subject name, cap file name, and bad electrode names for each subject.
% Thomas Ferree
% Last revised 10/30/2007
 
% get data path
if ismember(s,(1:32))
    datafolder = 'Converted Files (2)/';
    captype = 1;
    capchan = 128; %this probably changes from 64 to 128:SP
   
else
    error('Invalid subject number');
end
 
% initialize badcell empty
badcell = {};
 

if s == 1
    subject = '._B_BEE List 1'; %testing if .mff needs to be removed
elseif s == 2
    subject = '._B_BEE List 2'; 
elseif s == 3
    subject = '._B_BRU List 1.mff';
elseif s == 4
    subject = '._B_BRU List 2.mff';
elseif s == 5
    subject = '._C_HAW List 1.mff';
elseif s == 6
    subject = '._C_HAW List 2.mff'; 
elseif s == 7
    subject = '._C_HER List 1.mff';
elseif s == 8
    subject = '._C_HER List 2.mff';
elseif s == 9
    subject = '._Cr_CRO(CAR) List 1.mff';
elseif s == 10
    subject = '._Cr_CRO(CAR) List 2.mff';
elseif s == 11
    subject = '._E_BUR List 1.mff';
elseif s == 12
    subject = '._E_BUR List 2.mff';
elseif s == 13
    subject = '._G_BRU List 1.mff';
elseif s == 14
    subject = '._G_BRU List 2.mff';
elseif s == 15
    subject = '._J_KIN List 1.mff';
elseif s == 16
    subject = '._J_KIN List 2.mff';
elseif s == 17
    subject = '._K_CRO(CAR) List 1.mff';
elseif s == 18
    subject = '._K_CRO(CAR) List 2.mff';
elseif s == 19
    subject = '._K_KIN List 1.mff';
elseif s == 20
    subject = '._K_KIN List 2.mff';
elseif s == 21
    subject = '._M_SQU List 1.mff';
elseif s == 22
    subject = '._M_SQU List 2.mff';
elseif s == 23
    subject = '._M_TUP List 1.mff';
elseif s == 24
    subject = '._M_TUP List 2.mff';
elseif s == 25
    subject = '._R_SIE List 1.mff';
elseif s == 26
    subject = '._R_SIE List 2.mff';
elseif s == 27
    subject = '._S_HAW List 1.mff';
elseif s == 28
    subject = '._S_HAW List 2.mff';
elseif s == 29
    subject = '._T_BEE List 1.mff';
elseif s == 30
    subject = '._T_BEE List 2.mff';
elseif s == 31
    subject = '._Z_DUG List 1.mff'; 
elseif s == 32
    subject = '._Z_DUG List 2.mff';
end
 
% unused 'drop' electrodes in standard 128-channel cap
if captype == 1 && capchan == 128
    dropelectrodes = {'10', '11', '84', '85', '110', '111'};
    badcell = [badcell, dropelectrodes];
end
 
% non-EEG electrodes for all caps combined
noneeg = {'VEO', 'HEO', 'VEOG', 'HEOG', 'EKG', 'EMG', 'M1', 'M2', 'PulseOx'};
badcell = [badcell, noneeg];
 
% default electrode files
if capchan == 64
    capfile = 'Synamps2 Quik-Cap64_human.dat'; %for EGI/netstation files?
elseif capchan == 128
    capfile = 'Synamps2 Quik-Cap128_human.dat';
end


