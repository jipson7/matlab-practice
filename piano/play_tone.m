function play_tone(hObject, ~ )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

pos=get(hObject,'CurrentPoint');
xPosition = pos(1);

f = 440;
T = 2;
keyFactor = 2^(1/12);

keys = ones(1, 22);

keys(11) = f;

for i = 12:22
    keys(i) = keys(i-1)*keyFactor;
end

for j = 1:10
    backwardsIndex = 11 - j;
    keys(backwardsIndex) = keys(backwardsIndex + 1)/keyFactor;
end

keyPressed = round((xPosition/37.86), 0);

disp(keyPressed);

keyFreq = keys(keyPressed); %need to change this
samplingRate = 8192;

t = 0:(1/samplingRate):T;

amp = 1;

y = amp*sin(2*pi*keyFreq*t);

sound(y, samplingRate);


end

