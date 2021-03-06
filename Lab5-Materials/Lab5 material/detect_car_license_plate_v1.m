function  car_character = detect_car_license_plate_v1(car_license_plate,alphanumeric_templates)

my_threshold = 0.5;

car_license_binary = im2bw(car_license_plate,my_threshold);

% segment car license
character_im = segment_car_license(car_license_binary);

alphanumeric_templates_binary = im2bw(alphanumeric_templates, my_threshold);

% hashmap key is string, value is image
map_container = im_map_character(alphanumeric_templates_binary);

alphabet = map_container.keys;

length_alphabet = length(alphabet);
length_character = length(character_im);

car_character = [];

for i = 1:length_character
    for j = 1:length_alphabet
        
        E_strel = map_container(alphabet{j});
        
        %         erode
        im_test = imerode(character_im{i},E_strel);
        is_mattched = sum(sum(im_test)) == 1;
        
        if is_mattched
            break;
        end
    end
    
    if is_mattched
        car_character = [car_character alphabet{j}];
    end
end

end