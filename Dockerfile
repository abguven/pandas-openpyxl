# Base image: Lightweight Python 3.11
FROM python:3.11-slim

# --- METADATA (OCI Labels) ---
LABEL org.opencontainers.image.title="Pandas & OpenPyXL"
LABEL org.opencontainers.image.description="Lightweight, secure Python image with Pandas and OpenPyXL for Data Engineering."
LABEL org.opencontainers.image.authors="Abdulkadir GUVEN"
LABEL org.opencontainers.image.source="https://github.com/abguven/pandas-openpyxl"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.version="1.1.0"

# Environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /app

# --- SECURITY: Create non-root user ---
# We create the user first, but we stay root to install packages
RUN useradd -m -u 1000 appuser

# Install dependencies
# We upgrade pip and install packages globally (as root) so they are available to everyone
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir pandas openpyxl

# --- PERMISSIONS ---
# We ensure the app user owns the work directory (useful for Kestra/Airflow mounts)
RUN chown -R appuser:appuser /app

# --- SWITCH USER ---
# Drop privileges
USER appuser

# Verify installation
RUN python3 -c "import pandas; print(f'Pandas {pandas.__version__} installed')"

CMD ["python3"]