function [Obj, NewBW, newyin] = cut_object (BW, yin)
    ay = max(size( BW(:,1)));
    ax = max(size( BW(1,:)));
	
    broken = false;
    for y = yin:ay
        for x = 1:ax
            if BW(y,x)
            	Obj = bwselect(BW, x, y, 8);
                broken = true;
                break;
            endif
        endfor
        if broken
        	newyin = y;
        	break;
        endif
    endfor
    
    BW(Obj) = false;
    NewBW = BW;
endfunction
