%vidname = 'arctic_kayak'
function gtcolor(ss, ee)
source = '/cs/vml2/mkhodaba/datasets/VSB100/General_test_fullres/Groundtruth/%s/';
path = '/cs/vml2/mkhodaba/cvpr16/VSB100/VideoProcessingTemp/%s/gtimages/gt_%d/';
videos = dir('/cs/vml2/mkhodaba/datasets/VSB100/General_test_fullres/Groundtruth/')
videos = videos(3:end);
for v = ss:ee%1:length(videos)
    vidname = videos(v).name
    for d = 1:4
        d
        mkdir(sprintf(path, vidname, d));
        frames = dir(sprintf([source,'*.mat'], vidname));
        for n = 1:length(frames) 
            aaa = load([sprintf(source, vidname), frames(n).name], 'groundTruth');
            groundTruth = aaa.groundTruth;
            a = groundTruth{d}.Segmentation;
            uu = unique(a);
            colors = jet(numel(unique(a))+1);
            img = double(zeros(size(a,1), size(a,2), 3));
            for i = 1:size(a, 1)
                for j =1:size(a,2)
                    img(i,j,:) = colors(uu==a(i,j),:);
                end
            end
            number = frames(n).name(6:8);
            imwrite(img, sprintf([path, 'gtimages_00000%s.png'], vidname, d, number));
        end

    end
end


        