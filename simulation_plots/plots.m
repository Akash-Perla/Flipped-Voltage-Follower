%% First CSV File: Plotting Time, Vline, and Vout
% Load the first CSV file
data1 = readtable('trans.csv'); % Replace with your first CSV file name

% Extract columns
time = data1{:, 1};       % Column 1: Time (s)
Vline1 = data1{:, 2};     % Column 2: /Vline (V)
Vout1 = data1{:, 3};      % Column 3: /Vout (V)

% Plot Vline and Vout vs Time
figure;
plot(time, Vline1, 'b-', 'LineWidth', 1.5); % Blue solid line for Vline
hold on;
plot(time, Vout1, 'r--', 'LineWidth', 1.5); % Red dashed line for Vout
hold off;

% Format the plot
xlabel('Time (s)');
ylabel('Voltage (V)');
title('Voltage vs Time');
legend('/Vline', '/Vout');
grid on;

%% Second CSV File: Plotting Frequency, Vline, Vout, and Gain (dB)
data2 = readtable('ac_response.csv'); 

% Extract columns
freq2 = data2{:, 1};        % Column 1: Frequency (Hz)
Vline2 = data2{:, 2};       % Column 2: Vline (V)
Vout2 = data2{:, 3};        % Column 3: Vout (V)
gain_dB = data2{:, 4};      % Column 4: Gain in dB

% Plot Vline and Vout vs Frequency
figure;
subplot(2, 1, 1); % First subplot
plot(freq2, Vline2, 'b-', 'LineWidth', 1.5); % Blue solid line for Vline
hold on;
plot(freq2, Vout2, 'r--', 'LineWidth', 1.5); % Red dashed line for Vout
hold off;
xlabel('Frequency (Hz)');
ylabel('Voltage (V)');
title('Voltage vs Frequency');
legend('Vline', 'Vout');
ylim([-0.005, 0.015]);
grid on;

% Plot Gain (dB) vs Frequency (Logarithmic x-axis)
subplot(2, 1, 2); % Second subplot
semilogx(freq2, gain_dB, 'g-', 'LineWidth', 1.5); % Green line for Gain (dB)
xlabel('Frequency (Hz)');
ylabel('Gain (dB)');
title('Gain vs Frequency (Log Scale)');
grid on;

% Overall adjustments
sgtitle('PSRR (Heavy Iload = 10mA)');

%% Third CSV File: Plotting Loop Gain and Phase
data3 = readtable('open_loop_analysis.csv'); % Replace with your third CSV file name

% Extract columns
freq3 = data3{:, 1};         % Column 1: Frequency (Hz)
phase_deg = data3{:, 2};     % Column 2: Loop Gain Phase (deg)
gain_loop_dB = data3{:, 3};  % Column 3: Loop Gain dB20 (dB)

% Plot Loop Gain Phase and Gain
figure;

% Loop Gain Phase vs Frequency (Logarithmic x-axis)
subplot(2, 1, 1); % First subplot
semilogx(freq3, phase_deg, 'b-', 'LineWidth', 1.5); % Blue line for Phase
xlabel('Frequency (Hz)');
ylabel('Phase (deg)');
title('Open Loop Gain Phase vs Frequency');
grid on;

% Loop Gain (dB) vs Frequency (Logarithmic x-axis)
subplot(2, 1, 2); % Second subplot
semilogx(freq3, gain_loop_dB, 'r--', 'LineWidth', 1.5); % Red dashed line for Loop Gain
ylabel('Loop Gain (dB)');
xlabel('Frequency (Hz)');
title('Open Loop Gain vs Frequency');
grid on;

% Overall adjustments
sgtitle('Open Loop Gain Analysis');

%% Fourth CSV File: Plotting Frequency, dB20, Vout, and Vline
data4 = readtable('light_load.csv'); % Replace with your fourth CSV file name

% Extract columns
freq4 = data4{:, 1};        % Column 1: Frequency (Hz)
gain_dB20 = data4{:, 2};    % Column 2: dB20((VF("/Vout") / VF("/Vline"))) (dB)
Vout4 = data4{:, 3};        % Column 3: Vout (V)
Vline4 = data4{:, 4};       % Column 4: Vline (V)

% Plot Gain dB20 vs Frequency
figure;

% dB20 vs Frequency (Logarithmic x-axis)
subplot(2, 1, 2); % First subplot
semilogx(freq4, gain_dB20, 'm-', 'LineWidth', 1.5); % Magenta line for Gain dB20
xlabel('Frequency (Hz)');
ylabel('dB20 (dB)');
title('Gain vs Frequency (Log Scale)');
grid on;

% Vout and Vline vs Frequency
subplot(2, 1, 1); % Second subplot
semilogx(freq4, Vline4, 'b-', 'LineWidth', 1.5); % Blue solid line for Vline
hold on;
semilogx(freq4, Vout4, 'r--', 'LineWidth', 1.5); % Red dashed line for Vout
hold off;
xlabel('Frequency (Hz)');
ylabel('Voltage (V)');
title('Voltage Vs Frequency');
legend('Vline', 'Vout');
ylim([-0.005, 0.015]);
grid on;

% Overall adjustments
sgtitle('PSRR (Light Iload = 2mA)');

%% Fifth CSV File: Plotting Frequency, dB20, Vout, and Vline
data5 = readtable('fvf_standalone.csv'); % Replace with your fifth CSV file name

% Extract columns
freq5 = data5{:, 1};        % Column 1: Frequency (Hz)
gain_dB20_5 = data5{:, 2};  % Column 2: dB20((VF("/Vout") / VF("/Vline"))) (dB)
Vout5 = data5{:, 3};        % Column 3: Vout (V)
Vline5 = data5{:, 4};       % Column 4: Vline (V)

% Plot Gain dB20 vs Frequency
figure;

% dB20 vs Frequency (Logarithmic x-axis)
subplot(2, 1, 2); % Second subplot
semilogx(freq5, gain_dB20_5, 'm-', 'LineWidth', 1.5); % Magenta line for Gain dB20
xlabel('Frequency (Hz)');
ylabel('dB20 (dB)');
title('Gain vs Frequency (Log Scale)');
ylim([-80, -20]);
grid on;

% Vout and Vline vs Frequency
subplot(2, 1, 1); % First subplot
semilogx(freq5, Vline5, 'b-', 'LineWidth', 1.5); % Blue solid line for Vline
hold on;
semilogx(freq5, Vout5, 'r--', 'LineWidth', 1.5); % Red dashed line for Vout
hold off;
xlabel('Frequency (Hz)');
ylabel('Voltage (V)');
title('Voltage Vs Frequency');
legend('Vline', 'Vout');
ylim([-0.005, 0.015]);
grid on;

% Overall adjustments
sgtitle('FVF Standalone Analysis');
