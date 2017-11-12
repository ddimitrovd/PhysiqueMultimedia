function [xA yA xB yB] = Devoir3Plot(rai, vai, rbi, vbi, tb)
  
  dt = 0.05;
  T = 0;
  
  vitA = [vai(1), vai(2)];
  vitB = [vbi(1), vbi(2)];
  wA = vai(3);
  wB = vbi(3);
  posA = rai;
  posB = rbi;
  mA = 1540;
  mB = 1010;
  LA = 4.78;
  LB = 4.23;
  lA = 1.82;
  lB = 1.6;
  
  % positions angulaires par rapport a l'axe x.
  % Position angulaire 0 est quand la voiture est oriente selon l"axe x
  vecX = [1, 0];
  vecA = norm([vitA(1), vitA(2)]);
  vecB = norm([vitB(1), vitB(2)]);
  ThetaA = atan2(1, 0) - atan2(vitA(1), vitA(2));
  ThetaB = atan2(1, 0) - atan2(vitB(1), vitB(2));
  
  % moment d'inertie polaire z
  IA = [((LA*lA)/12)*((LA^2)+(lA^2))];
  IB = [((LB*lB)/12)*((LB^2)+(lB^2))];

  % donnees pour le plot
  xA=[posA(1)];
  yA=[posA(2)];
  xB=[posB(1)];
  yB=[posB(2)];
  
  % memoriser la position initiale des polygones
  [collision, point, n, AX1, AY1, BX1, BY1] = VerifierCollisioEtRetournerPolygones(posA, posB, ThetaA, ThetaB);
    
  while (VerifierCollisioEtRetournerPolygones(posA, posB, ThetaA, ThetaB)(1) == 0 && (norm(vitA) > 1 || norm(vitB) > 1))
    % Nouvelle iteration 

    % Vitesse lineaire
    vitA = vitA + Friction(vitA) * dt;
    vitB = vitB + Friction(vitB) * dt;
    % Vitesse angulaire
    wA = wA + (MomentFriction(vitA, LA, lA, mA) / IA) * dt;
    wB = wB + (MomentFriction(vitB, LB, lB, mB) / IB) * dt;
    
      
    % Mettre a jour la position   
  
    % Position lineaire  
    posA = posA + vitA * dt;
    posB = posB + vitB * dt;  
    % Position angulaire
    ThetaA = ThetaA + wA * dt;
    ThetaB = ThetaB + wB * dt;
     
    xA=[xA posA(1)];
    yA=[yA posA(2)];
    xB=[xB posB(1)];
    yB=[yB posB(2)];
    

    
  endwhile
  
  % memoriser la position initiale des polygones
  [collision, point, n, AX2, AY2, BX2, BY2] = VerifierCollisioEtRetournerPolygones(posA, posB, ThetaA, ThetaB);
  
  % si il a eu collision
  if (collision == 1)
  endif
    
  % Plot la graphique
  Plot(xA, yA, xB, yB, AX1, AX2, AY1, AY2, BX1, BX2, BY1, BY2);
endfunction