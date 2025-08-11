FROM cirrusci/flutter:stable

WORKDIR /app

# Copy pubspec files
COPY pubspec.yaml pubspec.lock ./

# Get dependencies
RUN flutter pub get

# Copy source code
COPY . .

# Build APK
RUN flutter build apk --release

# Create output directory
RUN mkdir -p /output

# Copy APK to output
RUN cp build/app/outputs/flutter-apk/app-release.apk /output/test-scanner.apk

# Set volume for output
VOLUME /output

CMD ["echo", "APK built successfully! Check /output/test-scanner.apk"]
