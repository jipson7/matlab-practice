%cfr_map.m
%MEASLES

fname = 'Source_data_for_CFR_vaccine_map_abridged.csv';
imgname = '773px-Mercator-projection.jpg';

x = importdata(fname);

minSize = 5;
maxSize = 100;

category = x.textdata(2:end,1);
lat = x.data(:,1);
long = x.data(:,2);
cases = x.data(:,3);

measlesIndex = strcmp('Measles', category);

latitude = lat(measlesIndex);
longitude = long(measlesIndex);

measlesCases = cases(measlesIndex);

addpath ../../Large_Data;

worldMap = imread(imgname);

[worldHeight,worldWidth,~] = size(worldMap);

[x,y] = mercator_Projection(longitude, latitude, worldWidth, worldHeight);



imshow(worldMap, 'InitialMag',100, 'Border','tight');
hold on
%NOTE: I USED THIS BEFORE... BUT THE SCALE FUNCTION USED IN TUTORIAL IS
%BETTER SO IM GOING TO DO THAT INSTEAD
%max radii will be set to 1/8th of the width of the world map. And every
%other radii will be a ratio of that
%radiiRatio = (worldWidth/8)/max(measlesCases);

%Using scale instead, see scale.m for a description
scaledCases = scale(measlesCases, min(measlesCases), max(measlesCases), minSize, maxSize);

for i=1:size(x)
    draw_disk(x(i),y(i),scaledCases(i));
end
set(gcf, 'Name', 'Measles outbreaks (100518555)');
hold off

%clear fname; clear i; clear imgname; clear latitude; clear longitude;

%END MEASLES

%RUBELLA

figure();

rubellaIndex = strcmp('Rubella', category);

latitude = lat(rubellaIndex);
longitude = long(rubellaIndex);

rubellaCases = cases(rubellaIndex);

[x,y] = mercator_Projection(longitude, latitude, worldWidth, worldHeight);

imshow(worldMap, 'InitialMag',100, 'Border','tight');
hold on

%max radii will be set to 1/8th of the width of the world map. And every
%other radii will be a ratio of that
%radiiRatio = (worldWidth/8)/max(rubellaCases);

%Using scale instead, see scale.m for a description
scaledCases = scale(rubellaCases, min(rubellaCases), max(rubellaCases), minSize, maxSize);


for i=1:size(x)
    draw_disk(x(i),y(i),scaledCases(i), 'm');
end
set(gcf, 'Name', 'Rubella outbreaks (100518555)');
hold off

%END RUBELLA

%MUMPS

figure();

mumpsIndex = strcmp('Mumps', category);

latitude = lat(mumpsIndex);
longitude = long(mumpsIndex);

mumpsCases = cases(mumpsIndex);

[x,y] = mercator_Projection(longitude, latitude, worldWidth, worldHeight);

imshow(worldMap, 'InitialMag',100, 'Border','tight');
hold on

%max radii will be set to 1/8th of the width of the world map. And every
%other radii will be a ratio of that
%radiiRatio = (worldWidth/8)/max(mumpsCases);

%Using scale instead, see scale.m for a description
scaledCases = scale(mumpsCases, min(mumpsCases), max(mumpsCases), minSize, maxSize);


for i=1:size(x)
    draw_disk(x(i),y(i),scaledCases(i), 'g');
end
set(gcf, 'Name', 'Mumps outbreaks (100518555)');
hold off

%END MUMPS

%POLIO

figure();

polioIndex = strcmp('Polio', category);

latitude = lat(polioIndex);
longitude = long(polioIndex);

polioCases = cases(polioIndex);

[x,y] = mercator_Projection(longitude, latitude, worldWidth, worldHeight);

imshow(worldMap, 'InitialMag',100, 'Border','tight');
hold on

%max radii will be set to 1/8th of the width of the world map. And every
%other radii will be a ratio of that
%radiiRatio = (worldWidth/8)/max(polioCases);

%Using scale instead, see scale.m for a description
scaledCases = scale(polioCases, min(polioCases), max(polioCases), minSize, maxSize);


for i=1:size(x)
    draw_disk(x(i),y(i),scaledCases(i), 'b');
end
set(gcf, 'Name', 'Polio outbreaks (100518555)');
hold off

%END POLIO

%clear all;