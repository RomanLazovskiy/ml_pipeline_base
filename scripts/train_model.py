import pandas as pd
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score
import pickle


def train_model():
    X_train = pd.read_csv('X_train.csv')
    y_train = pd.read_csv('y_train.csv')

    model = RandomForestClassifier(n_estimators=100, random_state=42)
    model.fit(X_train, y_train.values.ravel())

    # Сохранение модели
    with open('iris_model.pkl', 'wb') as f:
        pickle.dump(model, f)
    print("Model trained and saved as iris_model.pkl")


if __name__ == "__main__":
    train_model()
