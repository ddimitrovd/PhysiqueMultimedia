function [theta phi] = maxAngle(pos)
  posCyn = [4, 4, 11];
  h = 18;
  d = 2;
  
  if (pos(3) > 29)
    haut = posCyn - pos;
    haut(1) = haut(1) + d;
    haut(3) = haut(3) + h / 2;
    
    bas = posCyn - pos;
    bas(1) = bas(1) - d;
    bas(3) = bas(3) - h / 2;
    
  elseif (pos(3) <= 29 && pos(3) >= -7)
    haut = posCyn - pos;
    haut(1) = haut(1) - d;
    haut(3) = haut(3) + h / 2;
    
    bas = posCyn - pos;
    bas(1) = bas(1) - d;
    bas(3) = bas(3) - h / 2;
    
  elseif (pos(3) < -7)
    haut = posCyn - pos;
    haut(1) = haut(1) + d;
    haut(3) = haut(3) - h / 2;
    
    bas = posCyn - pos;
    bas(1) = bas(1) - d;
    bas(3) = bas(3) + h / 2;
    
    
    endif
    phi = acos(dot(haut, bas) / (norm(haut) * norm(bas)));
    gauche = posCyn - pos;
    gauche(2) = gauche(2) + d;
    
    droite = posCyn - pos;
    droite(2) = droite(2) - d;
    
    theta = acos(dot(gauche, droite) / (norm(gauche) * norm(droite)));
    
  endfunction
