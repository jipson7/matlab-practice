function crop( I_orig, I_out )
%crop crops an image to the user specified width and height
%   Uses ginput to take the users requested area and crop the input image
%   to a new output image
%   First user click is lower left corner, second click is upper right
%   corner
%   I_orig - the original image filename
%   I_out - The outputted image filename

%read I_orig into memory
original = imread(I_orig);

%display the image
imagesc(original);

%ask the user for the lower left
[x,y] = ginput(2);
%Round the user input to the nearest integer
x = int64(x);
y = int64(y);

%do some error checking on user crop selection
if (y(1)<y(2)) || (x(2)<x(1))
    error 'Invalid selection, be sure you are selecting the lower left corner, and then the upper right'
end

%extract the cropped image from the original matrix
cropped = original(y(2):y(1), x(1):x(2));

%write out the cropped image
imwrite(cropped, I_out);

end

