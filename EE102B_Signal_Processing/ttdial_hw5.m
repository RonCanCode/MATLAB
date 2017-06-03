function ttsignal = ttdial_hw5( phone_number )

% Problem 1 - Homework 6
% EE102 B - May 19, 2017
% Stanford University
%
% Ron Guglielmone
%
% Takes in a phone_number as an array
% and returns a signal.  The signal is
% 0.5s per number, with 0.125s pauses.
% It follows the following frequency
% matrix convention for DTMF:

%       1209  1336  1477   f1
% 697 |  1  |  2  |  3  |'''''
% 770 |  4  |  5  |  6  |
% 852 |  7  |  8  |  9  |
% 941 |  *  |  0  |  #  |
% f2  |

% Where each number corresponds to a
% tone y(t) = cos(f1*t) + cos(f2*t).

% Constants:
fs = 8192;
durTone = (0.5*fs);
durPause = (0.125*8192);
N = length(phone_number);
freqs       = [697 1209;   % 1
               697 1336;   % 2
               697 1477;   % 3
               770 1209;   % 4
               770 1336;   % 5
               770 1477;   % 6
               852 1209;   % 7
               852 1336;   % 8
               852 1477;   % 9
               941 1209;   % *
               941 1336;   % 11
               941 1477];  % #
           
 % Pre-allocate:
 ttsignal = [];
 
 % Build signal:
 for i = 1 : N
     
     % Check for * button:
     if (phone_number(i) == '*')
         n = 10;
     
     % Check for 0 button:
     else if (phone_number(i) == 0)
         n = 11;   
     
     % Check for # button:
     else if (phone_number(i) == '#')
         n = 12;
     
          % Any other button:
         else
         n = phone_number(i);
         end
         end
     end
     
     % Build signal segment:
     t = [0 : durTone - 1] / fs;
     pause = zeros(durPause,1)';
     block = cos(2.*pi.*freqs(n,1).*t) + ...
             cos(2.*pi.*freqs(n,2).*t);
     ttsignal = [ttsignal block pause];
     
 end
 
end

