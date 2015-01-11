function draw_disk( xc, yc, R, colour, alpha )
%draw_disk draw a circle with specified center, radius, color, and alpha
%   xc - The x-value of the circle's center coordinate (a numeric value)
%   yc - The y-value of the circle's center coordinate (a numeric value)
%   R - The radius of the circle (a numeric value)
%   colour - a single character specification of colour (rgbcmykw). (a
%   character
%   alpha - The transparency of the circle from 0 - 1, 1 for opague, 0 for
%   full transparency (a numeric value)


    %check the hold state prior to running function
    holdTest = ishold();
    
    %Declare a string of the valid colour inputs
    colourString = 'rgbcmykw';

    %check if # of args is at least 3
    if nargin >= 3
        
        %check if the first 3 values are numeric and throw errors otherwise
        if R < 0
            error 'Radius should not be less than 0';
        elseif ~isnumeric(R)
            error 'Radius needs to be a numeric value';
        elseif ((~isnumeric(xc))||(~isnumeric(yc)))
            error 'The midpoint of the circle needs to have a numeric x and y component';
        end
        
        
        %create the x and y coordinates for the circle
        ang = linspace(0, 2*pi, 1000);
        x = xc + R .* cos(ang);
        y = yc + R .* sin(ang);
    
        %Fill the circle with the default values 
        h = fill(x,y,'r');
        set(h, 'facealpha', 0.5)
        axis equal;
        
    else 
         %throw an error if there is less than 3 args
        error 'Too few input arguments, (at least 3 needed)';
    end
        
    if nargin >= 4
        %set the colour if it is specified and valid
        if ((ismember(colour, colourString)) & length(colour) == 1)
            set(h, 'facecolor', colour)
            axis equal;
        else 
            error 'Invalid Color Argument';
        end
    end
        
    if nargin==5
        %Set the alpha channel value if it specified and valid
        if (~isnumeric(alpha)) || (alpha < 0 || alpha > 1)
            error 'Invalid value for alpha, (must be between 0 and 1)';
        end
        set(h, 'facealpha', alpha)
        
    end 
    
    %Restore the state of hold prior to calling the function
    if holdTest
        hold on
    else 
        hold off
    end
    
    shg
    
end

