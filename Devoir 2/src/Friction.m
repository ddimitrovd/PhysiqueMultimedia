function [ f ] = Friction(v, r)
    l = norm(v);
    p= 1.2;
    Cv = 0.5;
    A = pi*(r)^2;
    f = - (p*Cv*A/2)*l*v;
endfunction