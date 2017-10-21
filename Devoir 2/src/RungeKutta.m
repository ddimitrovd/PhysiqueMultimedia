% Chercher la nouvelle vitesse de la balle avec RungeKutta
function qs = RungeKutta ( v, w, dt, m, r, fnc ) 
  k1 = feval(fnc , v , w, m, r )* dt ;
  k2 = feval(fnc , v + k1 /2 , w, m, r)* dt ;
  k3 = feval(fnc , v + k2 /2 , w, m, r)* dt ;
  k4 = feval(fnc , v + k3 , w, m, r)* dt ;
  qs = v +( k1 + 2*k2 + 2*k3 + k4 )/6;
endfunction
