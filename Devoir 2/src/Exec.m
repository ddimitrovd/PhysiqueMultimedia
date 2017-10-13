rbi1 = [0.00, 0.50, 1.10]';
vbi1 = [4.00, 0.00, 0.80]';
wbi1 = [0.00, -70.00, 0.00]';

[coup11 tf11 vbf11 x11 y11 z11] = Devoir2(1, rbi1, vbi1, wbi1);
[coup12 tf12 vbf12 x12 y12 z12] = Devoir2(2, rbi1, vbi1, wbi1);
[coup13 tf13 vbf13 x13 y13 z13] = Devoir2(3, rbi1, vbi1, wbi1);
Plot(x11, y11, z11, x12, y12, z12, x13, y13, z13, 'Essai 1');