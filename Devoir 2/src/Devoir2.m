function [coup tf rbf vbf] = Devoir2(option, rbi, vbi, wbi)
  
  accGrav = [0, 0, -9.8]';
  dt = 0.002;
  T = 0;
  vit = vbi;
  pos = rbi;
  m = 0.0027;
  r = 0.0199;
  

  x=[pos(1)];
  y=[pos(2)];
  z=[pos(3)];
  t=[T];
    
  while (VerifierConditions(pos, rbi) == -1)    
    % Nouvelle iteration dependement de forces en jeu
    if (option == 1)
      vit = RungeKutta (vit, wbi, dt, m, r, @Acc1);
    elseif (option == 2)
      vit = RungeKutta (vit, wbi, dt, m, r, @Acc2);
    else
      vit = RungeKutta (vit, wbi, dt, m, r, @Acc3);
    endif
      
    % Mettre a jour la position     
    pos = pos + vit*dt;
      
    T = T+dt;
    t=[t T];
    x=[x pos(1)];
    y=[y pos(2)];
    z=[z pos(3)];
  end
   
  rbf= [pos(1), pos(2), pos(3)];
  tf = T;
  vbf = vit;
  coup = VerifierConditions(pos, rbi);
endfunction