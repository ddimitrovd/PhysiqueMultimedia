% finds the z value on a x y line coordinates
function [z] = linesIntersectZ(x, y, posX, posY, posZ, rayX, rayY, rayZ)
  
  if rayX != 0
    xEq = (x - posX)/rayX;
    z = xEq*rayZ + posZ;
  elseif rayY != 0
    yEq = (y - posY)/rayY;
    z = yEq*rayZ + posZ;
  else
    z = 0;
  endif

endfunction