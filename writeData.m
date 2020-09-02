clear all
addpath src
clc

obj_list = glob("FramesBin/*");

for n = 1 : max(size(obj_list))
    
    load(obj_list{n});
    
    writeFrame(Objects, n);
    
endfor

disp("Done!");
