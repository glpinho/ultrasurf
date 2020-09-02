function Submatrix = createSubmatrix (Matrix,y,x,size_y,size_x)
% INPUT:
%         Matrix: Matrix from which the Submatrix is to be created;
%         y: Vertical coordinate of the Submatrix to be created;
%         x: Horizontal coordinate of the Submatrix to be created;
%         size_y: Vertical size of the Submatrix to be created;
%         size_x: Horizontal size of the Submatrix to be created;
% OUTPUT:
%         Submatrix: The Submatrix created;
%------------------------------------------------------------------------------- 
% For instance:
%
% Submatrix = createSubmatrix (Matrix,2,3,3,2);
%
% Matrix = 5 6 4 7 1 2            Submatrix = 8 2
%          5 4 8 2 1 6                        7 9
%          6 1 7 9 2 4                        2 9
%          4 6 2 9 7 2
%          0 5 8 4 6 2
%          1 6 4 3 1 5
%------------------------------------------------------------------------------- 

%---{ These inputs have to be integer:
    y = floor(y);
    x = floor(x);
    size_y = floor(size_y);
    size_x = floor(size_x);
%---}

    Submatrix = Matrix( y : size_y+y-1 , x : size_x+x-1 ); % Creating...

endfunction 

