function [sy sx y1 x1] = getSizeAndPosition (Object)

	yy = max(size( A(:,1)));
	xx = max(size( A(1,:)));
	
	for y = 1:yy
		if any(Object(y,:))
			if y > 1
				y1 = y-1;
			else
				y1 = 1;
			endif
			break;
		endif
	endfor
	
	for y = yy:-1:1
		if any(Object(y,:))
			if y < yy
				y2 = y;
			else
				y2 = yy;
			endif
			break;
		endif
	endfor
	
	for x = 1:xx
		if any(Object(:,x))
			if x > 1
				x1 = x;
			else
				x1 = 1;
			endif
			break;
		endif
	endfor
	
	for x = xx:-1:1
		if any(Object(:,x))
			if x < xx;
				x2 = x;
			else
				x2 = xx;
			endif
			break;
		endif
	endfor
	
	sy = y2 - y1;
	sx = x2 - x1;
	
	OnlyObject = createSubmatrix(Object,y1,x1,sy,sx);
endfunction
