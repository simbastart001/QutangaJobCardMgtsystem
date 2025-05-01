# Qutanga Job Card Management System

A cross-platform mobile app built with **Flutter** to streamline job card management, task tracking, stock management, and reporting for workshop and service-based businesses. The backend is powered by **Laravel**, with **MySQL** as the primary database.

## ✨ Features

- Customer registration and selection
- Job card creation and invoicing
- Product & inventory management
- Day-end reports & invoice history
- Offline-first support using local storage
- Firebase backup and syncing
- Animated splash screen and smooth navigation

---

## 🛠️ Tech Stack

### Frontend (Mobile)
- **Flutter 3.x**
- **Riverpod** for state management
- **Drift + SQLite** for local offline storage
- **Firebase** for remote backups (optional)
- **Jetpack-style UI** using custom widgets
- **Animated splash screen** and charts with `pie_chart`

### Backend
- **Laravel 10+**
- **MySQL** database
- **RESTful API**
- Laravel Passport or Sanctum for authentication (optional)
- File and image handling for job-related media

---

## 📱 Mobile Setup (Flutter)

1. **Clone the repo**
   ```bash
   git clone https://github.com/yourusername/qutanga_job_card_system.git
   cd qutanga_job_card_system
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Set up the launcher icon**
   > Customize app icon without showing it in the splash screen.
   ```bash
   flutter pub run flutter_launcher_icons
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

> Ensure that Android/iOS simulators or real devices are set up before running the app.

---

## 🖥️ Backend Setup (Laravel)

1. **Install Laravel**
   ```bash
   composer create-project laravel/laravel backend
   cd backend
   ```

2. **Set up `.env` file**
   Configure your DB credentials:
   ```env
   DB_CONNECTION=mysql
   DB_HOST=127.0.0.1
   DB_PORT=3306
   DB_DATABASE=qutanga_db
   DB_USERNAME=root
   DB_PASSWORD=yourpassword
   ```

3. **Run migrations**
   ```bash
   php artisan migrate
   ```

4. **Run the Laravel server**
   ```bash
   php artisan serve
   ```

5. **API Routes**
   Add API endpoints in `routes/api.php` for:
   - Job Cards
   - Customers
   - Products
   - Reports
   - User login/register (optional)

---

## 🔐 Authentication

- Use **Laravel Sanctum** or **Passport** for secure API access.
- Firebase Auth can also be integrated if needed for mobile authentication.

---

## 🔗 Folder Structure (Flutter)

```
lib/
├── data/               # Local DB & repositories
├── models/             # Data models
├── screens/            # UI screens
├── viewmodels/         # Business logic
├── widgets/            # Reusable components
├── main.dart           # Entry point
```

---

## 📦 Important Packages Used

| Package               | Purpose                                 |
|-----------------------|-----------------------------------------|
| flutter_riverpod      | State management                        |
| drift                 | Local database (SQLite ORM)             |
| sqlite3_flutter_libs  | SQLite support                          |
| intl                  | Date and currency formatting            |
| path_provider         | For database file access                |
| pie_chart             | Visual reports                          |
| flutter_launcher_icons| App icon generation                     |
| build_runner & drift_dev| Code generation for database         |

---

## 🚧 TODO

- [ ] Role-based user access
- [ ] Job-status workflows (pending, in progress, completed)
- [ ] Push notifications
- [ ] PDF invoice export
- [ ] Sync with Firebase when online

---

## 👨‍💻 Developer

**Simbarashe Marindwa**  
Lead Flutter Developer  
📧 dr.simbastarta@gmail.com  
🌍 Zimbabwe

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).
