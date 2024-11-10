from django.apps import AppConfig
from joblib import load
import os


class ApiRestConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'api_rest'

    def ready(self):
            base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
            model_path = os.path.join(base_dir, "api_rest/ml/modelos/modelo_treinado.joblib")
            vectorizer_path = os.path.join(base_dir, "api_rest/ml/vectorizer/vetorizer.joblib")

            # Carregar o modelo e o vectorizer uma vez
            ApiRestConfig.model = load(model_path)
            ApiRestConfig.vectorizer = load(vectorizer_path)