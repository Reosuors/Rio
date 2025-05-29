FROM python:slim-buster

# Install dependencies
RUN apt-get update && apt-get install -y git curl \
    && rm -rf /var/lib/apt/lists/*

# Clone repo
RUN git clone https://github.com/ZThon-Bot/ZTele.git /root/zlzl

# Set working directory
WORKDIR /root/zlzl

# Install Python requirements
RUN pip3 install --no-cache-dir -r requirements.txt

# Run the application
CMD ["python3", "-m", "zlzl"]
