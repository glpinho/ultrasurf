function [y x] = getObjectVelocity (Object1, Image2)
	
	addpath Aux_functions
	
	[window_y windowx coord_y coord_x] = getSizeAndPosition(Object1);
	Window = createSubmatrix(Object1, coord_y,coord_x, window_y, window_x);

	[y x] = searchMatch(Window,Image2);
	
	y = y - coord_y;
	x = x = coord_x;

endfunction
