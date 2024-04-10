%addpath('/Users/mkachlicka/Documents/production')
%%
% Get all .wav files in the folder
folder = 'examples/';
wavFilePattern = fullfile(folder, '*.wav');
wavFiles = dir(wavFilePattern);

% Create a figure
figure;

% Create waveform subplot
subplot(1,1,1);
xlabel('Time (s)');
ylabel('Amplitude');
title('Waveform');
hold on;

% Initialize the red line
h_line = line([0, 0], ylim, 'Color', 'r');

% Main loop
for i = 1:length(wavFiles)
    % Load audio file
    wavFilename = fullfile(folder, wavFiles(i).name);
    [y, Fs] = audioread(wavFilename);
    t = (0:length(y)-1) / Fs;
    
    % Plot waveform
    h_waveform = plot(t, y);
    
    % Set x-axis limits
    xlim([0, max(t)]);
    
    % Set title with current file name
    title(['Waveform - ' wavFiles(i).name], 'Interpreter', 'none');
    
    % Load corresponding TextGrid file
    textGridFilename = strrep(wavFilename, '.wav', '.TextGrid');
    tg = tgRead(textGridFilename);
    
    % Extract timing and label information
    time_stamp = tg.tier{1,2}.T1;
    word_vec = tg.tier{1,2}.Label;
    
% Plot annotations
for j = 1:length(time_stamp)
    start_time = time_stamp(j);
    end_time = time_stamp(min(j+1, length(time_stamp)));
    if j == length(time_stamp)
        middle_time = (end_time + length(y) / Fs) / 2; % Middle between last time stamp and end of audio
    else
        middle_time = (start_time + end_time) / 2;
    end
    label = word_vec{j};
    
    % Plot vertical dotted lines
    line([start_time, start_time], ylim, 'Color', 'k', 'LineStyle', '--');
    
    % Add label text above the waveform
    text(middle_time, max(y), label, 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom');
end
    
    % Play the audio
    player = audioplayer(y, Fs);
    play(player);
    
    % Update the position of the red line while playing
    while isplaying(player)
        currentPosition = player.CurrentSample / Fs;
        yLimits = ylim;
        set(h_line, 'XData', [currentPosition, currentPosition], 'YData', yLimits);
        drawnow limitrate; % Update the figure
    end
    
    % Prompt user to enter comment
    fprintf('Enter comment for %s (press Enter to skip): ', wavFiles(i).name);
    comment = input('', 's');
    
    % Save comment with the file name
    wavFiles(i).comment = comment;
    
    % Check if there are more sounds to play
    if i < length(wavFiles)
        fprintf('Press the spacebar to play the next sound.\n');
        waitforbuttonpress; % Wait for spacebar press to play the next sound
    end
    
    % Clear the waveform plot for the next sound
    delete(h_waveform);
    
    % Clear the annotations
    delete(findobj('Type', 'Line', 'Color', 'k', 'LineStyle', '--'));
    delete(findobj('Type', 'Text'));
end

close(gcf);
save('preview_examples.mat', 'wavFiles')
writetable(struct2table(wavFiles), 'preview_examples.csv')
