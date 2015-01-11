pianoImg = imread('pianoboard.png');

imgSize = size(pianoImg);

width = imgSize(2);
height = imgSize(1);

pianoHandle = imshow(pianoImg,'InitialMagnification','fit');

axis image;

set(gcf, 'Position', [100, 100, width, height], 'WindowButtonUpFcn', @play_tone);

shg;

w = waitforbuttonpress;

while w ~= 1
    w = waitforbuttonpress;
end

