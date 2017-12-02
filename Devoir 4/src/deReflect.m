% changes values because of a reflection
function [polar azim posX posY posZ] = deReflect(polar, azim, x, y, z, angReflecAzim, angReflecPolar);
  
  if rayIsOut == 1
    rayIsOut = 0;
  else 
    rayIsOut = 1;
  endif
  
  ntemp = n2;
  n2 = n1;
  n1 = ntemp;
  
  posX = x;
  posY = y;
  posZ = z;
  
  polar = polar + angRefracPolar;
  azim = azim - angRefracAzimFactor;

endfunction