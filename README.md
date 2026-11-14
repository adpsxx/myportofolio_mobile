# myportofolio_mobile

## Deskripsi
Aplikasi ini adalah aplikasi mobile portofolio personal berbasis Flutter. Aplikasi ini dirancang untuk menampilkan identitas pemilik portofolio beserta akses menu menuju fitur-fitur portofolio seperti proyek, experience, tautan ke portofolio web.

Aplikasi ini menerapkan konsep komposisi widget dan declarative UI dengan memisahkan entry point aplikasi (lib/main.dart) dan halaman menu utama (lib/menu.dart) berbasis StatelessWidget serta menggunakan theme Material 3. Interface utama tersusun atas komponen modular berupa InfoCard untuk menampilkan identitas pemilik portofolio, serta umpan balik interaktif menggunakan SnackBar.

## Project Structure
```text
myportofolio_mobile/
├── android/                # Konfigurasi Android
├── ios/                    # Konfigurasi iOS
├── linux/                  # Konfigurasi build untuk Linux
├── macos/                  # Konfigurasi build macOS
├── web/                    # Aset dan konfigurasi untuk Web
├── windows/                # Konfigurasi build Windows
├── lib/
│   ├── main.dart           # Entry point aplikasi dan konfigurasi MaterialApp/theme
│   └── menu.dart           # Main page
├── test/
│   └── widget_test.dart    # Test
├── analysis_options.yaml   # Aturan linting dan analisis statis
├── pubspec.yaml            # Metadata proyek dan daftar dependensi/aset
└── README.md               # Dokumentasi proyek, setup, dan jawaban tugas
```

## Setup Instruction
1. Unduh `Flutter SDK` sesuai sistem operasi melalui halaman resmi: [Install Flutter](https://docs.flutter.dev/get-started/install)
2. Ekstrak arsip Flutter SDK ke direktori yang diinginkan
3. Tambahkan direktori `flutter/bin` ke environment variable **`PATH`** agar perintah `flutter` dan `dart` dapat diakses dari terminal.
5. Verifikasi instalasi dengan menjalankan perintah berikut di terminal:
   ```bash
   flutter doctor
   ```
   Jika terdapat lisensi Android yang belum disetujui, jalankan:
   ```bash
   flutter doctor --android-licenses
   ```
6. Clone repositori lalu masuk ke direktori proyek:
   ```bash
   git clone https://github.com/adpsxx/myportofolio_mobile.git
   cd myportofolio_mobile
   ```
7. Unduh seluruh dependensi proyek:
   ```bash
   flutter pub get
   ```
8. Pastikan tidak ada error atau peringatan pada kode:
   ```bash
   flutter analyze
   ```
9. Cek perangkat/emulator yang tersedia:
   ```bash
   flutter devices
   ```
10. Jalankan aplikasi pada emulator, perangkat fisik, atau browser yang tersedia:
   ```bash
   flutter run
   ```
