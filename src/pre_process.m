function Img = pre_process (Pre_img)
% INPUT:
%         Pre_img: Matrix to be pre-processed;
% OUTPUT:
%         Img: Pre-processed image; 
%-------------------------------------------------------------------------------


    Img=double(Pre_img); % Casting the matrix into double...

%---{ If the matrix is a colorful image, turn it to grayscale:
    if size(size(Img))(2)>=3 %RGB
        Img=(Img(:,:,1)+Img(:,:,2)+Img(:,:,3))/3.0;
    endif
%---}

%---{ What is the bit-depth?
    if max(max(Img))>255
        Img=(Img./65535);
    elseif max(max(Img))>1
        Img=(Img./255);
    endif
%---}

endfunction
