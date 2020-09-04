% script binding_paths
% Sets paths for binding experiments
% Thomas Ferree
% Created 6/1/2007
% Last revised 12/16/2007

  pathdata = 'K:\Dept\CallierResearch\Maguire\For PhD use\Sonali\LAB\Evans Lab EEG Data\SLI EGI DATA\';
    pathresearch = 'K:\Dept\CallierResearch\Maguire\For PhD use\Sonali\LAB\Preprocessing\SLI_EGI DataF\';
    pathcode =  'C:/EEGfiles/Research/';
if strcmp(computer, 'MACI')
   pathdata = '/Volumes/Porsche/Data/'
  pathresearch = '/Volumes/Porsche/Research/'
elseif strcmp(computer, 'GLNX86')
   pathdata = '/home/eeg/Data/'
  pathresearch = '/home/tferree/Research/'
elseif strcmp(computer, 'GLNXA64') % Matt's computer
    pathdata = '/home/mmaguire/EEG_analysis/Data/'
   pathresearch = '/home/mmaguire/EEG_analysis/Research/'
  pathcode = '/home/mbriar/EEG_Analysis/Research/'
elseif strcmp(computer, 'CAMAGUIREBEAST') %MaguireBeast
    pathdata = 'C:/EEGfiles/Data/';
    pathresearch = 'C:/EEGfiles/Research/';
    pathcode =  'C:/EEGfiles/Research/';
end

if strcmp(computer, 'CAMAGUIREBEAST') %MaguireBeast
    addpath(genpath('/eeglab2008February26_beta'));
%else
 %   addpath(genpath([pathresearch 'Matlab Packages' filesep 'eeglab6' filesep ]));
end
addpath([pathcode 'Matlab Packages' filesep 'Nway3.1' filesep ]);
addpath([pathcode 'Matlab' filesep 'EEGLAB Tools' filesep ]);
addpath([pathcode 'Matlab' filesep 'NeuroScan Tools' filesep ]);
addpath([pathcode 'Matlab' filesep 'Interpolation' filesep]);
addpath([pathcode 'Matlab' filesep 'Visualization' filesep 'topoplot' filesep ]);
addpath([pathcode 'Matlab' filesep 'NR2Matlab' filesep ]);
addpath([pathcode 'Matlab' filesep 'FFT' filesep ]);
addpath([pathcode 'Matlab' filesep 'PCA' filesep ]);
addpath([pathcode 'Matlab' filesep 'Native Edited' filesep ]);
addpath('C:/EEGfiles/Research/Matlab/Epoch Filter/')
