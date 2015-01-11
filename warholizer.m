function warholizer( imageName )
%warholizer Warholizer
%   Warholizer

numberOfColours = 120;

original = imread(imageName);


a = 0.01;
b = 0.99;

map1 = (b-a).*rand(numberOfColours,3) + a;
map2 = (b-a).*rand(numberOfColours,3) + a;
map3 = (b-a).*rand(numberOfColours,3) + a;
map4 = (b-a).*rand(numberOfColours,3) + a;

imwrite(original(:,:,1), map1, 'img1.jpg');
img1 = imread('img1.jpg');

imwrite(original(:,:,2), map2, 'img2.jpg');
img2 = imread('img2.jpg');

imwrite(original(:,:,3), map3, 'img3.jpg');
img3 = imread('img3.jpg');

imwrite(original(:,:,1), map4, 'img4.jpg');
img4 = imread('img4.jpg');

finalImage = [img1,img2;img3,img4];

imwrite(finalImage, 'warhol.jpg');

delete img1.jpg;
delete img2.jpg;
delete img3.jpg;
delete img4.jpg;

end

