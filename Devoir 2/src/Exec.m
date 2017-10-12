rbi1 = [0.00, 0.50, 1.10];
vbi1 = [4.00, 0.00, 0.80];
wbi1 = [0.00, -70.00, 0.00];

[coup11 tf11 rbf11 vbf11] = Devoir2(1, rbi1, vbi1, wbi1);
Plot(rbf11, [0,0,0], [0,0,0], 'Essai 1');
%[coup12 tf12 rbf12 vbf12] = Devoir2(2, rbi1, vbi1, wbi1);
%[coup13 tf13 rbf13 vbf13] = Devoir2(3, rbi1, vbi1, wbi1);
%PlotGraph(rbf11, rbf12, rbf13, 'Essai 1');