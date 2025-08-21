# Stage 1: build dependencies
FROM python:3.11-slim AS build

WORKDIR /app

# Install build tools
RUN apt-get update && apt-get install -y build-essential gcc && rm -rf /var/lib/apt/lists/*

# Copy dependency list
COPY requirements.txt .

# Install into /install dir
RUN pip install --prefix=/install -r requirements.txt

# Stage 2: runtime
FROM python:3.11-slim

WORKDIR /app

# Copy app code
COPY . .

# Run your Python app (adjust main.py as needed)
CMD ["python", "main.py"]