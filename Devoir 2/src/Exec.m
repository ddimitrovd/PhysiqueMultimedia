rbi1 = [0.00, 0.50, 1.10]';
vbi1 = [4.00, 0.00, 0.80]';
wbi1 = [0.00, -70.00, 0.00]';

rbi2 = [0.00, 0.40, 1.14]';
vbi2 = [10.00, 1.00, 0.20]';
wbi2 = [0.00, 100.00, -50.00]';

rbi3 = [2.74, 0.50, 1.14]';
vbi3 = [-5.00, 0.00, 0.20]';
wbi3 = [0.00, 100.00, 0.00]';

rbi4 = [0.00, 0.30, 1.00]';
vbi4 = [10.00, -2.00, 0.20]';
wbi4 = [0.00, 10.00, -100.00]';

[coup11 tf11 rbf11 vbf11] = Devoir2(1, rbi1, vbi1, wbi1);
[coup12 tf12 rbf12 vbf12] = Devoir2(2, rbi1, vbi1, wbi1);
[coup13 tf13 rbf13 vbf13] = Devoir2(3, rbi1, vbi1, wbi1);

[coup21 tf21 rbf21 vbf21] = Devoir2(1, rbi2, vbi2, wbi2);
[coup22 tf22 rbf22 vbf22] = Devoir2(2, rbi2, vbi2, wbi2);
[coup23 tf23 rbf23 vbf23] = Devoir2(3, rbi2, vbi2, wbi2);

[coup31 tf31 rbf31 vbf31] = Devoir2(1, rbi3, vbi3, wbi3);
[coup32 tf32 rbf32 vbf32] = Devoir2(2, rbi3, vbi3, wbi3);
[coup33 tf33 rbf33 vbf33] = Devoir2(3, rbi3, vbi3, wbi3);

[coup41 tf41 rbf41 vbf41] = Devoir2(1, rbi4, vbi4, wbi4);
[coup42 tf42 rbf42 vbf42] = Devoir2(2, rbi4, vbi4, wbi4);
[coup43 tf43 rbf43 vbf43] = Devoir2(3, rbi4, vbi4, wbi4);

[x11 y11 z11] = Devoir2Plot(1, rbi1, vbi1, wbi1);
[x12 y12 z12] = Devoir2Plot(2, rbi1, vbi1, wbi1);
[x13 y13 z13] = Devoir2Plot(3, rbi1, vbi1, wbi1);
Plot(x11, y11, z11, x12, y12, z12, x13, y13, z13, 'Essai 1');

[x21 y21 z21] = Devoir2Plot(1, rbi2, vbi2, wbi2);
[x22 y22 z22] = Devoir2Plot(2, rbi2, vbi2, wbi2);
[x23 y23 z23] = Devoir2Plot(3, rbi2, vbi2, wbi2);
Plot(x21, y21, z21, x22, y22, z22, x23, y23, z23, 'Essai 2');

[x31 y31 z31] = Devoir2Plot(1, rbi3, vbi3, wbi3);
[x32 y32 z32] = Devoir2Plot(2, rbi3, vbi3, wbi3);
[x33 y33 z33] = Devoir2Plot(3, rbi3, vbi3, wbi3);
Plot(x31, y31, z31, x32, y32, z32, x33, y33, z33, 'Essai 3');

[x41 y41 z41] = Devoir2Plot(1, rbi4, vbi4, wbi4);
[x42 y42 z42] = Devoir2Plot(2, rbi4, vbi4, wbi4);
[x43 y43 z43] = Devoir2Plot(3, rbi4, vbi4, wbi4);
Plot(x41, y41, z41, x42, y42, z42, x43, y43, z43, 'Essai 4');