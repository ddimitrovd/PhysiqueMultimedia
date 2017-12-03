function [theta phi] = maxAngle(pos)
  
  h = 18;
  Rb = 2;
  posCyn = [4, 4, 11];
  posCynXY = [4, 4];
  posXY = [0, 0];
  
  vecteurPC = posCynXY - posXY;
  vectOrthoPC = [1, -1];
  vectOrthoPC = vectOrthoPC / norm(vectOrthoPC);
  
  pointInters = vecteurPC - (Rb * vecteurPC) / norm(vecteurPC);
  
  coin1 = pointInters + Rb * vectOrthoPC;
  coin2 = pointInters - Rb * vectOrthoPC;
  
  if (pos(3) > 29)
    haut = posCyn - pos;
    haut(1) = haut(1) + Rb;
    haut(3) = haut(3) + h / 2;
    
    bas = posCyn - pos;
    bas(1) = bas(1) - Rb;
    bas(3) = bas(3) - h / 2;
    
  elseif (pos(3) <= 29 || pos(3) >= -7)
    haut = posCyn - pos;
    haut(1) = haut(1) - Rb;
    haut(3) = haut(3) + h / 2;
    
    bas = posCyn - pos;
    bas(1) = bas(1) - Rb;
    bas(3) = bas(3) - h / 2;
    
  elseif (pos(3) < -7)
    haut = posCyn - pos;
    haut(1) = haut(1) + Rb;
    haut(3) = haut(3) - h / 2;
    
    bas = posCyn - pos;
    bas(1) = bas(1) - Rb;
    bas(3) = bas(3) + h / 2;
    
    endif
    phi = acos(dot(haut, bas) / (norm(haut) * norm(bas)));
  
    theta = acos(dot(coin1, coin2) / (norm(coin1) * norm(coin2)));
  endfunction

