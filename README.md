<img width="655" height="333" alt="Screenshot 2026-01-21 at 12 39 22 AM" src="https://github.com/user-attachments/assets/68e817f6-152b-4cdc-9065-fa70d0379558" />
Glass# 🌤 Glasscast  
*A Minimal, Glass-Morphism Weather App built with SwiftUI*

Glasscast is a modern iOS weather application designed with Apple’s **Liquid Glass** aesthetic and built using **SwiftUI + MVVM**.  
The app demonstrates **AI-assisted development**, clean architecture, Supabase authentication, and cloud-synced favorite cities.

---

## ✨ Features

### 🔐 Authentication
- Email & password authentication via **Supabase**
- Secure session handling
- Clean, minimal login UI

### 🏠 Home
- Current weather for selected city
- Temperature, condition, high/low
- 5-day forecast cards
- Pull-to-refresh support

### 🔍 City Search
- Search cities via Weather API
- Save favorite cities to Supabase
- Favorites synced per user (RLS enabled)

### ⚙️ Settings
- Temperature unit toggle (°C / °F)
- Sign out
- Prepared for future preferences

---

## 🧊 UI & Design

- SwiftUI with **iOS 26 Liquid Glass**
- `.ultraThinMaterial`, translucency, blur & depth
- Smooth animations & transitions
- Dark-mode friendly
- Clean typography & spacing

Design created using **AI design tools (Google Stitch / Figma Make)**.

---

## 🧠 AI-Assisted Development

This project was built using **Claude Code** as the primary AI coding assistant.

### Demonstrated AI Workflow
- Prompting Claude to:
  - Design architecture (MVVM)
  - Generate SwiftUI views
  - Implement services & ViewModels
  - Debug async / concurrency issues
- Iterative prompting & refinement
- Human-guided decision making
- Handling AI mistakes and correcting logic

📄 See **`CLAUDE.md`** for full AI context and rules.

---

## 🏗 Architecture

- **MVVM**
- Clean separation of concerns
- Dependency injection via protocols
- Async/await networking
- MainActor-safe UI updates

