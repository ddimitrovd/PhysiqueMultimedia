rai1 = [0, 0];
vai1 = [20, 0, 2];
rbi1 = [100, 100];
vbi1 = [-20, -20, -1];
tb1 = 0.0;

rai4 = [0, 0]';
vai4 = [10, 10]';
rbi4 = [25, 10]';
vbi4 = [10, 0]';
tb4 = 0.0;

[xA1 yA1 xB1 yB1] = Devoir3Plot(rai1, vai1, rbi1, vbi1, tb1);
Plot(xA1, yA1, xB1, yB1,'Essai 1');

%[xA4 yA4 xB4 yB4] = Devoir3Plot(rai4, vai4, rbi4, vbi4, tb4);
%Plot(xA4, yA4, xB4, yB4,'Essai 4');