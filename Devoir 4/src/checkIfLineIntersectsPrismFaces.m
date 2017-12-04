% checks for intersect with faces of prism
function [xi yi zi face] = checkIfLineIntersectsPrismFaces(lineX, lineY, lineZ, lineVX, lineVY, lineVZ);
  
  xi = [0];
  yi = [0];
  zi = [0];
  face = ['N'];
  
  % look for a intersect on magenta
  zEq= (17 - lineZ)/lineVZ;
  x = zEq*lineVX+lineX;
  y = zEq*lineVY+lineY;
  if x > 3 && x < 4 && y > 3 && y < 5
    xi = [xi x];
    yi = [yi y];
    zi = [zi 17];
    face = [face 'm'];
  endif

  % look for a intersect on blue
  zEq= (12 - lineZ)/lineVZ;
  x = zEq*lineVX+lineX;
  y = zEq*lineVY+lineY;
  if x > 3 && x < 4 && y > 3 && y < 5
    xi = [xi x];
    yi = [yi y];
    zi = [zi 12];
    face = [face 'b'];
  endif

  % look for a intersect on red
  xEq= (3 - lineX)/lineVX;
  z = xEq*lineVZ+lineZ;
  y = xEq*lineVY+lineY;
  if z > 12 && z < 17 && y > 3 && y < 5
    xi = [xi 3];
    yi = [yi y];
    zi = [zi z];
    face = [face 'r'];
  endif

  % look for a intersect on cayan
  xEq= (4 - lineX)/lineVX;
  z = xEq*lineVZ+lineZ;
  y = xEq*lineVY+lineY;
  if z > 12 && z < 17 && y > 3 && y < 5
    xi = [xi 4];
    yi = [yi y];
    zi = [zi z];
    face = [face 'c'];
  endif

  % look for a intersect on green
  yEq= (3 - lineY)/lineVY;
  x = yEq*lineVX+lineX;
  z = yEq*lineVZ+lineZ;
  if x > 3 && x < 4 && z > 12 && z < 17
    xi = [xi x];
    yi = [yi 3];
    zi = [zi z];
    face = [face 'g'];
  endif

  % look for a intersect on yellow
  yEq= (5 - lineY)/lineVY;
  x = yEq*lineVX+lineX;
  z = yEq*lineVZ+lineZ;
  if x > 3 && x < 4 && z > 12 && z < 17
    xi = [xi x];
    yi = [yi 5];
    zi = [zi z];
    face = [face 'y'];
  endif

  if columns(xi) > 1
    % determine which intersect is closer
    d1 = sqrt((xi(2) - lineX)^2 + (yi(2) - lineY)^2 + (zi(2) - lineZ)^2);
    d2 = sqrt((xi(3) - lineX)^2 + (yi(3) - lineY)^2 + (zi(3) - lineZ)^2);
    
    if d1 < d2 
      xi = xi(2);
      yi = yi(2);
      zi = zi(2);
      face = face(2);
    else 
      xi = xi(3);
      yi = yi(3);
      zi = zi(3);
      face = face(3);
    endif
  endif
    
  
endfunction