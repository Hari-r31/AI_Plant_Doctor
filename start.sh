#!/bin/sh

# Install missing system dependencies
apt-get update && apt-get install -y libgl1-mesa-glx

# Start your app (example for Gunicorn)
gunicorn app:app --bind 0.0.0.0:8080
