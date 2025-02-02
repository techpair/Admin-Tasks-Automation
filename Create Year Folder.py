import os

def create_monthly_folders(year_folder, root_path):
  """
  Creates folders for each month within a given year folder.

  Args:
    year_folder: The name of the year folder (e.g., "2024").
    root_path: The path to the root directory where the year folder is located.
  """

  year_folder_path = os.path.join(root_path, year_folder)
  os.makedirs(year_folder_path, exist_ok=True)  # Create the year folder if it doesn't exist

  for month in range(1, 13):
    month_str = f"{month:02d}"  # Format month with leading zero (e.g., "01" for January)
    month_folder = os.path.join(year_folder_path, f"{year_folder}-{month_str}")
    os.makedirs(month_folder, exist_ok=True)  # Create the monthly folder if it doesn't exist

if __name__ == "__main__":
  year = "2024"  # Replace with the desired year
  root_path = "/path/to/your/root/directory"  # Replace with the actual root path
  create_monthly_folders(year, root_path)
