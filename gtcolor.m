vid_name = 'rock_climbing'

source = '/cs/vml2/mkhodaba/datasets/VSB100/General_test_fullres/Groundtruth/%s/image%03d.mat';
path = '/cs/vml2/mkhodaba/cvpr16/VSB100/VideoProcessingTemp/%s/gtimages/gt_%d/'
imgname = 'gtimages%08d.png';
%name = 'rock_climbing';
interval = 20
start_frame = 100;
how_many = 2

for d = 1:4
    mkdir(sprintf(path, vid_name, d));
    for n =0:how_many-1
        frame_number = start_frame+n*interval;
        
        load([sprintf(source, vid_name, frame_number)]);
        a = groundTruth{d}.Segmentation;
        colors = jet(numel(unique(a)));
        img = double(zeros(size(a,1), size(a,2), 3));
        for i = 1:size(a, 1)
            for j =1:size(a,2)
                img(i,j,:) = colors(a(i,j),:);
            end
        end
        %imshow(img);
        imwrite(img, [sprintf(path, name, d), sprintf(imgname, frame_number)]);
    end
end



        