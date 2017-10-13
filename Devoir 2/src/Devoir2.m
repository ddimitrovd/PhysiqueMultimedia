function [coup tf vbf x y z] = Devoir2(option, rbi, vbi, wbi)
  
  accGrav = [0, 0, -9.8]';
  dt = 0.0002;
  T = 0;
  vit = vbi;
  pos = rbi;
  m = 0.0027;
  r = 0.0199;
  
  % Option 1 force grav seulement (force en Z)
  if (option == 1)
    vitInitZ = vbi(3);
    acc = accGrav;
    
    x=[];
    y=[];
    z=[];
    t=[];
    
    while (VerifierConditions(pos) == -1) 
       pos = CalcPos(acc, vbi, rbi, T);
       t = [t T];
       x = [x pos(1)];
       y = [y pos(2)];
       z = [z pos(3)];
       T = T+dt;
    end
    
    % Retourner les resultats
    tf = T;
    vbf = CalcVit(acc,vbi,tf);
    coup = 1; %*********************************************************
     
  % Options 2 et 3 
  else
    x=[pos(1)];
    y=[pos(2)];
    z=[pos(3)];
    t=[T];
    
    while (VerifierConditions(pos) == -1)    
      % Nouvelle iteration dependement de forces en jeu
      if (option == 2)
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
    
    tf = T;
    vbf = vit
    coup = 1; %*********************************************************
  endif
endfunction


% Chercher la nouvelle vitesse de la balle avec RungeKutta
function qs = RungeKutta ( v, w, dt, m, r, fnc ) 
  k1 = feval ( fnc , v , w, m, r )* dt ;
  k2 = feval ( fnc , v + k1 /2 , w, m, r)* dt ;
  k3 = feval ( fnc , v + k2 /2 , w, m, r)* dt ;
  k4 = feval ( fnc , v + k3 , w, m, r)* dt ;
  qs = v +( k1 +2* k2 +2* k3 + k4 )/6;
endfunction


% Acceleration on option Grav
function [ accel ] = Acc1(v, w, m, r)
    grav = [0,0,-9.8]';  
    accel = grav;
endfunction


% Acceleration on option Grav + Visc
function [ accel ] = Acc2(v, w, m, r)
    grav = [0,0,-9.8]';   
    friction = Friction(v)/m;
    
    accel = grav+friction;
endfunction


% Acceleration on option Grav + Visc + Magnus
function [ accel ] = Acc3(v, w, m, r)
    grav = [0,0,-9.8]';
    magnus = Magnus(v,w,r)/m;
    friction = Friction(v) /m;
    
    accel = grav+friction+magnus;
endfunction


function [ f ] = Friction(v)
    l = norm(v);
    p= 1.2;
    Cv = 0.14;
    A = pi*(21.35/1000)^2;
    f = - (p*Cv*A/2)*l*v;
endfunction


function [ Fm ] = Magnus(v,w,r)
    p = 1.2;
    Cm = 0.000791*norm(w);
    A = pi*(r)^2;
    wCv = cross(w,v);
    wCv = wCv/norm(wCv);
    Fm = p*Cm*A*(norm(v)^2)/2*wCv;  
endfunction










% Position en option Gravitationel
function p = CalcPos(a, v0, p0, t)
  p = p0 + v0*t + a/2*t^2;
endfunction


% Vitesse en option Gravitationel
function v = CalcVit(a, v0, t)
  v = v0+t*a;
endfunction