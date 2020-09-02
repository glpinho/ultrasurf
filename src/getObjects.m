function Objects = getObjects (Image)
% INPUT:
%         Image: Grayscaled image;
% OUTPUT:
%         Objects: Cell contaning the struct:
%              Objects{n}.image: sparse matrix of the object itself;
%              Objects{n}.perimeter: value of the perimeter;
%              Objects{n}.area: value of the area;
%              Objects{n}.centroid = [y x]: coordinates of the centroid;
%-------------------------------------------------------------------------------
    Objects = cell(); % Initializes the cell
%% - - - - - - - - - - - - - - - - L - O - O - P - - - - - - - - - - - - - - - -
    i=1;
    complete = false;
    yin = 1;
    while true
   		[Obj, Image, yin] = cut_object(Image, yin);
   		props = regionprops(Obj, 'centroid');
   		y = props.Centroid(2); x = props.Centroid(1);
   		Objects{i}.centroid = [y x];
   		props = regionprops(Obj, "image");
   		Objects{i}.image = props.Image;
   		props = regionprops(Obj, 'perimeter');
   		Objects{i}.perimeter = props.Perimeter;
   		props = regionprops(Obj, "area");
        Objects{i}.area = props.Area;
%       Objects{i}.velocity = getObjectVelocity(Objects{i}.image, Image2);
        % disp(strcat(num2str(i),' Objects.'));
        i++;
        if ~any(Image)
            disp(strcat(num2str(i),' Objects.'));
            break;
        endif
    endwhile
%% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
endfunction
