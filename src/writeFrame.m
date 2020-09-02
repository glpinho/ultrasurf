function writeFrame(Objects, filenumber)

    writestring = "";

    for n = 1 : max(size(Objects))

        x = num2str(Objects{n}.centroid(1));
        writestring = strcat(writestring, x);
        y =  num2str(Objects{n}.centroid(2));
        writestring = strcat(writestring,",", y);
        perimeter =  num2str(Objects{n}.perimeter);
        writestring = strcat(writestring,",", perimeter);
        area =  num2str(Objects{n}.area);
        writestring = strcat(writestring,",", area, "\n");
    
    endfor

    filename = strcat("Data/frame_data", num2str(num2dec(filenumber, 5)), ".csv");
    
    save("-text", filename, "writestring");
    
endfunction

