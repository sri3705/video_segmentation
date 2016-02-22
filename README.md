# video_segmentation
This is a modified version of Khoreva CVPR15

https://www.mpi-inf.mpg.de/departments/computer-vision-and-multimodal-computing/research/image-and-video-segmentation/classifier-based-graph-construction-for-video-segmentation/#c7683


How to use:


1- update the VSS paths from line 170 to 190

2- addpath(genpath('.'))

3- run this command:
level = '10'; experiment = '144-level10'; VSS('vw_commercial_21f','ucm2level',level,'uselevelfrw', '10', 'ucm2levelfrw', level, 'newmethodfrw', '1', 'stpcas', 'paperoptnrm', 'experiment', experiment);
