# Weather App

## Overview
The Weather App is a beautifully designed iOS application built using Swift and SwiftUI. It fetches real-time weather data from the [OpenWeather API](https://openweathermap.org/api) to provide users with current weather conditions, temperature, and other related details for any city.

---

## Features
- **Real-time Weather Updates**: Fetches current weather information for any city.
- **User-Friendly Interface**: Clean and intuitive UI built with UIKit.
- **API Integration**: Utilizes OpenWeather API to ensure accurate and up-to-date information.
- **Dynamic Backgrounds**: Displays weather-specific backgrounds (e.g., sunny, rainy).

---

## Screenshots
<img src="/Weather/sample/Screenshot1.png" alt="Weather App Screenshot 1" width="400" height="600" />
<img src="/Weather/sample/Screenshot2.png" alt="Weather App Screenshot 2" width="400" height="600" />


---

## Prerequisites
- **Mac**: Running macOS with Xcode installed.
- **Xcode**: Version 14 or higher.
- **OpenWeather API Key**: Register on [OpenWeather](https://openweathermap.org/api) and generate an API key.

---

## How to Clone and Launch Locally
1. **Clone the Repository**
   Open Terminal and run the following command:
   ```bash
   git clone <repository-url>
   ```

2. **Navigate to the Project Directory**
   ```bash
   cd weather-app
   ```

3. **Open the Project in Xcode**
   ```bash
   open WeatherApp.xcodeproj
   ```

4. **Configure API Key**
   - Navigate to the `Constants.swift` file.
   - Replace `<YOUR_API_KEY>` with your OpenWeather API key.
     ```swift
     let apiKey = "<YOUR_API_KEY>"
     ```

5. **Build and Run**
   - Select your target device or simulator.
   - Press `Cmd + R` to build and run the application.

---

## Dependencies
This project uses native Swift libraries and SwiftUI. No additional dependencies are required.

---

## Acknowledgments
- [OpenWeather API](https://openweathermap.org/api) for providing the weather data. 
- [Apple Developer Documentation](https://developer.apple.com/documentation) for guidance on UIKit and Swift.

---

## Contact
For any inquiries or contributions, please reach out:
- **Developer**: Kumar Shashwat
- **Portfolio**: [shashwatt.in](https://shashwatt.in)
- **Email**: contact@shashwatt.in

