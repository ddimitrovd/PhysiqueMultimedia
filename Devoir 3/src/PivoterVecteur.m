function vr = PivoterVecteur(v, angle)

  cot = cos(angle);
  sit = sin(angle);

  vr = [cot * v(:,1) - sit * v(:,2) , sit * v(:,1) + cot * v(:,2)];
  
endfunction

