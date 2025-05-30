FROM python:slim-buster

# تثبيت جميع الاعتمادات النظامية المطلوبة
RUN apt-get update && apt-get install -y \
    git \
    curl \
    python3-dev \
    libffi-dev \
    libpq-dev \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# استنساخ المستودع
RUN git clone https://github.com/ZThon-Bot/ZTele.git /root/zlzl

# تحديد مجلد العمل
WORKDIR /root/zlzl

# تحديث pip وتثبيت المتطلبات
RUN python3 -m pip install --upgrade pip setuptools wheel
RUN pip3 install --no-cache-dir -r requirements.txt

# تثبيت إضافي للمكتبات التي قد تحتاجها
RUN pip3 install --no-cache-dir \
    heroku3==3.3.0 \
    psycopg2-binary \
    py-tgcalls==0.9.7

# تشغيل التطبيق
CMD ["python3", "-m", "zlzl"]
