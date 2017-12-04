% finds if a plane intersects a line
function [x y] = chackIfDiskAndLineIntersect(diskPosZ, r, lineX, lineY, lineZ, lineVX, lineVY, lineVZ)
  
  cX=4;
  cY=4;
  
  % line equation  
  zEq= (discPosZ - lineZ)/lineVZ;
  
  % intersec
  x = zEq*lineVX+lineX;
  y = zEq*lineVY+LineY;
  
  % check if part of disk
  if (x-cX)^2+(y-cY)^2 <= r^2;
    return;
  else
    x = NaN;
    y = NaN;
  endif
endfunction