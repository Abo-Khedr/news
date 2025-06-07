# 📰 News App

A modern and responsive news application that fetches the latest articles using a News API.  
Users can browse articles by different **categories**, view full article details, and optionally open the source in an external browser.

---

## ✨ Features

- 🌐 Fetches news articles dynamically from a public API
- 🗂️ Browse articles by multiple categories (e.g., Technology, Sports, Health, Business, etc.)
- 📄 View full article details on a separate screen
- 🌍 Option to open the article in an external browser
- ⚡ Fast and minimal user interface
- 🎨 Clean design optimized for usability

---

## 🚀 How to Run

> The app runs on an **Android Emulator** (or physical device) using **Android Studio**.

1. Clone the repository to your local machine.
2. Open the project in **Android Studio**.
3. Insert your News API key in the relevant config file.
4. Launch the **Android Emulator**.
5. Click **Run** to build and start the app.

---

## 🔧 Requirements

- Android Studio
- Android Emulator or real device
- News API key (e.g., from [newsapi.org](https://newsapi.org))

---

## 🔑 API Key Setup

Before running the app, make sure to:

1. Sign up at [newsapi.org](https://newsapi.org) or another news provider.
2. Generate your API key.
3. Add your API key into the app’s configuration file (e.g., `constants.dart`, `.env`, or directly in code – based on implementation).

---

## 📁 App Flow

- Home Screen: Lists categories.
- On category click: Fetch and display articles under that category.
- On article click: Navigate to details screen showing full info.
- Option to click "Open in Browser" to launch external news source.
