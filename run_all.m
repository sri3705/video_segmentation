function run_all(experiment_name, level, video_name)
    addpath(genpath('.'))
    VSS(video_name,'ucm2level',level,'uselevelfrw', '1', 'ucm2levelfrw', level, 'newmethodfrw', '1', 'stpcas', 'paperoptnrm', 'experiment', experiment_name);
    validate(experiment_name);
 

