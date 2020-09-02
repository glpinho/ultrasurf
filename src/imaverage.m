function Ave = imaverage()
	imlist = glob(".Images/*");
	for n = 1:size(imlist)
		im = imread(imlist{n});
		im = pre_process(im);
		if n == 1
			ims = im;
		else
			ims .+= im;
		endif
	endfor
	Ave = ims./size(imlist)(1);
endfunction
