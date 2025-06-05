#!/bin/bash

echo "🚀 بدء إعداد بيئة Flutter Web..."

# 1. تحميل Flutter إذا لم يكن موجود
if [ ! -d "flutter" ]; then
  echo "📦 جاري تحميل Flutter..."
    git clone https://github.com/flutter/flutter.git -b stable
    fi

    # 2. إعداد PATH مؤقتًا
    export PATH="$PATH:`pwd`/flutter/bin"

    # 3. التحقق من Flutter
    flutter --version || { echo "❌ فشل في تشغيل Flutter"; exit 1; }

    # 4. دخول مجلد المشروع
    cd talkgram_project_folder || { echo "❌ مجلد المشروع غير موجود"; exit 1; }

    # 5. جلب الحزم
    echo "📦 flutter pub get..."
    flutter pub get

    # 6. بناء مشروع الويب
    echo "🛠️ flutter build web..."
    flutter build web

    # 7. تجربة عدة منافذ
    PORTS=(8000 8080 5000)
    for PORT in "${PORTS[@]}"; do
        echo "🔍 محاولة تشغيل على المنفذ $PORT..."
            if ! lsof -i :$PORT &>/dev/null; then
                    echo "✅ جاري تشغيل السيرفر على http://localhost:$PORT"
                            echo "🌐 افتح في GitHub Codespace:"
                                    echo "👉 https://$(hostname)-$PORT.github.dev/"
                                            python3 -m http.server $PORT -d build/web
                                                    break
                                                        else
                                                                echo "❌ المنفذ $PORT مستخدم، سيتم تجربة غيره..."
                                                                    fi
                                                                    done