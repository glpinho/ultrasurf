
function retval = num2dec(num, dec)
	nonz = ceil(log10(num+1));
	zer = "";
	for i = 1:(dec-nonz)
		zer = strcat(zer, "0");
	endfor
	retval = strcat(zer, num2str(num));
endfunction 

