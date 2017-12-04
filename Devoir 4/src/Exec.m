poso124 = [0, 0, 5];
poso3 = [0, 0, 0];

nout123 = 1;
nout4 = 1.2;

nin14 = 1;
nin23 = 1.5;

[xi yi zi face] = Devoir4(nout123, nin14, poso124);
Plot(xi, yi, zi, face, poso124, "Simulation 1");

[xi yi zi face] = Devoir4(nout123, nin23, poso124);
Plot(xi, yi, zi, face, poso124, "Simulation 2");

[xi yi zi face] = Devoir4(nout123, nin23, poso3);
Plot(xi, yi, zi, face, poso3, "Simulation 3");

[xi yi zi face] = Devoir4(nout4, nin14, poso124);
Plot(xi, yi, zi, face, poso124, "Simulation 4");