clear all
addpath src
pkg load image

im = imread("img2.jpg");
im = rgb2gray(im);
im = edge(im, "canny", [0.000000001 0.1], sqrt(2));
imf = imfill(im, "holes");
img = imf.-im;
imwrite(img, "img2_result.png");

im = img;
Objects = getObjects(im);
save("-binary", "list_obj2", "Objects");
