import yaml
import pandas as pd

from sklearn.model_selection import train_test_split


def main():
  # Parse project settings
  print("Parsing settings...")
  with open("project_setttings.yml", 'r') as f:
    settings = yaml.load(f, Loader=yaml.SafeLoader)
  
  # Read the file
  print("Reading the csv file...")
  print(f"Path to dataset: {settings['dataset']['train_path']}") 
  train = pd.read_csv(settings["dataset"]["train_path"])
  print("Dataset Summary:", "\n", train.describe())
  
  # TODO Padding for the string
  # TODO Positive and Negative into 0 and 1?
  # TODO Train test val split
  
  


if __name__ == "__main__":
  main()