function Void = findVoid (Image, region, threshold)
% INPUT:
%         Image: Grayscaled image;
%         region: size of the square surrounding region;
%         threshold: chosen threshold;
% OUTPUT:
%         Void = Image with the void regions identified (!= 1);
%-------------------------------------------------------------------------------
	A = Image;

	ay = max(size( A(:,1))); % Getting size...
	ax = max(size( A(1,:))); % Getting size...

	part_sz = region;
	th = threshold;


	Void = ones(ay+part_sz,ax+part_sz); % Initializing
	Aux = Void;
	Aux(1:ay,1:ax) = A;
	A = Aux;

%% - - - - - - - - - - - - - - - - L - O - O - P - - - - - - - - - - - - - - - -
	for y = 1:ay
   		for x = 1:ax

%---{ Creating the surrounding region: (for details, check 'createSubmatrix.m')
      	    Part = createSubmatrix(A, y, x, part_sz, part_sz);
%---}

        	ave = sum(sum(Part))/(part_sz^2); % Averaging...
    
        	if ave < th
        	    Void(y:(y+part_sz-1),x:(x+part_sz-1)) = Part;
       	   	endif
    
    	endfor
	endfor
%% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	Void = Void(1:ay, 1:ax);
	
	Void(Void!=1) = 0;
	Void(Void==1) = 1;
	Void = logical(Void);
endfunction
