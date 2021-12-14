function words = getLicensePlateByRegion_ocr(img, type)
%GETLICENSEPLATEBYREGION Summary of this function goes here
%   Detailed explanation goes here
    words = "N/A";

    if nargin < 2
        type = PlateTypes.Default;
    end

    char_set_English = 'A':'Z';
    char_set_Digits = '0123456789';

    switch type
        case PlateTypes.Default
            
            words = "default";
        case PlateTypes.Dutch
            words = "Dutch";
    end
end

