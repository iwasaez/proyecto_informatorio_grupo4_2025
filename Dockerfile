# 1. ESPECIFICA LA VERSIÓN EXACTA DE PYTHON (3.8.10)
FROM python:3.8.10-slim

# 2. Configura algunas opciones de Python
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# 3. Crea la carpeta de trabajo dentro del servidor
WORKDIR /usr/src/app

# 4. Copia el archivo de requisitos e instala todas las librerías
COPY requirements.txt /usr/src/app/
RUN pip install -r requirements.txt

# 5. Copia todo tu código al servidor
COPY . /usr/src/app/

# 6. Render recomienda exponer el puerto 8000
EXPOSE 8000 

# 7. EJECUTA Gunicorn con el puerto dinámico de Render
# **IMPORTANTE:** Reemplaza 'django_proyect' con el nombre de tu carpeta de settings si es diferente.
CMD ["gunicorn", "django_proyect.wsgi:application", "--bind", "0.0.0.0", "--env", "PORT=${PORT:-8000}"]