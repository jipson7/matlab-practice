function [ whiteMap ] = WhiteWash( map )
%WhiteWash Averages each colour of a colour map with white, to create a
%whitewash effect
%   map - the inputted colour map to be whitewashed
%   whiteMap - The whitewashed colour map

[rows, cols] = size(map);

if cols ~= 3 || rows < 1
    error 'Are you sure the input is a valid colour map?';
end

whiteMap = zeros(rows, cols);

for i = 1:rows
    for j = 1:cols
        whiteMap(i, j) = ((map(i, j) + 1) / 2);
    end
end



end

