function [images] = Read_Images(img_dir, pattern, dip)
%READ_IMAGES Reads PNG images from specified directory
    
    % If pattern is not given set to default (By counting arguments given)
    if nargin < 2
        pattern = '*.png';
        dip = false;
    elseif nargin < 3
        dip = false;
    end
    
    filePattern = fullfile(img_dir, pattern);
    disp("Reading images at - " + filePattern);
    img_files = dir(filePattern);
    disp("Number of images found in directory: " + length(img_files));
    
    images = {0};
    for k = 1 : length(img_files)
        fullFileName = fullfile(img_files(k).folder, img_files(k).name);
        if (dip == false)
            images{k} = imread(fullFileName);
        else
            images{k} = dip_image(fullFileName);
        end
    end
    
    disp("Read " + length(img_files) + "/" + length(img_files));
end