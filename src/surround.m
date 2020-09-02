
function Surr_matrix = surround(Matrix,edge_y,edge_x)
% INPUT:
%         Matrix: Matrix to be surrounded;
%         edge_y: Vertical size of the null zone;
%         edge_x: Horizontal size of the null zone;
% OUTPUT:
%         Surr_matrix: Surrounded matrix;
%-------------------------------------------------------------------------------
% For instance:
%
% Surr_matrix = surround(Matrix,2,2);
%
%      Matrix =    6 3 7 9              surr_matrix =     0 0 0 0 0 0 0 0
%                  4 2 9 7                                0 0 0 0 0 0 0 0
%                  4 5 1 9                                0 0 6 3 7 9 0 0
%                  8 4 6 2                                0 0 4 2 9 7 0 0
%                                                         0 0 4 5 1 9 0 0
%                                                         0 0 8 4 6 2 0 0
%                                                         0 0 0 0 0 0 0 0
%                                                         0 0 0 0 0 0 0 0
%-------------------------------------------------------------------------------

  disp('Surrounding begun.');

%---{ Getting the sizes of the Matrix and the incoming Surrounded Matrix:
    matrix_y = max(size( Matrix(:,1)));
    matrix_x = max(size( Matrix(1,:))); 
    surr_matrix_y = matrix_y + 2*edge_y;
    surr_matrix_x = matrix_x + 2*edge_x;
%---}

    Surr_matrix = zeros( surr_matrix_y , surr_matrix_x ); % Initializing...
 
%---{ Putting the Matrix into:
    Surr_matrix(    edge_y+1 : matrix_y+edge_y
                  , edge_x+1 : matrix_x+edge_x   ) = Matrix;
%---}

    disp('Surrounding complete.');

endfunction
