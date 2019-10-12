im = imread('lenna512.bmp');
im = im2double((im));
sobel_horizontal=[-1.0 -2.0 -1.0;0.0 0.0 0.0; 1.0 2.0 1.0];
sobel_vertical=[-1.0 0.0 1.0; -2.0 0.0 2.0; -1.0 0.0 1.0];

horizontal_detection = imfilter(im, sobel_horizontal);
vertical_detection = imfilter(im, sobel_vertical);

imshow(horizontal_detection)
