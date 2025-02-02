import os

def create_monthly_folders(year_folder):
  """
  Creates folders for each month within a given year folder.

  Args:
    year_folder: The name of the year folder (e.g., "2024").
  """

  for month in range(1, 13):
    month_str = f"{month:02d}"  # Format month with leading zero (e.g., "01" for January)
    month_folder = os.path.join(year_folder, f"{year_folder}-{month_str}")
    os.makedirs(month_folder, exist_ok=True)  # Create the folder if it doesn't exist

if __name__ == "__main__":
  year = "2024"  # Replace with the desired year
  create_monthly_folders(year)
