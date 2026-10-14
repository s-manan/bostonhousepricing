FROM python:3.7

# Copy all project files into the /app directory inside the container
COPY . /app

# Set the working directory inside the container
WORKDIR /app

# Install all Python dependencies from requirements.txt
RUN pip install -r requirements.txt

# Expose port 8080 (standard for AWS services like App Runner, ECS, EC2)
EXPOSE 8080

# Start the Flask app using Gunicorn on port 8080
CMD ["gunicorn", "--workers=4", "--bind", "0.0.0.0:8080", "app:app"]