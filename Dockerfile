# =========================
# build stage
# =========================
FROM eclipse-temurin:17 AS build
WORKDIR /app

# Gradle関連ファイルをコピー
COPY gradlew .
COPY gradle gradle
COPY build.gradle settings.gradle ./

# ソースをコピー
COPY src src

# 実行権限 & ビルド
RUN chmod +x gradlew
RUN ./gradlew clean build -x test

# =========================
# runtime stage
# =========================
FROM eclipse-temurin:17
WORKDIR /app

# build stage から jar をコピー
COPY --from=build /app/build/libs/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]