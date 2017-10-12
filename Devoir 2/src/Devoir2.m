function [coup tf rbf vbf] = Devoir2(option, rbi, vbi, wbi)
  
  accGrav = [0, 0, -9,8];
  
  % Vitesse en option Gravitationel
  function v = CalcVit(a, v0, t)
     v = v0+t*a;
  end
  
  % Accel en option Gravitationel
  function p = CalcPos(a, v0, p0, t)
     p = p0 + v0*t + a/2*t^2;
  end
  
  % Option 1 force grav seulement (force en Z)
  if (option == 1)
    vitInitZ = vbi(3);
    acc = accGrav;
    
    X=[];
    Y=[];
    Z=[];
    T=[];
    
    while (cond)
      pos = 
    end
    
    
    
    
    
    
  else
  
  endif
  
  
  
  
endfunction