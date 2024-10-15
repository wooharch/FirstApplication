# Step 1: Maven 빌드 단계
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app

# Maven 의존성 캐싱을 위해 먼저 pom.xml만 복사하여 의존성 설치
COPY pom.xml .
RUN mvn dependency:go-offline -B

# 나머지 소스 복사 및 애플리케이션 빌드
COPY src ./src
RUN mvn clean package -DskipTests

# Step 2: 실행 환경 이미지 생성 (JDK 17 Temurin 사용)
FROM eclipse-temurin:17-jdk AS runtime
WORKDIR /app

# 빌드 단계에서 생성된 JAR 파일 복사
COPY --from=build /app/target/*.jar app.jar

# 애플리케이션 실행
ENTRYPOINT ["java", "-jar", "app.jar"]

