function [xi yi zi face] = Devoir4(nout, nin, poso)
  
  xi = [0];
  yi = [0];
  zi = [0];
  face = ['N'];
  
  cylSectionX = 4;
  cylSectionY = 4;
  cylR = 2;
  cylMax = 11 + 18/2;
  cylMin = 11 - 18/2;
  
  [thetaMax thetaMin phiMax phiMin] = maxAngle(poso); % This function does not function correctly for azim angles
  
  polarMax = phiMax;
  polarMin = phiMin;
  azimMax = pi/2;
  azimMin = 0;
  
  % =========================================Simulation loop=================================================
  P = 60;
  A = 60;
  
  for p = 1:P
    for a = 1:A
      polar = polarMin + ((polarMax - polarMin)/(2*P)) * (2*p-1);
      azim = azimMin + ((azimMax - azimMin)/(2*A)) * (2*a-1);
      
      posX = poso(1);
      posY = poso(2);
      posZ = poso(3);
      
      n1 = nout;
      n2 = nin;
      
      rayIsOut = 1;
      
      i = 0;
  
      while (i < 100)
        % =================================check if refracted outside========================================
        if i > 0 && rayIsOut == 1
          break;
        endif
        
        % ==========================================Ray vector===============================================
        rayX = sin(polar)*cos(azim);
        rayY = sin(polar)*sin(azim);
        rayZ = cos(polar);
        
        % ===================================Prism intersection check========================================
        if rayIsOut == 0
          [xa ya za f] = checkIfLineIntersectsPrismFaces(posX, posY, posZ, rayX, rayY, rayZ);
          if (rayIsOut == 0 && f(1) != 'N')
            xi = [xi xf];
            yi = [yi yf];
            zi = [zi zf];
            face = [face f];
            break;
          endif
        endif
          
        
        % =========================================Intersection==============================================
        % XY plane projection intersection
        [x y] = circleLineIntersect(cylSectionX, cylSectionY, cylR, posX, posY, rayX, rayY, rayIsOut); 
        if (isnan(x) == 1 || isnan(y) == 1)
          break;
        endif
        % Z value projection intersection 
        distance = sqrt((x - posX)^2 + (y - posY)^2);
        alfa = pi/2 - polar;
        z = linesIntersectZ(x, y, posX, posY, posZ, rayX, rayY, rayZ);
        
        % Check if Z is coorect
        if z > cylMax || z < cylMin     
          if ((rayIsOut == 1 && rayZ > 0) || (rayIsOut == 0 && rayZ < 0))
            % check for lower disk
            [x y] = chackIfDiskAndLineIntersect(cylMin, cylR, posX, posY, posZ, rayX, rayY, rayZ);
            z = cylMin;
            normV = [0, 0, 1];
          elseif ((rayIsOut == 1 && rayZ < 0) || (rayIsOut == 0 && rayZ > 0))
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
        
        if (isnan(x) == 1 || isnan(y) == 1)
          break;
        endif
        
        % save first intersection of ray with cylinder
        if i == 0
          xf = x;
          yf = y;
          zf = z;
        endif;

        % intersection angle XYZ
        InV = [rayX, rayY, rayZ];
        angIn = (acos((dot(InV, normV)) / (norm(InV) * norm(normV))));
        if angIn > pi/2
          angIn = pi - angIn;
        endif 
        
        % critical angle
        angCrit = asin(n2/n1);
        
        % =======================================refraction or relfection=====================================
        if n1 > n2 && angIn > angCrit % total reflectio or more reflection/refraction with enough intensity reflected to continue simulation
          % reflection
          [polar azim posX posY posZ] = doReflect(polar, azim, x, y, z, InV, normV);
        else
          % refraction (happens only once)
          [rayIsOut n1 n2 polar azim posX posY posZ] = doRefract(rayIsOut, n1, n2, polar, azim, x, y, z, InV, normV);
        endif
        i = i + 1;
      endwhile
    endfor
  endfor
endfunction