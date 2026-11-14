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
4. Verifikasi instalasi dengan menjalankan perintah berikut di terminal:
   ```bash
   flutter doctor
   ```
   Jika terdapat lisensi Android yang belum disetujui, jalankan:
   ```bash
   flutter doctor --android-licenses
   ```
5. Clone repositori lalu masuk ke direktori proyek:
   ```bash
   git clone https://github.com/adpsxx/myportofolio_mobile.git
   cd myportofolio_mobile
   ```
6. Unduh seluruh dependensi proyek:
   ```bash
   flutter pub get
   ```
7. Pastikan tidak ada error atau peringatan pada kode:
   ```bash
   flutter analyze
   ```
8. Cek perangkat/emulator yang tersedia:
   ```bash
   flutter devices
   ```
9. Jalankan aplikasi pada emulator, perangkat fisik, atau browser yang tersedia:
   ```bash
   flutter run
   ```

## Weekly Progress
### Week 1
- Setup Flutter project dan Git.
- Membuat page main menu.
- Menambahkan ItemCard dan styling untuk masing-masing card tersebut.

## Pertanyaan Reflektif
### Tugas 7
#### 1. Jelaskan apa yang dimaksud dengan widget tree pada Flutter dan bagaimana hubungan induk-anak (parent-child) bekerja antar-widget!
Pada Flutter, widget tree adalah sebuah struktur hierarkikal dari widgets yang membangun sebuah interface aplikasi Flutter tersebut. Di dalam Flutter, hampir semua elemen visual disebut sebagai widget. Ketika aplikasi dijalankan, Flutter membaca struktur widget dan merendernya.

Hubungan parent-child mengatur bagaimana layout, ukuran, dan posisi setiap elemen ditampilkan pada layar. Parent widget adalah widget yang membungkus atau memiliki widget lain didalamnya, sedangkan child widget adalah widget yang dibungkus oleh parent widget tersebut.

#### 2. Sebutkan semua widget yang kamu gunakan dalam proyek ini dan jelaskan fungsinya masing-masing!
- Scaffold: Menyediakan struktur tata letak visual pada page.
- AppBar: Menampilkan judul pada bagian atas aplikasi.
- Padding: Memberikan jarak di sekeliling child widget.
- Column: Menyusun widget secara vertikal.
- Row: Menyusun widget secara horizontal.
- SizedBox: Memberikan ruang kosong/pemisah antar widget.
- Center: Memposisikan child widget di tengah.
- Text: Menampilkan text yang ingin ditampilkan.
- GridView: Menyusun card dalam grid.
- Card: Membuat wadah berbentuk kartu.
- Container: Wadah untuk mengatur lebar.
- InkWell: Memberikan interaktifitas saat disentuh.
- Icon: Menampilkan logo/icon.
- SnackBar: Menampilkan pesan saat ItemCard disentuh.
- MyApp: Widget root aplikasi.
- MyHomepage: Widget main page.
- InfoCard: Kartu yang menampilkan NPM, Nama, Kelas.
- ItemCard: Menampilkan masing-masing card untuk tombol menu.
- MaterialApp: Widget root yang menyediakan konfigurasi aplikasi Material Design
- Material: Memberikan permukaan Material Design

#### 3. Apa fungsi dari widget MaterialApp? Jelaskan mengapa widget ini umumnya digunakan sebagai root widget pada aplikasi Flutter!
Widget MaterialApp berfungsi sebagai wrapper utama Flutter yang menggunakan Material Design. Widget tersebut mengelola banyak hal seperti tema, sistem navigasi, dan lain-lain. 

MaterialApp sering diletakkan sebagai root widget dikarenakan hampir seluruh widget pada aplikasi Flutter bergantung pada context yang disediakan oleh widget MateriapApp. Jika ada widget yang dipasang di luar MaterialApp, aplikasi akan mengalami error karena tidak menemukan context yang sesuai.

#### 4. Jelaskan perbedaan antara StatelessWidget dan StatefulWidget! Kapan kita sebaiknya memilih StatelessWidget dan kapan harus menggunakan StatefulWidget?
StatelessWidget adalah widget yang tidak memiliki state yang akan berubah. Widget ini hanya akan dibangun ulang ketika parameter dari parentnya berubah. StatelessWidget cocok digunakan pada tampilan UI yang bersifat statis.

StatefulWidget adalah widget yang memiliki objek State terpisah untuk menyimpan data dinamis yang dapat berubah selama aplikasi berjalan. StatefulWidget cocok digunakan pada widget yang harus mengubah tampilannya berdasarkan interaksi pengguna atau adanya suatu perubahan data.

#### 5. Apa itu BuildContext dan mengapa penting di Flutter? Bagaimana penggunaannya di dalam metode build?
BuildContext merepresentasikan lokasi sebuah widget di dalam widget tree. BuildContext penting agar widget dapat menelusuri widget tree untuk mengakses data parent-parent nya tanpa harus meneruskan data secara manual melalui parameter di setiap lapisan widget. 

Contoh penggunaan pada metode buildbuild(BuildContext context), kita dapat mengakses warna tema utama dari MaterialApp:
Theme.of(context).colorScheme.primary

#### 6. Jelaskan konsep hot reload di Flutter dan apa perbedaannya dengan hot restart! Kapan kita tidak bisa hanya mengandalkan hot reload dan harus melakukan hot restart atau full restart?
Hot Reload memasukkan perubahan kode Dart yang baru kedalam yang sedang berjalan lalu memanggil ulang metode build(). Hot Reload berlangsung cepat dan mempertahankan state aplikasi yang sedang aktif. Sedangkan, Hot Restart mengompilasi ulang kode Dart dan menjalankan ulang aplikasi, sehingga seluruh state aplikasi direset ke kondisi awal. 

Kita tidak bisa hanya menggunakan hot reload ketika kita merubah kode yang terjadi terletak pada main(), mengubah state, mengubah variable global, mengubah struktur tipe widget, atau saat mengubah/menambah dependensi pada program.

## AI DISCLOSURE
### Week 1
Pada pekan ini, penggunaaan AI yang saya lakukan hanya untuk bagian README.md dimana saya meminta AI untuk mengecek dan memastikan apakah project setup yang sudah saya masukkan benar. AI hanya saya gunakan sebagai metode untuk memvalidasi hal yang sudah saya buat.

Model: ChatGPT Luna 5.6
chat log: ./chat_log.md