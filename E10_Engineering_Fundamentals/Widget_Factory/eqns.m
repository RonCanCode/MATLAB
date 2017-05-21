function g = eqnscoupled(t,z)

% t is the time
% z is vector of what we are solving for

alpha=2; %lumped constants
beta=2.5; %lumped constants
nR=z(1); % set first variable to solve
nI=z(2); % set second variable to solve
dnRdt=alpha-nR-nR*nI;
dnIdt=beta-nI+nR*nI;
g = [dnRdt dnIdt]'; 
