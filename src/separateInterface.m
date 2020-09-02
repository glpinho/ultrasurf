function [Objint, Newinterface] = separateInterface (Interface)
    A = Interface; % logical
    ay = max(size( A(:,1)));
    ax = max(size( A(1,:)));
	
    isRunning = true;
    for y = 1:ay
        if ~isRunning; break; endif
        for x = 1:ax
            if A(y,x)
                nowy = y;
                nowx = x;
                isRunning = false;
                break;
            endif
        endfor
    endfor
    iniy = nowy;
    inix = nowx;
	
    diry = [-1 0 1 0 -1 -1 1 1];
    dirx = [0 1 0 -1 -1 1 1 -1];
    B = false(ay,ax);
	Newinterface = A;
    lasty = 0;
	lastx = 0;
	
	complete = false;
	while ~complete
		for n = 1:8
			if lasty != (nowy+diry(n)) || lastx != (nowx+dirx(n))
				if A(nowy+diry(n),nowx+dirx(n)) && ~B(nowy+diry(n),nowx+dirx(n))
					B(nowy+diry(n),nowx+dirx(n)) = true;
					Newinterface(nowy+diry(n),nowx+dirx(n)) = false;
					lasty = nowy;
					lastx = nowx;
					nowy = nowy+diry(n);
					nowx = nowx+dirx(n);
					break;
				endif
			endif
			if n == 8; complete = true; endif
		endfor
	endwhile
	Objint = B;
endfunction
