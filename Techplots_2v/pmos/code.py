import pandas as pd
import matplotlib.pyplot as plt

# Specify the Excel file name
file_name = 'pmos_new.xlsx'  # Replace with your file name
sheet_names = ['ft', 'gmro', 'IdW', 'Vgt']  # List of sheet names

# Loop through each sheet and process its data
for sheet_name in sheet_names:
    # Read data from the current Excel sheet
    data = pd.read_excel(file_name, sheet_name=sheet_name, engine='openpyxl').to_numpy()
    
    # Get the number of columns in the data
    num_rows, num_cols = data.shape

    # Verify if the number of columns is even
    if num_cols % 2 != 0:
        raise ValueError("The number of columns must be even (pairs of X and Y values).")
    
    # Initialize a new figure for each sheet
    plt.figure()
    
    # Loop through the data columns (2 columns per dataset)
    for i in range(0, num_cols, 2):
        x = data[:, i]       # X-axis values (odd columns)
        y = data[:, i + 1]   # Y-axis values (even columns)

        # Plot each dataset with unique color and marker
        label = f'L = {180 + 45 * (i // 2)}'  # Calculate label for plot
        plt.plot(x, y, label=label, linewidth=1.5)
    
    # Add labels, title, and legend
    plt.grid(True)
    plt.xlabel('gm/Id')  # Replace with appropriate label
    plt.ylabel(sheet_name)  # Replace with appropriate label
    plt.title(f'Excel Data Plot for Sheet: {sheet_name}')
    plt.legend()  # Automatically show legend for all datasets
    plt.show()
