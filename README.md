
# Stopwatch App ⏱️

A simple and precise stopwatch app built using **Flutter & Dart**, featuring real-time time tracking (minutes, seconds, milliseconds), smooth UI transitions, and essential control buttons — start, stop, and reset. This project was developed as part of my internship at **Prodigy InfoTech**.

---

## 🚀 Features

- ⏯️ **Start / Stop toggle** button with dynamic icon change (Play ↔ Pause)
- 🔁 **Reset** button that clears the time and halts the stopwatch
- ⏱️ **Real-time time tracking** with minutes, seconds, and hundredths of a second
- ⚙️ **Accurate Timer** using `Timer.periodic` with 100ms interval
- ✨ **Animated opacity** to indicate running/paused state visually
- 🎯 **Haptic feedback** on button interaction for a tactile experience
- 🎨 **Circular progress indicator** behind timer for visual depth
- 🧱 **Reusable Button widget** for clean and consistent UI
- 🧼 **Minimalistic design** with responsive layout and clean structure

---

## 📁 Project Structure

```

lib/
├── main.dart            # App entry point
├── MainPage.dart        # Stopwatch UI and logic
└── Button.dart          # Reusable styled TextButton widget

````

---

## 🛠️ Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) installed
- Dart SDK (comes with Flutter)

### Run Locally

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/stopwatch_app.git
   cd stopwatch_app
````

2. **Install dependencies**:

   ```bash
   flutter pub get
   ```

3. **Run the app**:

   ```bash
   flutter run
   ```

---
```

## 🎓 What I Learned

* How to use `Timer.periodic()` for real-time updates
* Managing UI efficiently with `setState()` and selective updates
* Writing modular and reusable UI components
* Handling layout responsiveness with `MediaQuery`
* Adding UX polish with animations and feedback

---

## 📌 Future Enhancements (Ideas)

* Lap timer functionality
* Save previous session times
* Countdown timer mode
* Theme toggle (dark/light)
* Persistent state using SharedPreferences

---

## 🙌 Acknowledgements

Thanks to **Prodigy InfoTech** for the opportunity to work on this project and keep learning hands-on.

---


> Made with ❤️ using Flutter


