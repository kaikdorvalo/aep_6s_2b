import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import classification_report, confusion_matrix

from joblib import dump
from joblib import load

# data = pd.read_csv('db/clean.csv', usecols=["senha", "classificacao"])

# print(data['senha'].isnull().sum())
# data = data.dropna(subset=['senha'])

# vectorizer = TfidfVectorizer(analyzer='char', ngram_range=(1, 3))
# vectorizer.fit(data['senha'])
# X = vectorizer.fit_transform(data['senha'])
# y = data['classificacao']

# X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# clf = RandomForestClassifier(random_state=42, n_estimators=20)
# clf.fit(X_train, y_train)

# y_pred = clf.predict(X_test)

# print(confusion_matrix(y_test, y_pred))
# print(classification_report(y_test, y_pred))

# dump(clf, 'modelos/modelo_treinado.joblib')
# dump(vectorizer, 'vectorizer/vetorizer.joblib')





model = load("modelos/modelo_treinado.joblib")
vectorizer = load("vectorizer/vetorizer.joblib")

senha_teste = 'coxinhade_frango'

X_nova = vectorizer.transform([senha_teste])

classe_predita = model.predict(X_nova)

print(f'A classificação da senha "{senha_teste}" é: {classe_predita[0]}')

