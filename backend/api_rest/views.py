from django.shortcuts import render
from django.http import HttpResponse, JsonResponse
import os
from django.apps import apps

from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status

@api_view(['POST'])
def get_password_strength(request):
    if request.method == 'POST':
        passw = request.data.get('passw')
        
        if not passw:
            return Response({"error": "O campo 'passw' é obrigatório."}, status=status.HTTP_400_BAD_REQUEST)

        model = apps.get_app_config('api_rest').model
        vectorizer = apps.get_app_config('api_rest').vectorizer

        X_nova = vectorizer.transform([passw])
        classe_predita = model.predict(X_nova)

        return Response({"predicao": classe_predita[0]})
    
    return Response({"error": "Método não permitido"}, status=status.HTTP_405_METHOD_NOT_ALLOWED)