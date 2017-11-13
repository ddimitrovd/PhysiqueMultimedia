function [vfA vfB wfA wfB] = VitesseApresCollision(n, point, posA, posB, wA, wB, vitA, vitB, mA, mB, IA, IB)

    restitution = 0.8;
    
    n3 = [n, 0];
    
    rAp = point - posA;
    rAp3 = [rAp, 0];
    rBp = point - posB;
    rBp3 = [rBp, 0];
 
    vAp = [vitA, 0] + (cross([0, 0 ,wA], rAp3));
    vBp = [vitB, 0] + (cross([0, 0 ,wB], rBp3));
    
    vR = dot(n3, (vAp - vBp));
    
    GA = dot(n3, cross((1/IA)*cross(rAp3, n3), rAp3));
    GB = dot(n3, cross((1/IB)*cross(rBp3, n3), rBp3));
    
    a = 1 / (1 / mA + 1 / mB + GA + GB);
    
    j = -a * (1 + restitution) * vR;
    
    u = cross([vitA + vitB, 0], n3) / norm(cross([vitA + vitB, 0], n3));
    
    t = cross(n3, u);
    
    GAt = dot(t, cross((1/IA)*cross(rAp3, t), rAp3));
    GBt = dot(t, cross((1/IB)*cross(rBp3, t), rBp3));
    
    at = 1 / (1 / mA + 1 / mB + GAt + GBt);
    
    if (Mu(vR)*(1+restitution)*abs(vR) < norm(dot(t, [vitA + vitB, 0])))
      jt = at * Mu(vR) * (1+restitution) * vR;
    else
      jt = -at * norm(dot(t, [vitA + vitB, 0]));
    endif
    
    J = n * j + t(1:2) * jt;
    
    % vitesse lineaire  
    vfA = vitA + J/mA;
    vfB = vitB - J/mB;
    
    % vitesse angulaire

    wfA = ([0, 0 ,wA] + (1/IA)*cross(rAp3, [J, 0]))(3);
    wfB = ([0, 0 ,wB] - (1/IB)*cross(rBp3, [J, 0]))(3);
      
endfunction