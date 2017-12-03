% changes values because of a reflection
function [polar azim posX posY posZ] = deReflect(polar, azim, x, y, z, InV, normV);
  
  posX = x;
  posY = y;
  posZ = z;
  
  % top & bottom
  if normV(3) != 0
    polar = pi - polar;
  endif
  
  % side
  if normV(3) == 0
    
    polar = -polar;
    
    normVxy = [normV(1), normV(2)];
    InVxy = InV(1), InV(2)];
    angInxy = acos(dot(InVxy, normVxy) / (norm(InVxy) * norm(normVxy)));
    
    azim = azim + (pi - angInxy*2);
  endif

endfunction