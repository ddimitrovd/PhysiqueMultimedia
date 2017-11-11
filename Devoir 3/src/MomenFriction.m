% Retourne l'acceleration resultante dependament de la force de friction par
% rapport a une vitesse
function [tau] = MomenFriction (v,L,l,m)
  
  g = 9.8;
  
  F = Friction(v) * m;
  F = F / norm(F);
  fnc = @(x,y) (x - L/2) * F(2) - (y - l / 2) * F(1);
  
  p = m * g / L * l;
  
  tau = dblquad(fnc, 0, L, 0, l) * Mu(v) * p;
endfunction