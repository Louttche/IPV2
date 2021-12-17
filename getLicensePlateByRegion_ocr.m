function plate_text = getLicensePlateByRegion_ocr(img, type)
%GETLICENSEPLATEBYREGION Summary of this function goes here
%   Detailed explanation goes here
    plate_text = "N/A";

    if nargin < 2
        type = PlateTypes.Default;
    end

    % By default the ocr function's TextLayout will return a separate 
    % word for each set of letters that are separated by some space.
    ocr_words_letters = ocr(img, 'CharacterSet', 'A':'Z');
    disp("Found letters:");
    for i=1;size(ocr_words_letters.Words, 1)
        disp("  " + i + ":  " + ocr_words_letters.Words{i});
    end

    ocr_words_digits = ocr(img, 'CharacterSet', '0123456789');
    disp("Found digits:");
    for i=1;size(ocr_words_digits.Words, 1)
        disp("  " + i + ":  " + ocr_words_digits.Words{i});
    end

    switch type
        case PlateTypes.Default
            first_2_letters = "[N/A]";
            middle_2_letters = "[N/A]";
            if (size(ocr_words_letters.Words, 1) >= 2)
                first_2_letters = ocr_words_letters.Words{1}(1:2);
                middle_2_letters = ocr_words_letters.Words{2};
            end
            
            first_2_digits = "[N/A]";
            last_4_digits = "[N/A]";
            if (size(ocr_words_digits.Words, 1) >= 3)
                first_2_digits = ocr_words_digits.Words{1}(3:4);
                last_4_digits = ocr_words_digits.Words{3};
            end
            
            plate_text = first_2_letters + "" + first_2_digits + " " + middle_2_letters + " " + last_4_digits;
        
        case PlateTypes.Dutch
            first_letters = "[N/A]";
            last_letters = "[N/A]";
            if (size(ocr_words_letters.Words, 1) > 0)
                first_letters = ocr_words_letters.Words{1};
                last_letters = ocr_words_letters.Words{3};
            end

            middle_digits = "[N/A]";
            if (size(ocr_words_digits.Words, 1) >= 3)
                middle_digits = ocr_words_digits.Words{2};
            end

            plate_text = first_letters + " - " + middle_digits + " - " + last_letters;
    end
end

