% Ron Guglielmone
% EE102 B - Signal Processing
% June 2, 2017
%
% Echo Cancellation
% Homework #8

function [ canceledSig ] = diffCancel( x, l, L, a )

% Canceles an echo signal using a difference
% equation: z[n] = y[n] - alpha*y[n-N].

% x       -> input signal
% l       -> echo length [samples]
% L       -> zero-pad length [samples]
% a       -> echo gain ["alpha"]

canceledSig(1:l) = x(1:l);

for i = l+1 : L
   canceledSig(i) = x(i) - a*canceledSig(i - l);
end

end

