function circ = circle(dia)
	imageSizeX = ceil(dia+1);
	imageSizeY = ceil(dia+1);
	[columnsInImage rowsInImage] = meshgrid(1:imageSizeX, 1:imageSizeY);
	% Next create the circle in the image.
	centerX = ceil(imageSizeX/2);
	centerY = ceil(imageSizeY/2);
	radius = dia/2;
	circ = (rowsInImage - centerY).^2 ...
	    + (columnsInImage - centerX).^2 <= radius.^2;
	props = regionprops(circ, 'image');
	circ = props.Image;
endfunction
