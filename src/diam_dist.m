function dist = diam_dist(frame_listof_objects)
	qtd = size(frame_listof_objects);
	dist = zeros(qtd);
	for n = 1:qtd(2)
		if frame_listof_objects{n}.area == 1
			dist(n) = 1;
		else
			dist(n) = eff_diameter(frame_listof_objects{n});
		endif
	endfor
endfunction

function dia = eff_diameter(obj)
	perfect_diameter = 2*sqrt(obj.area/pi);
	dia = circularity(obj)*perfect_diameter;
endfunction
