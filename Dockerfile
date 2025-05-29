FROM python:slim-buster

# تثبيت حزم النظام والمكتبات الأساسية
RUN apt-get update && apt-get install -y \
    git \
    curl \
    python3-dev \
    libffi-dev \
    && rm -rf /var/lib/apt/lists/*

# تحديث pip وتثبيت المتطلبات
RUN python3 -m pip install --upgrade pip
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# نسخ الكود المتبقي (إذا لزم الأمر)
COPY . /root/zlzl
WORKDIR /root/zlzl

# تشغيل التطبيق
CMD ["python3", "-m", "zlzl"]
