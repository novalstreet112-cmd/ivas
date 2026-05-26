FROM python:3.11-slim

WORKDIR /app

RUN apt-get update && apt-get install -y wget gnupg unzip curl && echo "clear cache 1" && wget -q -O /tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && apt-get install -y /tmp/chrome.deb && rm /tmp/chrome.deb

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY .

CMD ["python", "index.py"]
# rebuild 1
