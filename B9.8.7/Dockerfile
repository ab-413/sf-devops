FROM python:3.9.0-slim
WORKDIR /app
COPY . .
RUN pip3 install --no-cache-dir -r requirements.txt

ENTRYPOINT ["python3", "get_favicon.py"]
CMD ["-h"]