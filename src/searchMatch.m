
function [y,x] = searchMatch(Submatrix,Matrix)
% INPUT:
%         Submatrix: The smaller matrix;
%         Matrix: The larger matrix;
% OUTPUT:
%         y: The vertical coordinate of the position found;
%         x: The horizontal coordinate of the position found;
%-------------------------------------------------------------------------------

%---{ For this specific application, the sizes don't change between iterations, 
% so in order to save efficiency, these variables are only calculated once for 
% each loop: (do not forget to clear these variables between loops)
    persistent matrix_y matrix_x submatrix_y submatrix_x correlations_y ...
    correlations_x ;
  
    if isempty(matrix_y)
        matrix_y = max(size( Matrix(:,1)));
        matrix_x = max(size( Matrix(1,:)));
        submatrix_y = max(size( Submatrix(:,1)));
        submatrix_x = max(size( Submatrix(1,:)));
        correlations_y = matrix_y+1-submatrix_y;
        correlations_x = matrix_x+1-submatrix_x;
    endif
%---}

    Correlations = zeros(correlations_y,correlations_x); % Initializing...

    y = 0; % Initializing...
    x = 0; % Initializing...

%% - - - - - - - - - - - - - - - - L - O - O - P - - - - - - - - - - - - - - - -
    for j = 1:correlations_y
        for i = 1:correlations_x
            highest = max(max(Correlations));
            Aux_matrix = createSubmatrix(Matrix,j,i,submatrix_y,submatrix_x);

%---{ Calculates the degree of resemblance between the matrices: (for details,
%                                                             check 'altcorr.m')
            Correlations(j,i) = altcorr(Submatrix,Aux_matrix);
%---}

            if Correlations(j,i) > highest
                highest = Correlations(j,i);
                y = j;
                x = i;
            endif
        endfor
    endfor
%% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

endfunction
    
