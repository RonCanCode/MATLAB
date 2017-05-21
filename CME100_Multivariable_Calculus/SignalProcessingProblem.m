% Input Sound Data:
[y,fs] = audioread('starsshort.wav');

% Create AudioPlayer Object:
player = audioplayer(y,fs);

% Create New Audio Array:
newY = y;
newFs = fs;

% Length of Array:
audioLength = length(newY);

% Averaging Function:
for i = 4 : audioLength - 4
    newY(i) = ((y(i-3) + 3*y(i-2) + 6*y(i-1) + 7*y(i) ...
        + 6*y(i+1) + 3*y(i+2) + y(i+3)) / 27);
end

% Plot:
subplot(2,1,1)
plot(y)
title('Original Signal')
subplot(2,1,2)
plot(newY)
title('Averaged Signal')

% Test New Audio:
player2 = audioplayer(newY,fs);
play(player2)
