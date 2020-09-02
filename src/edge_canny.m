%function [bw, thresh] = edge_canny (im, thresh = [], sigma = sqrt (2))
%  if (nargin > 1 && (! isnumeric (thresh) || all (numel (thresh) != [0 1 2])))
%    error ("edge: THRESH for Canny method must have 0, 1, or 2 elements");
%  endif
%  if (nargin > 2 && (! isnumeric (sigma) || ! isscalar (sigma)))
%    error ("edge: SIGMA for Canny method must be a numeric scalar");
%  endif
function [Es, Eo, thresh] = edge_canny(im, thresh, sigma)
  sigma = sqrt(2);
  thresh = [];
  ## Gaussian filtering to change the edge scale.
  ## Treat each dimensions separately for performance.
  gauss = fspecial ("gaussian", [1 (8*ceil(sigma))], sigma);
  im = im2double (im);
  J = imfilter (im, gauss, "replicate");
  J = imfilter (J, gauss', "replicate");
  ## edge detection with Prewitt filter (treat dimensions separately)
  p = [1 0 -1]/2;
  Jx = imfilter (J, p, "replicate");
  Jy = imfilter (J, p', "replicate");
  Es = sqrt (Jx.^2 + Jy.^2);
  Es_max = max (Es(:));
  if (Es_max > 0)
    Es ./= Es_max;
  endif
  %%%%%GRADIENT MAGNITUDE ^^^^^^^^^^
  
  Eo = pi - mod (atan2 (Jy, Jx) - pi, pi);
  if (isempty (thresh))
    tmp = mean(abs(Es(:)));
   thresh = [0.4*tmp, tmp];
  elseif (numel (thresh) == 1)
    thresh = [0.4*thresh thresh];
  else
    thresh = thresh(:).'; # always return a row vector
  endif
  
  bw = nonmax_suppresse(Es, Eo, thresh(1), thresh(2));
endfunction
