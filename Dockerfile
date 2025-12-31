# Lightweight stable Python image
FROM python:3.11-slim

# Set environment variables to prevent Python from writing .pyc files and buffering stdout/stderr
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Install only necessary dependencies
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir pandas openpyxl

# Set metadata labels for Docker Hub
LABEL org.opencontainers.image.title="Pandas with OpenPyXL"
LABEL org.opencontainers.image.description="A lightweight Python image optimized for Data Engineering tasks involving Excel and CSV manipulation."
LABEL org.opencontainers.image.authors="Abdulkadir GUVEN"
LABEL org.opencontainers.image.source="https://github.com/abguven/pandas-openpyxl"
LABEL org.opencontainers.image.version="1.0.0"


CMD ["python3"]