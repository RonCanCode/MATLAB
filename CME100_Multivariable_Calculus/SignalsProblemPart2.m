clear

% Input Sound Data:
[y,fs] = audioread('starsshort.wav');

% Create AudioPlayer Object:
player = audioplayer(y,fs);

% K-Value for Re-sampling (Adjust This):
k = 1;

% Length of Original File:
originalAudioLength = length(y);

% Length of New File:
newAudioLength = uint64((originalAudioLength/k));

% New Audio Array:
newY = zeros(newAudioLength,1);

% Re-Sample:
for i = 1 : newAudioLength
    newY(i) = y(i * k);
end

% Test:
player2 = audioplayer(newY, fs/k);
play(player2)




