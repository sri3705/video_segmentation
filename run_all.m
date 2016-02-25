function run_all(experiment_name, level)
    addpath(genpath('/cs/vml2/smuralid/projects/video_segmentation'))
    VSS('vw_commercial_21f','ucm2level',level,'uselevelfrw', '1', 'ucm2levelfrw', level, 'newmethodfrw', '1', 'stpcas', 'paperoptnrm', 'experiment', experiment_name);
    validate(experiment_name);
 

