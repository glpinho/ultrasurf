
function Interface = interface (Void)
% INPUT:
%         Void: Void image;
% OUTPUT:
%         Interface: Interface image;
%-------------------------------------------------------------------------------
A = Void;
  
ay = max(size( A(:,1)));
ax = max(size( A(1,:)));

A = surround(A,1,1);
Interface = surround(sparse(false(ay,ax)),2,2);

for y = 2:ay+1
    for x = 2:ax+1
        if A(y,x)
            neighbours = [ A(y-1,x) A(y, x+1) A(y+1, x) A(y, x-1) ];
            if ~all(neighbours)
            	Interface(y,x) = true;
            endif
        endif
    endfor
endfor
A = A(2:ay+1,2:ax+1);
Interface = Interface(2:ay+1,2:ax+1);
endfunction
