% Clear workspace and command window
clear;
clc;

% Specify the Excel file name
fileName = 'nmos_new.xlsx'; % Replace with your file name
sheetNames = {'ft', 'gmro', 'IdW', 'Vgt'}; % List of sheet names
range = ''; % Specify range if needed, leave empty for full sheet

% Loop through each sheet and process its data
for sheetIdx = 1:length(sheetNames)
    sheetName = sheetNames{sheetIdx};
    
    % Read data from the current Excel sheet
    data = readmatrix(fileName, 'Sheet', sheetName, 'Range', range);
    
    % Get the number of columns in the data
    [numRows, numCols] = size(data);

    % Verify if the number of columns is even
    if mod(numCols, 2) ~= 0
        error('The number of columns must be even (pairs of X and Y values).');
    end

    % Initialize a new figure for each sheet
    figure;
    hold on; % Allow multiple plots on the same figure

    % Loop through the data columns (2 columns per dataset)
    for i = 1:2:numCols
        % Read the data
        x = data(:, i);       % X-axis values (odd columns)
        y = data(:, i + 1);   % Y-axis values (even columns)

        % Swap axes for the "ft" sheet
        if strcmp(sheetName, 'ft')
            temp = x;
            x = y;
            y = temp;
        end

        if strcmp(sheetName, 'Vgt')
            temp = x;
            x = y;
            y = temp;
        end

        % Plot each dataset with unique color and marker
        plot(x, y, 'LineWidth', 1.5, 'DisplayName', sprintf('L = %d', 180 + 45 * (i - 1) / 2));
    end

    % Add labels, title, and legend
    grid on;
    xlabel('gm/Id'); % X-axis label for all sheets
    ylabel(sheetName); % Use the sheet name as the Y-axis label
    title(sprintf('Excel Data Plot for Sheet: %s', sheetName));
    legend show; % Automatically show legend for all datasets
    hold off;
end
