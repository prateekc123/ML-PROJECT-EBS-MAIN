# Use a lightweight Python base image
FROM python:3.10-slim

# Install system dependencies for AWS CLI
RUN apt-get update && \
    apt-get install -y curl unzip && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf awscliv2.zip aws

# Set working directory
WORKDIR /app

# Copy project files
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port if needed (e.g., Flask or FastAPI)
EXPOSE 5000

# Run your app (adjust entry point as needed)
CMD ["python", "app.py"]