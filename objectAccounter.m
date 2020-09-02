clear all
addpath src
pkg load image
clc

if isempty(glob("FramesBin"))
	system("mkdir FramesBin");
endif

if ~isempty(glob("FramesBin/*"))
	system("rm FramesBin/*");
endif

imlist = glob("BWImages/*");
for n = 1:size(imlist)
	disp(strcat("FRAME: ", num2str(n)));
	im = imread(imlist{n});
	Objects{n} = getObjects(im);
	Objects = Objects{n};
	filename = strcat("FramesBin/frame", num2dec(n,6));
	save("-binary", filename, "Objects");
endfor

