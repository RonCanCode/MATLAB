% Boxes As Specified:
x1 = randn(1000,1) * 0.45 + 5.5;
x2 = randn(1000,1) * 0.50 + 5.5;
x3 = randn(1000,1) * 0.55 + 5.5;
x4 = randn(1000,1) * 0.60 + 5.5;

subplot(4,1,1)
hist(x1,30)
title('Bolts In Box One');
xlabel('Diameter in mm');
ylabel('Number of bolts')

subplot(4,1,2)
hist(x2,30)
title('Bolts In Box Two');
xlabel('Diameter in mm');
ylabel('Number of bolts')

subplot(4,1,3)
hist(x3,30)
title('Bolts In Box Three');
xlabel('Diameter in mm');
ylabel('Number of bolts')

subplot(4,1,4)
hist(x4,30)
title('Bolts In Box Four');
xlabel('Diameter in mm');
ylabel('Number of bolts')
