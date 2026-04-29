<h1 align="center">🛒 QuickMart</h1>

<p align="center">
  A fully-featured e-commerce mobile application built with Flutter
</p>

<p align="center">
  <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" />
  <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" />
  <img src="https://img.shields.io/badge/BLoC-purple?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Clean_Architecture-green?style=for-the-badge" />
</p>

---

## 📱 About

QuickMart is an e-commerce mobile app that allows users to browse products, manage their cart, and save their favorites — built with a focus on clean, scalable code using **Clean Architecture** and **BLoC** state management.

---

## ✨ Features

- 🔍 **Product Search** — Real-time search with filtering
- 🛒 **Shopping Cart** — Add, remove, and manage cart items
- ❤️ **Favorites** — Save favorite products locally using Hive
- 🌙 **Light & Dark Mode** — Theme toggle with saved user preference
- 📦 **Product Browsing** — Browse and view full product details

---

## 🛠️ Tech Stack

| Category | Technology |
|---|---|
| Framework | Flutter & Dart |
| State Management | BLoC / Cubit |
| Architecture | Clean Architecture (Data / Domain / Presentation) |
| Networking | Dio & Retrofit (REST API) |
| Local Database | Hive |
| Backend | Supabase |

---

## 🏗️ Architecture

This project follows **Clean Architecture** principles with three main layers:

```
lib/
├── core/               # Shared utilities, themes, constants
├── features/
│   └── products/
│       ├── data/       # Models, repositories impl, data sources
│       ├── domain/     # Entities, use cases, repository contracts
│       └── presentation/ # BLoC, pages, widgets
```

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK `>=3.0.0`
- Dart SDK `>=3.0.0`

### Installation

```bash
# Clone the repo
git clone https://github.com/HishamElnemr/QuickMart.git

# Navigate to project
cd QuickMart

# Install dependencies
flutter pub get

# Run the app
flutter run
```

---

## 📬 Contact

**Hisham Ahmed El-Nemr**
- LinkedIn: [linkedin.com/in/hishamelnemr](https://www.linkedin.com/in/hishamelnemr/)
- GitHub: [github.com/HishamElnemr](https://github.com/HishamElnemr)
- Email: hishammelnmr@gmail.com
