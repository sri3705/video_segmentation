# video_segmentation
This is a modified version of Khoreva CVPR15

https://www.mpi-inf.mpg.de/departments/computer-vision-and-multimodal-computing/research/image-and-video-segmentation/classifier-based-graph-construction-for-video-segmentation/#c7683


How to use:

1- First change the paths in the VSS file:
Lines 170 to 190

2- Run the following command:
     experiment_name = '80_hard_negatives_10'; level = '10'; VSS('vw_commercial_21f','ucm2level',level,'uselevelfrw', '1',    'ucm2levelfrw', level, 'newmethodfrw', '1', 'stpcas', 'paperoptnrm', 'experiment', experiment_name);

