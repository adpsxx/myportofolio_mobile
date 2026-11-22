# myportofolio_mobile

## Deskripsi
Aplikasi ini adalah aplikasi mobile portofolio personal berbasis Flutter. Aplikasi ini dirancang untuk menampilkan identitas pemilik portofolio beserta akses menu menuju fitur-fitur portofolio seperti proyek, experience, tautan ke portofolio web.

Aplikasi ini menerapkan konsep komposisi widget dan declarative UI dengan memisahkan entry point aplikasi (lib/main.dart) dan halaman menu utama (lib/menu.dart) berbasis StatelessWidget serta menggunakan theme Material 3. Interface utama tersusun atas komponen modular berupa InfoCard untuk menampilkan identitas pemilik portofolio, serta umpan balik interaktif menggunakan SnackBar.

## Project Structure
```text
myportofolio_mobile/
├── android/                            # Konfigurasi Android
├── ios/                                # Konfigurasi iOS
├── linux/                              # Konfigurasi build untuk Linux
├── macos/                              # Konfigurasi build macOS
├── web/                                # Aset dan konfigurasi untuk Web
├── windows/                            # Konfigurasi build Windows
├── lib/
│   ├── main.dart                       # Entry point aplikasi dan konfigurasi MaterialApp/theme
│   ├── screens/
│   │   ├── menu.dart                   # Halaman menu utama portofolio
│   │   ├── project_form.dart           # Halaman formulir tambah proyek
│   │   └── experience_form.dart        # Halaman formulir tambah experience
│   └── widgets/
│       ├── left_drawer.dart            # Komponen drawer navigasi antarhalaman
│       └── project_card.dart           # Komponen kartu aksi menu (ItemCard)
├── test/
│   └── widget_test.dart                # Test
├── analysis_options.yaml               # Aturan linting dan analisis statis
├── chat_log.md                         # Log percakapan AI (AI disclosure)
├── pubspec.yaml                        # Metadata proyek dan daftar dependensi/aset
└── README.md                           # Dokumentasi proyek, setup, dan jawaban tugas
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

### Week 2
- Add form for both experience and project.
- Add navigation option from main menu screen and side drawer.

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

### Tugas 8
#### 1. Jelaskan perbedaan antara Navigator.push(), Navigator.pushReplacement(), dan Navigator.pop(). Metode apa yang digunakan untuk membuka formulir dari kartu aksi? Jelaskan juga bagaimana opsi Home di drawer membawa pengguna kembali ke halaman utama.
`Navigator.push()` menambahkan halaman baru kebagian atas stack pada aplikasi tanpa menghapus halaman sebelumnya. 
`Navigator.pushReplacement()` mengganti halaman yang sedang aktif dengan halaman baru, sehingga halaman lama dihapus dari memori dan user tidak bisa kembali pada halaman tersebut dengan menggunakan back.
`Navigator.pop()` menghapus halaman yang sedang aktif lalu kembali menuju halaman sebelumnya.

Untuk membuka form pada aplikasi ini, metode yang digunakan adalah menggunakan `Navigator.push()`, sehingga aplikasi menambahkan halaman formulir tersebut ke atas stack. Ketika opsi Home ditekan dari drawer, aplikasi akan mengembalikan tampilan ke halaman utama dikarenakan menggunakan `Navigator.pushReplacement()`. Aplikasi menukar halaman yang sekarang dibuka dengan halaman utama sehingga halaman utama akan ditampilkan pada user.

#### 2. Bagaimana susunan Scaffold, AppBar, dan Drawer membantu menjaga struktur halaman tetap konsisten? Berikan satu contoh penggunaan warna tema portofolio di lebih dari satu halaman?
Scaffold menyediakan kerangka susunan utama untuk aplikasi agar selalu konsisten. AppBar berada pada bagian atas aplikasi untuk menjaga konsistensi agar selalu menampilkan judul dan menu Drawer. Drawer membuat alur navigasi antar halaman menjadi tetap konsisten dan tidak bergantung dengan isi dari halaman.

Salah satu penggunaan warna tema portofolio adalah penggunaan warna Indigo yang diturunkan dari theme pada `main.dart`. Pada halaman form untuk save button (experience dan project) dan juga bagian AppBar, digunakan warna background menggunakan `Theme.of(context).colorScheme.primary`, sehingga warna akan sama dengan warna Indigo yang sudah diatur pada `main.dart` tersebut.

#### 3. Mengapa tata letak tersebut dipilih untuk formulir? Jelaskan peran widget pengatur jarak dan widget penggulir ketika ruang layar terbatas.
Pada `project_form` dan `experience_form`, form disusun vertikal menggunakan `Column(crossAxisAlignment: CrossAxisAlignment.start)`. Form disusun vertikal agar dapat dibaca dengan mudah pada Handphone dan mudah diisi oleh user. 

Widget pengatur jarak yang digunakan adalah `SizedBox` dan `Padding`. `Padding` digunakan untuk memberikan jarak antar field input agar tidak saling menempel dan menjadi rapi. `SizedBox` digunakan untuk memberikan jarak antar button cancel dan save agar tidak menempel dan menjaga kerapihannya.

Widget pengulir yang digunakan adalah `SingleChildScrollView`. Widget tersebut berperan agar isi dan masing-masing dari field pada form masih dapat discroll ketika ukuran layar mengecil diakibatkan keyboard yang terbuka.

#### 4. Apa peran GlobalKey<FormState>, validator, dan validate() saat tombol Simpan ditekan? Berikan satu contoh nilai yang ditolak oleh validasi dan jelaskan mengapa memilih jenis input atau papan ketik saja belum cukup.
`GlobalKey<FormState>` digunakan untuk mengakses state milik widget Form, sehingga aksi seperti validasi dan reset dapat dipicu dari tombol Save saat ditekan.
`validator` merupakan fungsi pada tiap TextFormField yang memeriksa nilai input. Fungsi tersebut akan mengembalikan pesan error jika tidak memenuhi aturan atau null jika input yang dimasukkan sudah valid.
`validate()` mengeksekusi semua validator di dalam Form. Jika semua valid, AlertDialog konfirmasi akan ditampilkan. Jika ada yang gagal, proses dihentikan dan pesan error ditampilkan pada field terkait tersebut.

Contoh nilai yang ditolak pada validasi:
Mengisi string kosong pada Nama Proyek / Deskripsi Proyek akan ditolak oleh value.trim().isEmpty dengan pesan "Nama proyek tidak boleh kosong!".

Properti seperti keyboardType: TextInputType.url hanya mengatur tata letak tombol pada keyboard agar user dapat dengan lebih mudah mengetikknya. User tetap bisa mengetik text yang tidak valid. Karena itu, validasi logika melalui validator tetap diperlukan untuk menjamin data benar-benar sesuai aturan sebelum diproses.

## AI DISCLOSURE
### Week 1
Pada pekan ini, penggunaaan AI yang saya lakukan hanya untuk bagian README.md dimana saya meminta AI untuk mengecek dan memastikan apakah project setup yang sudah saya masukkan benar. AI hanya saya gunakan sebagai metode untuk memvalidasi hal yang sudah saya buat.

Model: ChatGPT Luna 5.6
chat log: ./chat_log.md

### Week 2
Pada pekan ini, penggunaan AI yang saya gunakan dipergunakan untuk bagian halaman project dan experience form. Saya meminta bantuan AI untuk memastikan masing-masing field yang digunakan pada form tersebut sesuai dengan yang sudah saya buat pada versi web saya. Selain itu, saya juga meminta AI untuk mengecek bagian tugas yang sudah saya kerjakan dan yang belum saya kerjakan juga.

Model: Gemini 4 Neon
chat log: ./chat_log.md

### Strategi Prompting
Saya membuat kode saya secara mandiri terlebih dahulu, lalu meminta AI untuk mereviewnya secara bertahap.

Tidak semua saran/hasil AI langsung saya terapkan. Saya tetap menyesuaikan program saya berdasarkan keinginan saya sendiri.