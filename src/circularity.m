function c = circularity(obj)
	method = 2;
	switch (method)
		case 1
			perfect_diameter = 2*sqrt(obj.area/pi);
			perfect_circle = circle(perfect_diameter);
			perfect_circle_per = (regionprops(perfect_circle, "perimeter")).Perimeter;
			c = perfect_circle_per/obj.perimeter;
		case 2
			per = obj.perimeter;
			c = (per^2) / (4*pi*(obj.area));
	endswitch
endfunction
