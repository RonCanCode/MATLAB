function [ output_sig ] = zeropadwin_hw5( input_sig, padded_length )

% Problem 3 - Homework 6
% EE102 B - May 19, 2017
% Stanford University
%
% Ron Guglielmone
%
% Zero-pads an input signal to padded_length.

output_sig = [input_sig zeros(padded_length,1)'];

end

