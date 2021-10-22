FROM python:3.9.0-slim

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip3 install --no-cache-dir -r requirements.txt

COPY web.py .
COPY conf/web.conf .

ENTRYPOINT ["python3"]
CMD ["web.py"]