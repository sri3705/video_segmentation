    function validate(idx)
% Benchmark code
% Maintained by Fabio Galasso <research@fabiogalasso.org>
% February 2014
%
% If using this code, please cite the following:
% A Unified Video Segmentation Benchmark: Annotation, Metrics and Analysis
% F. Galasso, N. Shankar Nagaraja, T. Jimenez Cardenas, T. Brox, B. Schiele
% In ICCV, 2013
%
% By using this code you abide to the license agreement enclosed in the
% file License.txt
%
% Version 1.2



%Include the benchmark code into the Matlab path
path(path,'Benchmark');
path(path,['Benchmark',filesep,'Auxbenchmark']);



%Use the command Computerpimvid computes the Precision-Recall curves

benchmarkpath = './Evaluation/'; %The directory where all results directory are contained
%benchmarkdir= 'Algorithm_ochsbrox'; %One the computed results set up for benchmark, here the output of the algorithm of Ochs and Brox (Ucm2 folder) set up for the general benchmark (Images and Groundtruth folders)
if idx == -1
    basedrive=['/cs/vml2/smuralid/projects/eccv16/dataset/VSB100/',filesep]; %Directory where the VideoProcessingTemp dir is located
    basename_variables_directory=[basedrive,'VideoProcessingTemp',filesep,'rock_climbing',filesep, '/Shared/Benchmark/'];
    benchmarkpath = [basename_variables_directory, filesep];    
else
    benchmarkpath = ['/local-scratch/experiments/', idx, '/Shared/Benchmark/'];
end
%benchmarkpath = ['/cs/vml2/mkhodaba/cvpr16/VSB100/VideoProcessingTemp/Shared/Benchmark/']
%benchmarkpath = ['/cs/vml3/mkhodaba/cvpr16/Graph_construction/VideoProcessingTemp_1/Shared/Benchmark/'];
benchmarkdir = 'Segmcfstltifefff'

requestdelconf=true; %boolean which allows overwriting without prompting a message. By default the user is input for deletion of previous calculations
nthresh=51; %Number of hierarchical levels to include when benchmarking image segmentation
superposegraph=false; %When false a new graph is initialized, otherwise the new curves are added to the graph
testtemporalconsistency=true; %this option is set to false for testing image segmentation algorithms
bmetrics={'bdry','regpr','sc','pri','vi','lengthsncl','all'}; %which benchmark metrics to compute:
                                            %'bdry' BPR, 'regpr' VPR, 'sc' SC, 'pri' PRI, 'vi' VI, 'all' computes all available

output=Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'r',superposegraph,testtemporalconsistency,'all');
%The otuput contains the PR values in corresponding fields
%Outputs are written into a Output folder inside the benchmarkdir folder



%The following plots PR curves and aggregate performance measures for the considered VS algorithms

%Parameter setup
%benchmarkpath = './Evaluation/'; %The directory where all results directory are contained
requestdelconf=true; %boolean which allows overwriting without prompting a message. By default the user is input for deletion of previous calculations
nthresh=51; %Number of hierarchical levels to include when benchmarking image segmentation

%General benchmark
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'k',false,[],'all',[],'Output_general_human');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'r',true,[],'all',[],'Output_general_corsoetal');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'b',true,[],'all',[],'Output_general_galassoetal');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'g',true,[],'all',[],'Output_general_grundmannetal');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'r',true,[],'all',[],'Output_general_ochsbrox');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'g--',true,[],'all',[],'Output_general_xuetal');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'m',true,[],'all',[],'Output_general_arbelaezetal');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'c',true,[],'all',[],'Output_general_baseline');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'m--',true,[],'all',[],'Output_general_oracle');

%Motion segmentation benchmark
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'k',false,[],[],[],'Output_motionsegm_human');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'r',true,[],[],[],'Output_motionsegm_corsoetal');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'b',true,[],[],[],'Output_motionsegm_galassoetal');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'g',true,[],[],[],'Output_motionsegm_grundmannetal');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'r',true,[],[],[],'Output_motionsegm_ochsbrox');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'g--',true,[],[],[],'Output_motionsegm_xuetal');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'m',true,[],[],[],'Output_motionsegm_arbelaezetal');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'c',true,[],[],[],'Output_motionsegm_baseline');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'m--',true,[],[],[],'Output_motionsegm_oracle');

%Non-rigid motion segmentation benchmark
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'k',false,[],[],[],'Output_nonrigidmotion_human');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'r',true,[],[],[],'Output_nonrigidmotion_corsoetal');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'b',true,[],[],[],'Output_nonrigidmotion_galassoetal');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'g',true,[],[],[],'Output_nonrigidmotion_grundmannetal');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'r',true,[],[],[],'Output_nonrigidmotion_ochsbrox');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'g--',true,[],[],[],'Output_nonrigidmotion_xuetal');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'m',true,[],[],[],'Output_nonrigidmotion_arbelaezetal');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'c',true,[],[],[],'Output_nonrigidmotion_baseline');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'m--',true,[],[],[],'Output_nonrigidmotion_oracle');

%Camera motion segmentation benchmark
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'k',false,[],[],[],'Output_cameramotion_human');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'r',true,[],[],[],'Output_cameramotion_corsoetal');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'b',true,[],[],[],'Output_cameramotion_galassoetal');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'g',true,[],[],[],'Output_cameramotion_grundmannetal');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'r',true,[],[],[],'Output_cameramotion_ochsbrox');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'g--',true,[],[],[],'Output_cameramotion_xuetal');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'m',true,[],[],[],'Output_cameramotion_arbelaezetal');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'c',true,[],[],[],'Output_cameramotion_baseline');
benchmarkdir='Precomputedresults'; Computerpimvid(benchmarkpath,nthresh,benchmarkdir,requestdelconf,0,'m--',true,[],[],[],'Output_cameramotion_oracle');


