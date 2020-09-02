clear all
addpath src
pkg load image
clc

if isempty(glob("BWImages"))
	system("mkdir BWImages");
endif

if ~isempty(glob("BWImages/*"))
	system("rm BWImages/*");
endif

imlist = glob("Images/*");
%Ave = imaverage();
%cone = im2bw(Ave, 0.2);
for n = 1:size(imlist)
	im = imread(imlist{n});
	if size(im, 3) == 3
		im = rgb2gray(im);
	endif
	im = edge(im, "canny", [0.0000001 0.1], sqrt(2));
	%im = and(im, ~cone);
	imf = imfill(im, "holes");
	img = imf.-im;
	str = strcat("BWImages/img", num2dec(n,6),".png");
	imwrite(img, str);
	disp(num2str(n));
endfor


