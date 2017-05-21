t = linspace(0, 20, 100);

x = 2*t;
y = -t;
z = -t;

a = 3*t;
b = 5*t;
c = -2*t;

plot3(x,y,z);
hold on
plotPlane([4/3, -2/3, -2/3], [3, -5, 2]);