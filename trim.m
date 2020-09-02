clear all
addpath src
pkg load image
clc

if isempty(glob(".Images"))
	system("mkdir .Images");
endif

if ~isempty(glob(".Images/*"))
	system("rm .Images/*");
endif
imlist = glob("Images/*");

for i = 1:size(imlist)
	im = imread(imlist{i});
	im = im(:, 120:676);
	% im = imresize(im, 2);
	name = strcat(".Images/img",num2dec(i, 6),".png");
	imwrite(im, name);
	disp(num2str(i));
endfor

system("rm -r Images");
system("mv .Images Images");

%imwrite(A(15:295,:), 'img0.png');
