function [coup tf rbf vbf] = Devoir2(option, rbi, vbi, wbi)
  
  accGrav = [0, 0, -9.8];
  dt = 0.05;
  T = 0;
  vit = vbi;
  pos = rbi;
  m = 0.0027;
  
  % Option 1 force grav seulement (force en Z)
  if (option == 1)
    vitInitZ = vbi(3);
    acc = accGrav;
    
    x=[];
    y=[];
    z=[];
    t=[];
    
    while (Condition(pos) == -1)
       pos = CalcPos(acc, vbi, rbi, T);
       t = [t T];
       x = [x pos(1)];
       y = [y pos(2)];
       z = [z pos(3)];
       T = T+dt;
    end
    
    % Retourner les resultats
    tf = T;
    rbf = [x, y, z];
    vbf = CalcVit(acc,vbi,tf);
    coup = 1; %*********************************************************
     
  % Options 2 et 3 
  else
    x=[pos(1)];
    y=[pos(2)];
    z=[pos(3)];
    t=[T];
    
    while (Condition(pos) == -1)    
      % Nouvelle iteration dependement de forces en jeu
      if (option == 2)
        vit = RungeKutta (pos, wbi, dt, m , @Acc2);
      else
        vit = RungeKutta (pos, wbi, dt, m , @Acc3);
      endif
      
      % Mettre a jour la position     
      pos = pos + vit*dt;
      
      T = T+dt;
      t=[t T];
      x=[x pos(1)];
      y=[y pos(2)];
      z=[z pos(3)];
    end
    
    tf = T;
    rbf = pos
    vbf = vit
    coup = 1; %*********************************************************
  endif
endfunction


% Chercher la position suivate de la balle avec RungeKutta
function qs = RungeKutta ( v, w, dt, m, fnc ) 
  k1 = feval ( fnc , v , w, m )* dt ;
  k2 = feval ( fnc , v + k1 /2 , w, m)* dt ;
  k3 = feval ( fnc , v + k2 /2 , w, m)* dt ;
  k4 = feval ( fnc , v + k3 , w, m)* dt ;
  qs = v +( k1 +2* k2 +2* k3 + k4 )/6;
endfunction




% Position en option Gravitationel
function p = CalcPos(a, v0, p0, t)
  p = p0 + v0*t + a/2*t^2;
endfunction


% Vitesse en option Gravitationel
function v = CalcVit(a, v0, t)
  v = v0+t*a;
endfunction