FROM python:3.10-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /heroku_test_plantDisease

# Copy requirements first, install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all files (app code, model, etc.)
COPY . .
RUN ls -lh /app/my_model.h5

# Run the app with gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:8080", "app:app"]
