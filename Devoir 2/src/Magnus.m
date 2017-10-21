function [ Fm ] = Magnus(v,w,r)
    R = r^3;
    p = 1.2;
    Cm = 0.29;
    wCv = cross(w,v);
    Fm = 4*pi*Cm*p*R*wCv;
endfunction