% https://stackoverflow.com/questions/1549909/intersection-on-circle-of-vector-originating-inside-circle
function [x y] = circleLineIntersect(circleX, circleY, r, lineX, lineY, lineVX, lineVY, isOutOfCircle)
  
  x = NaN;
  y = NaN;
  
  xDiff = lineX - circleX;
  yDiff = lineY - circleY;
  a = lineVX * lineVX + lineVY * lineVY;
  b = 2 * (lineVX * (lineX - circleX) + lineVY * (lineY - circleY));
  c = xDiff * xDiff + yDiff * yDiff - r * r;
  disc = b * b - 4 * a * c;
  
  if disc >= 0 
    if isOutOfCircle == 1 
      t = (-b - sqrt(disc)) / (2 * a);
    else 
      t = (-b + sqrt(disc)) / (2 * a);
    endif
    x = lineX + lineVX * t;
    y = lineY + lineVY * t;
  endif

endfunction