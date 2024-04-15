import pandas as pd
from sklearn.datasets import load_iris

def download_data():
    iris = load_iris()
    df = pd.DataFrame(data=iris.data, columns=iris.feature_names)
    df['target'] = iris.target
    df.to_csv('iris.csv', index=False)
    print("Data downloaded and saved to iris.csv")

if __name__ == "__main__":
    download_data()
