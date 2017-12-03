function [xi yi zi face] = Devoir4(nout, nin, poso)
  
  cylSectionX = 4;
  cylSectionY = 4;
  cylR = 2;
  cylMax = 11 + 18/2;
  cylMin = 11 - 18/2;
  
  posX = poso(1);
  posY = poso(2);
  posZ = poso(3);
  
  n1 = nout;
  n2 = nin;
  
  rayIsOut = 1;
  
  i = 0;
  
  % margin angles
  %[theta phi] = maxAngle(poso)
  
  % Ray angular
  polar = pi/2;
  azim = 0.5;
  
  while (i < 100)
    % =================================check if refracted outside=========================================
    if i > 0 && rayIsOut == 1
      break;
    endif
    
    % ==========================================Ray vector===============================================
    rayX = sin(polar)*cos(azim);
    rayY = sin(polar)*sin(azim);
    rayZ = cos(polar);
    
    % =========================================Intersection==============================================
    % XY plane projection intersection
    [x y] = circleLineIntersect(cylSectionX, cylSectionY, cylR, posX, posY, rayX, rayY, rayIsOut); 
    if (x == NaN || y == NaN)
      break;
    endif
    % Z value projection intersection 
    distance = sqrt((x - posX)^2 + (y - posY)^2);
    alfa = pi/2 - polar;
    z = linesIntersectZ(alfa, posX, posZ, distance);
    
    % Check if Z is coorect
    if z > cylMax || z < cylMin
      if posZ < cylMin
        % check for lower disk
        [x y] = chackIfDiskAndLineIntersect(cylMin, cylR, posX, posY, posZ, rayX, rayY, rayZ);
        z = cylMin;
        normV = [0, 0, 1];
      elseif posZ > cylMax
        % check for top disk
        [x y] = chackIfDiskAndLineIntersect(cylMax, cylR, posX, posY, posZ, rayX, rayY, rayZ);
        z = cylMax;
        normV = [0, 0, -1];
      else
        break;
      endif
    else  
      normV = [cylSectionX-x, cylSectionY-y, 0];
    endif
    

    % intersection angle XYZ
    InV = [rayX, rayY, rayZ];
    angIn = acos(real(dot(InV, normV)) / (norm(InV) * norm(normV)));
    if normV(3) == 0
      InVspecific = [rayX, rayY];
      normVspecific = [normV(1), normV(2)];
      angIn = acos(real(dot(InVspecific, normVspecific)) / (norm(InVspecific) * norm(normVspecific)));
    else
      InVspecific = [0, 0, rayV];
      normVspecific = [normV(1), normV(2)];
      angIn = acos(real(dot(InVspecific, normVspecific)) / (norm(InVspecific) * norm(normVspecific)));
    
    % critical angle
    angCrit = asin(n2/n1);
    
    % =======================================refraction or relfection=====================================
    if n1 > n2 && angIn > angCrit
      % reflection
      [polar azim posX posY posZ] = doReflect(polar, azim, x, y, z, InV, normV);
    else
      % refraction (happens only once)
      [rayIsOut n1 n2 polar azim posX posY posZ] = doRefract(rayIsOut, n1, n2, polar, azim, x, y, z, InV, normV);
    endif
    i = i + 1;
  endwhile
endfunction