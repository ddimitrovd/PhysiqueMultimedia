% changes values because of a reflection
function [polar azim posX posY posZ] = doReflect(polar, azim, x, y, z, InV, normV);
 
  % top & bottom
  if normV(3) != 0
    polar = pi - polar;
  endif
  
  % side
  if normV(3) == 0
    
    normVxy = [normV(1), normV(2)];
    InVxy = [InV(1), InV(2)];
    angInxy = acos(dot(InVxy, normVxy) / (norm(InVxy) * norm(normVxy)));
    
    if angInxy > pi/2
      angInxy = pi - angInxy;
    endif 
    
    dir = cross([normVxy, 0], [InVxy, 0])(3);  
    if dir == 0 
      dir = 1;
    endif
    
    azim = azim - (pi - angInxy*2)*(dir/abs(dir));
  endif
  
  % set new values
  posX = x;
  posY = y;
  posZ = z;
endfunction