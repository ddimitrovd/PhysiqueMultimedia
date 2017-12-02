% changes values because of a refraction
function [rayIsOut n1 n2 polar azim posX posY posZ] = doRefract(rayIsOut, n1, n2, polar, azim, x, y, z, angRefracAzimFactor, angRefracPolar);;
  
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
  
  polar = pi/2 + angRefracPolar;
  azim = azim - angRefracAzimFactor;

endfunction