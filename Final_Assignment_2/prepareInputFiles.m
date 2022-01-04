function [tr_set,test_set] = prepareInputFiles(dsObj)

image_location = fileparts(dsObj.Files{1});
imset = imageSet(strcat(image_location,'\..'),'recursive');
[tr_set,test_set] = imset.partition(30);
test_set = test_set.partition(10);
end