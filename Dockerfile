# 첫 번째 스테이지: 빌드
FROM gradle:jdk21-graal-jammy AS builder

WORKDIR /app

# Gradle 관련 모든 파일 복사
COPY gradlew ./
COPY gradle gradle
COPY build.gradle ./
COPY settings.gradle ./
COPY gradle/wrapper gradle/wrapper
COPY src src

# Gradle 래퍼 실행 권한 부여 및 빌드
RUN chmod +x gradlew && ./gradlew build --no-daemon

# 두 번째 스테이지: 실행
FROM openjdk:21-jdk-slim

WORKDIR /app

# 빌드된 JAR 파일 복사
COPY --from=builder /app/build/libs/*.jar app.jar

# JAR 파일 실행
CMD ["java", "-jar", "-Dspring.profiles.active=prod", "/app/app.jar"]
