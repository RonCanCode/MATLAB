% Ron Guglielmone
% EE102 B - Signal Processing
% June 2, 2017
%
% Echo Cancellation
% Homework #8

function [ x ] = pulse( f, Tdur, fs )

% Sinusoid multiplied by a Hann window.

% f     -> sinusoid frequency in Hz
% Tdur  -> duration in seconds
% fs    -> sampling frequency

nmax = floor(Tdur*fs);
n = 1:nmax;
x = hann(nmax).'.*cos(2*pi*f*n/fs);

end

