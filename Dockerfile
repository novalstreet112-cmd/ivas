FROM python:3.11-slim

# Install Chrome + deps buat Selenium
RUN apt-get update && apt-get install -y wget gnupg unzip xvfb libxi6 libgconf-2-4
RUN wget -q -O - https://dl-ssl.google.com/linux_signing_key.pub | apt-key add - 
RUN echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
RUN apt-get update && apt-get install -y google-chrome-stable

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY .

# Set environment variables
ENV PORT=10000
ENV PYTHONUNBUFFERED=1

EXPOSE 10000

# Run the bot
CMD ["python", "index.py"]
