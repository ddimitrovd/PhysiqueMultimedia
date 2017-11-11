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
  LA = 4.78
  LB = 4.23
  lA = 1.82
  lB = 1.6
  
  % positions angulaires par rapport a l'axe x.
  % Position angulaire 0 est quand la voiture est oriente selon l"axe x
  ThetaA = atan2d(norm(cross([1, 0, 0],[vitA(1), vitA(2), 0])),dot([1, 0, 0],[vitA(1), vitA(2), 0]));
  ThetaB = atan2d(norm(cross([1, 0, 0],[vitB(1), vitB(2), 0])),dot([1, 0, 0],[vitB(1), vitB(2), 0]));
  
  % moment d'inertie polaire z
  IA = [((LA*lA)/12)*((LA^2)+(lA^2))];
  IB = [((LB*lB)/12)*((LB^2)+(lB^2))];

  xA=[posA(1)];
  yA=[posA(2)];
  xB=[posB(1)];
  yB=[posB(2)];
    
  i = 0; % CONDITIONS here 
  while (i < 1000)    % CONDITIONS here 
    % Nouvelle iteration 

    % Vitesse lineaire
    vitA = vitA + Friction(vitA) * dt;
    vitB = vitB + Friction(vitB) * dt;
    % Vitesse angulaire
    wA = wA + (MomenFriction(vitA, LA, lA, mA) / IA) * dt;
    wB = wB + (MomenFriction(vitB, LB, lB, mB) / IB) * dt;
    
      
    % Mettre a jour la position   
  
    % Position lineaire  
    posA = posA + vitA * dt;
    posB = posB + vitB * dt;  
    % Position angulaire
    ThetaA = ThetaA + wA * dt;
    ThetaB = ThetaB + wB * dt;
    
    i = i + 1; % CONDITIONS here 
     
    xA=[xA posA(1)];
    yA=[yA posA(2)];
    xB=[xB posB(1)];
    yB=[yB posB(2)];
  endwhile
endfunction