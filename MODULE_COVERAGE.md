# News App - Module Coverage Documentation

## Pengenalan
News App adalah aplikasi Flutter yang mendemonstrasikan konsep-konsep penting dari Modul III (State & Data Management) dan Modul IV (Navigation). Aplikasi ini dirancang untuk memudahkan penyesuaian dengan soal kuis karena semua bagian yang berkaitan dengan model data sudah ditandai dengan komentar `// GANTI:`.

---

## 📚 MODUL III - STATE & DATA MANAGEMENT

### Konsep Utama
Modul III mengajarkan bagaimana membuat struktur data, mengelola state, dan menggunakan lifecycle StatefulWidget dalam Flutter.

### Implementasi di News App

#### 1. **Model Class (Data Structure)**
**File:** `lib/models/news_model.dart`

```dart
class NewsModel {
  final String title;      // GANTI: Property ini akan diubah sesuai soal
  final String image;      // GANTI: Property ini akan diubah sesuai soal
  final String description; // GANTI: Property ini akan diubah sesuai soal
  final int likes;         // GANTI: Property ini akan diubah sesuai soal
  
  NewsModel({
    required this.title,
    required this.image,
    required this.description,
    required this.likes,
  });
}
```

**Pembelajaran:**
- Membuat class untuk merepresentasikan data
- Menggunakan `final` untuk immutable data
- Menggunakan `required` parameter untuk data integrity

#### 2. **Data Initialization**
**File:** `lib/models/news_model.dart`

```dart
List<NewsModel> newsList = [
  NewsModel(
    title: "SpaceX Meluncurkan Roket Terbaru",
    image: "https://...",
    description: "...",
    likes: 150,
  ),
  // Data lainnya...
];
```

**Pembelajaran:**
- Cara membuat instance dari model class
- Mengisi property dengan data yang sesuai
- Menyimpan multiple objects dalam List

#### 3. **StatefulWidget - Data Binding**
**File:** `lib/screen/detail_page.dart`

```dart
class _DetailPageState extends State<DetailPage> {
  late int likeCount;
  
  @override
  void initState() {
    super.initState();
    likeCount = widget.news.likes; // Mengakses property dari model
  }
}
```

**Pembelajaran:**
- Mengakses property model melalui `widget.news`
- Menginisialisasi state dari data model
- Lifecycle method `initState()`

#### 4. **State Management dengan setState()**
**File:** `lib/screen/detail_page.dart`

```dart
GestureDetector(
  onTap: () {
    setState(() {
      isLiked = !isLiked;
      if (isLiked) {
        likeCount++;
      } else {
        likeCount--;
      }
    });
  },
  child: Icon(
    isLiked ? Icons.favorite : Icons.favorite_border,
    color: isLiked ? Colors.red : Colors.grey,
  ),
)
```

**Pembelajaran:**
- Menggunakan `setState()` untuk update state dan rebuild UI
- UI yang responsive terhadap perubahan state
- Conditional rendering berdasarkan state

#### 5. **Data Display dari Model**
**File:** `lib/screen/news_list_page.dart`

```dart
ListView.builder(
  itemCount: newsList.length,
  itemBuilder: (context, index) {
    return Text(newsList[index].title);    // GANTI: Property title
    Image.network(newsList[index].image);  // GANTI: Property image
  },
)
```

**Pembelajaran:**
- Menampilkan data model dalam ListView
- Akses property model dari list
- Dynamic UI berdasarkan data count

---

## 🗺️ MODUL IV - NAVIGATION

### Konsep Utama
Modul IV mengajarkan bagaimana membuat multi-page app dengan proper navigation flow dan parameter passing antar halaman.

### Navigation Flow Architecture

```
LoginPage 
    ↓ (pushReplacement)
NewsListPage
    ├─ → DetailPage (push)
    ├─ → ProfilePage (push)
    └─ → LoginPage (pushReplacement) [logout]
```

### Implementasi di News App

#### 1. **Named Routes & Entry Point**
**File:** `lib/main.dart`

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(), // Route awal aplikasi
    );
  }
}
```

**Pembelajaran:**
- Menentukan halaman pertama aplikasi
- MaterialApp sebagai root widget
- Navigation context

#### 2. **Basic Navigation - push()**
**File:** `lib/screen/news_list_page.dart`

```dart
// Navigasi ke DetailPage
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetailPage(news: newsList[index]),
  ),
);

// Navigasi ke ProfilePage
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ProfilePage(username: username),
  ),
);
```

**Pembelajaran:**
- `Navigator.push()` menambah halaman ke navigation stack
- User bisa kembali menggunakan back button
- Material vs Cupertino routes
- Building widget on-demand di `builder`

#### 3. **Replace Navigation - pushReplacement()**
**File:** `lib/screen/login_page.dart` & `lib/screen/news_list_page.dart`

```dart
// Login - replace LoginPage dengan NewsListPage
Navigator.pushReplacement(
  context,
  MaterialPageRoute(
    builder: (context) => NewsListPage(username: userC.text),
  ),
);

// Logout - replace NewsListPage dengan LoginPage
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => const LoginPage()),
);
```

**Pembelajaran:**
- `pushReplacement()` mengganti halaman current tanpa menyimpan history
- User tidak bisa back ke halaman sebelumnya
- Cocok untuk authentication flow
- Cocok untuk logout operation

#### 4. **Pop Navigation - pop()**
**File:** `lib/screen/detail_page.dart` & `lib/screen/profile_page.dart`

```dart
IconButton(
  icon: const Icon(Icons.arrow_back),
  onPressed: () => Navigator.pop(context),
)
```

**Pembelajaran:**
- `Navigator.pop()` kembali ke halaman sebelumnya
- Menghapus halaman current dari navigation stack
- Digunakan untuk back button

#### 5. **Parameter Passing Antar Halaman**
**File:** Semua screen files

```dart
// Dari NewsListPage → DetailPage
DetailPage(news: newsList[index])

// Dari NewsListPage → ProfilePage  
ProfilePage(username: username)

// Dari LoginPage → NewsListPage
NewsListPage(username: userC.text)
```

**Pembelajaran:**
- Passing object/data melalui constructor
- Named parameters untuk clarity
- Widget harus menerima required parameter

#### 6. **Navigation Context**
**File:** Semua screen files dengan `Navigator.*`

```dart
// Context diperlukan untuk navigation
Navigator.push(context, ...)
Navigator.pop(context)
```

**Pembelajaran:**
- `BuildContext` adalah necessary untuk navigation
- Context harus dari widget yang ingin navigate
- Perbedaan context scope

---

## 📁 File Structure dan Penjelasan

```
lib/
├── main.dart
│   └── Entry point aplikasi, konfigurasi MaterialApp
│
├── models/
│   └── news_model.dart
│       ├── NewsModel class (GANTI untuk soal kuis)
│       └── newsList data (GANTI untuk soal kuis)
│
└── screen/
    ├── login_page.dart
    │   ├── StatefulWidget untuk form input
    │   ├── Validasi input (Modul III)
    │   └── pushReplacement ke NewsListPage (Modul IV)
    │
    ├── news_list_page.dart
    │   ├── ListView.builder untuk display data model
    │   ├── Akses property dari newsList[index]
    │   └── push() ke DetailPage dan ProfilePage
    │
    ├── detail_page.dart
    │   ├── StatefulWidget untuk like functionality
    │   ├── initState() dan setState() lifecycle
    │   ├── Menerima NewsModel object dari NewsListPage
    │   └── pop() untuk back button
    │
    └── profile_page.dart
        ├── Menerima username parameter
        └── pushReplacement() untuk logout
```

---

## 🎯 Checklist Pembelajaran

### Modul III - State & Data
- [x] Membuat Model class dengan multiple properties
- [x] Membuat List dari model objects
- [x] Mengakses property dari model dalam UI
- [x] StatefulWidget untuk state management
- [x] initState() lifecycle method
- [x] setState() untuk update state
- [x] Conditional UI rendering berdasarkan state

### Modul IV - Navigation
- [x] Entry point aplikasi (home route)
- [x] Navigator.push() untuk halaman baru
- [x] Navigator.pushReplacement() untuk replace halaman
- [x] Navigator.pop() untuk back
- [x] Parameter passing antar halaman
- [x] Material Route vs basic routing
- [x] Back button functionality
- [x] Navigation flow/stack understanding

---

## 🔄 Untuk Soal Kuis

Ketika mengerjakan soal kuis, Anda perlu mengubah:

1. **Model Class** (`lib/models/news_model.dart`)
   - Ubah property sesuai yang diminta soal
   - Ubah constructor
   - Ubah data initialization

2. **Semua referensi property** (ditandai dengan `// GANTI:`)
   - `newsList[index].title` → sesuai property baru
   - `widget.news.image` → sesuai property baru
   - Dan seterusnya di semua file

3. **Data** (`lib/models/news_model.dart`)
   - Ubah nilai-nilai dalam `newsList` sesuai soal

4. **Validation Logic** (jika diperlukan)
   - Update validasi di `login_page.dart` jika soal mengubah requirement

**Tips:** 
- Gunakan Find & Replace untuk mengganti referensi property
- Pastikan semua bagian yang di-GANTI sudah berubah
- Test di emulator setelah perubahan
- Periksa console untuk error messages

---

## ✅ Verifikasi Implementasi

Pastikan implementasi mencakup:

1. ✅ Model data struktur yang jelas
2. ✅ State management dengan StatefulWidget
3. ✅ Navigation flow: Login → News List → Detail/Profile
4. ✅ Parameter passing antar halaman
5. ✅ Proper use of push/pushReplacement/pop
6. ✅ Data binding dari model ke UI
7. ✅ Dynamic UI berdasarkan state changes
8. ✅ User interaction handling (likes, navigation, etc)

---

**Terakhir diupdate:** Sekarang
**Status:** Siap untuk soal kuis
