# 🌊 Riverpod State Management

<div align="center">

[![Flutter](https://img.shields.io/badge/Flutter-3.0+-blue?style=flat-square&logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.9.2+-green?style=flat-square&logo=dart)](https://dart.dev)
[![Riverpod](https://img.shields.io/badge/Riverpod-3.2.1+-orange?style=flat-square&logo=riverpod)](https://riverpod.dev)
[![License](https://img.shields.io/badge/License-MIT-purple?style=flat-square)](LICENSE)

**Complete Flutter Learning Project for Riverpod State Management** ✨

A comprehensive guide to understanding state management patterns in Flutter through 10 interactive lectures with real-world examples.

[Features](#-features) • [Lectures](#-lectures) • [Getting Started](#-getting-started) • [Decision Guide](#-decision-guide) • [Best Practices](#best-practices--decision-guide)

</div>

---

## 🎯 What This Project Contains

An interactive Flutter application with **10 lecture-based screens**, each demonstrating a different Riverpod state management pattern. Perfect for beginners and intermediate developers learning modern state management.

### 📚 Lecture Overview

| # | Lecture | Pattern | Complexity | Real-World Use |
|---|---------|---------|-----------|----------------|
| 1 | 🔄 Copy With Method | Immutable Updates | ⭐ Basic | Form updates, undo/redo |
| 2 | 📖 Simple Provider | Read-only Data | ⭐ Basic | App config, computed values |
| 3 | 🎚️ State Provider | Mutable Simple State | ⭐ Basic | Toggles, counters |
| 4 | 🎛️ Multiple State | One Model | ⭐⭐ Intermediate | Multi-field forms |
| 5 | 🔍 StateNotifierProvider | Complex Logic | ⭐⭐ Intermediate | Search, filters |
| 6 | ✅ Todo List | CRUD Operations | ⭐⭐ Intermediate | Task management |
| 7 | ❤️ Favorites | Advanced Filtering | ⭐⭐ Intermediate | Wishlist, bookmarks |
| 8 | ⏳ Future Provider | One-Time Async | ⭐⭐ Intermediate | API calls, data loading |
| 9 | 📊 Stream Provider | Live Updates | ⭐⭐⭐ Advanced | Real-time data, WebSocket |
| 10 | 🌐 API Integration | Real API Calls | ⭐⭐⭐ Advanced | REST API, JSON parsing |

---

## ✨ Features

- 🎓 **10 Interactive Lectures** - Each demonstrates a core Riverpod concept
- 💡 **Real-World Examples** - Practical use cases for each state management pattern
- 📱 **Dual Widget Approaches** - See how patterns work with both Consumer and ConsumerStateful widgets
- 🔌 **Complete Examples** - CRUD operations, API integration, real-time data
- 📖 **Comprehensive Documentation** - Detailed explanations and code patterns
- 🎯 **Decision Framework** - Know exactly which pattern to use when
- 🚀 **Production-Ready Patterns** - Learn industry best practices

---

## 🔧 Tech Stack

| Package | Version | Purpose |
|---------|---------|---------|
| **riverpod** | ^3.2.1 | Core state management |
| **flutter_riverpod** | ^3.3.1 | Flutter integration |
| **http** | ^1.6.0 | REST API integration |
| **flutter** | 3.0+ | UI framework |

---

## 📂 Project Structure

```
lib/
├── main.dart                          # 🚀 App entry point
├── home_page.dart                     # 🏠 Navigation hub
├── Lacture1/                          # Immutable updates
│   └── copy_with_method.dart
├── Lacture2/                          # Simple providers
│   └── simple_provider.dart
├── Lacture3/                          # State providers
│   └── state_provider.dart
├── Lacture4/                          # Multiple state
│   └── slider_provider.dart
├── Lacture5/                          # StateNotifier
│   └── search_page.dart
├── Lacture6/                          # Todo CRUD
│   ├── homeTodoList.dart
│   ├── itemProvider.dart
│   └── item.dart
├── Lacture7/                          # Favorites
│   ├── home_favorite.dart
│   ├── Model/
│   └── Provider/
├── Lacture8/                          # Future Provider
│   ├── home_future.dart
│   └── future_provider.dart
├── Lacture9/                          # Stream Provider
│   ├── home_strem.dart
│   └── stream_provider.dart
└── Lacture10/                         # Real API
    ├── home_getApi.dart
    └── provider/
        └── get_api.dart
```

---

## 📚 Lecture Summary

### 🔄 Lecture 1: Copy With Method

Demonstrates immutable state updates using a `copyWith` method in a traditional `StatefulWidget`.

**What's happening:** Uses a `Person` object that updates immutably by creating a new instance instead of mutating the old one.

**Real-world use case:** User profile updates, form data modifications where you need to preserve previous state for undo/redo functionality.

**Code pattern:**
```dart
class Person {
  final String name;
  final int age;
  
  Person copyWith({String? name, int? age}) {
    return Person(name: name ?? this.name, age: age ?? this.age);
  }
}
```

---

### 📖 Lecture 2: Simple Provider

Demonstrates basic `Provider` usage for read-only computed data. Includes both stateless (`ConsumerWidget`) and stateful (`ConsumerStatefulWidget`) implementations.

**What's happening:** Two providers (name and age) expose constant values that widgets consume using `ref.watch()`. Shows how to access provider values in different widget types.

**Real-world use case:** Displaying user information, app configuration values, computed derived data (e.g., user's full name from first + last name).

**Code pattern:**
```dart
final userNameProvider = Provider<String>((ref) => 'John Doe');

// In a ConsumerWidget
class MyWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userName = ref.watch(userNameProvider);
    return Text(userName); // Rebuilds when provider changes
  }
}
```

---

### 🎚️ Lecture 3: State Provider

Demonstrates `StateProvider` for simple, mutable UI state like counters and toggles. Includes both stateless and stateful widget implementations.

**What's happening:** A counter that can be incremented/decremented and a toggle switch that can be turned on/off. Shows `ref.watch()` for reactive updates and `ref.read()` for one-time access.

**Real-world use case:** Theme toggle, quantity selector in shopping cart, UI view mode toggle (list/grid view).

**Code pattern:**
```dart
final counterProvider = StateProvider<int>((ref) => 0);

// Watching for rebuilds
final count = ref.watch(counterProvider);

// Reading without rebuilds (e.g., in button callback)
ref.read(counterProvider.notifier).state++;
```

---

### 🎛️ Lecture 4: Multiple State in One Model

Groups related state fields (slider value and toggle) into a single model and manages updates with `copyWith`.

**What's happening:** A single `AppState` object holds both a slider value and a password visibility toggle. Uses `StateProvider` with `copyWith` for immutable updates.

**Real-world use case:** Form screens with multiple related fields (password strength + visibility toggle, price range filter), multi-step wizard state.

**Code pattern:**
```dart
final appStateProvider = StateProvider<AppState>((ref) => AppState(slider: 0.5, showPassword: false));

// Update only one field
ref.read(appStateProvider.notifier).state = 
  state.copyWith(showPassword: !state.showPassword);
```

---

### 🔍 Lecture 5: StateNotifierProvider

Encapsulates state logic in a `StateNotifier` class with named methods for mutations. Demonstrates search and toggle with a cleaner separation of concerns.

**What's happening:** A `SearchNotifier` manages `SearchState` (search query + toggle). Methods like `search()` and `isswitch()` handle state transitions inside the notifier.

**Real-world use case:** Authentication state, cart management, user preferences, any complex state with multiple related actions.

**Code pattern:**
```dart
final searchProvider = StateNotifierProvider<SearchNotifier, SearchState>((ref) => SearchNotifier());

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier() : super(SearchState(search: '', isOn: false));
  
  void search(String query) {
    state = state.copyWith(search: query);
  }
  
  void toggleSwitch(bool value) {
    state = state.copyWith(isOn: value);
  }
}

// In widget: ref.read(searchProvider.notifier).search('query');
```

---

### ✅ Lecture 6: Todo With StateNotifierProvider

Full CRUD example: creates, reads, updates, and deletes todo items using `StateNotifierProvider`.

**What's happening:** A todo list where you can add tasks, mark them as complete, and delete them. The `itemProvider` manages a list of todo items with add, update, and remove operations.

**Real-world use case:** Shopping lists, task management apps, note-taking apps, any app with a dynamic list of items.

**Code pattern:**
```dart
final itemProvider = StateNotifierProvider<ItemNotifier, List<Item>>((ref) => ItemNotifier());

class ItemNotifier extends StateNotifier<List<Item>> {
  void addItem(Item item) => state = [...state, item];
  void removeItem(String id) => state = state.where((item) => item.id != id).toList();
  void updateItem(String id, Item updated) => state = state.map((item) => 
    item.id == id ? updated : item).toList();
}
```

---

### ❤️ Lecture 7: Favorites

Demonstrates filtering and toggling favorite items with advanced `StateNotifierProvider` usage.

**What's happening:** A list of items with a favorite toggle. Shows filtering items by favorite status and searching within the filtered results.

**Real-world use case:** E-commerce favorites/wishlist, bookmarked content, saved videos on streaming apps.

**Code pattern:**
```dart
final favoritesProvider = StateNotifierProvider<FavoritesNotifier, FavoritesState>((ref) => FavoritesNotifier());

class FavoritesNotifier extends StateNotifier<FavoritesState> {
  void toggleFavorite(String itemId) {
    state = state.copyWith(
      favorites: state.favorites.contains(itemId)
        ? state.favorites.where((id) => id != itemId).toList()
        : [...state.favorites, itemId]
    );
  }
}
```

---

### ⏳ Lecture 8: Future Provider

Loads async data once and exposes it as `AsyncValue` with three states: loading, data, and error.

**What's happening:** Simulates a 2-second network request that returns a list of fruits. The UI automatically shows a loading spinner while waiting, then displays the data or an error message.

**Real-world use case:** Fetching user profile on app launch, loading initial configuration, downloading images/videos, any one-time async operation.

**Code pattern:**
```dart
final dataProvider = FutureProvider<List<String>>((ref) async {
  await Future.delayed(Duration(seconds: 2));
  return ['Apple', 'Banana', 'Cherry'];
});

// In widget
dataProvider.when(
  loading: () => CircularProgressIndicator(),
  data: (items) => ListView(children: items.map((item) => Text(item)).toList()),
  error: (err, stack) => Text('Error: $err'),
);
```

---

### 📊 Lecture 9: Stream Provider

Listens to a live continuous stream and rebuilds the UI with each new value.

**What's happening:** Simulates a live stock price that updates every second with random fluctuations. The UI continuously rebuilds showing the latest price in real-time.

**Real-world use case:** Real-time notifications, live chat messages, stock price tickers, live location tracking, WebSocket connections, push notifications.

**Code pattern:**
```dart
final stockPriceProvider = StreamProvider<double>((ref) async* {
  while (true) {
    await Future.delayed(Duration(seconds: 1));
    yield Random().nextDouble() * 100;
  }
});

// In widget: AsyncValue.when() same as FutureProvider
// Automatically rebuilds on each new stream value
```

---

### 🌐 Lecture 10: Get API Data

Fetches real posts from the DummyJSON API using `FutureProvider` and the `http` package. Demonstrates JSON parsing and error handling.

**What's happening:** Makes an HTTP GET request to `dummyjson.com/posts`, parses the JSON response into a list of posts, and displays them. Handles loading states and network errors.

**Real-world use case:** Fetching posts from social media API, loading products from e-commerce API, any REST API integration.

**Code pattern:**
```dart
final postsProvider = FutureProvider<List<Map<String, dynamic>>>((ref) async {
  final response = await http.get(Uri.parse('https://api.example.com/posts'));
  if (response.statusCode == 200) {
    final decoded = jsonDecode(response.body);
    return decoded['posts'] as List<Map<String, dynamic>>;
  }
  throw Exception('Failed to load posts');
});
```

---

## 🎓 When to Use Each Pattern

| Pattern | Use Case | Example | Complexity |
|---------|----------|---------|-----------|
| **Provider** | Read-only computed data | App version, user name from other providers | ⭐ |
| **StateProvider** | Simple mutable UI state | Toggle switch, counter, selected tab | ⭐ |
| **StateNotifierProvider** | Complex state with business logic | Cart management, auth state, filters | ⭐⭐ |
| **FutureProvider** | One-time async operations | Load user profile, fetch initial data | ⭐⭐ |
| **StreamProvider** | Continuous live data updates | Stock prices, notifications, chat messages | ⭐⭐⭐ |

---

## 🚀 Riverpod State Management Concepts

### 1️⃣ Provider (Read-only)
Simple values and computed data that don't change or change only when their dependencies change. Perfect for selectors and derived state.

### 2️⃣ StateProvider (Mutable Simple State)
Use when you have simple, independent pieces of state like UI toggles. Good for UI-level state, but can become unwieldy with complex logic.

### 3️⃣ StateNotifierProvider (Mutable Complex State)
Use when state has business logic and multiple related fields. Encapsulates mutations in named methods for better organization and maintainability.

### 4️⃣ FutureProvider (One-time Async)
Use for loading data once: user profile on app start, configuration files, image downloads. Provides automatic loading/error/data states.

### 5️⃣ StreamProvider (Continuous Async)
Use for live, continuous data: WebSocket updates, sensor data, real-time price feeds. Automatically handles stream subscriptions and rebuilds.

---

## 🛠️ Getting Started

### Prerequisites
- Flutter SDK (3.0+)
- Dart SDK (3.9.2+)
- iOS or Android emulator/device
- Your favorite code editor (VS Code, Android Studio, etc.)

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/riverpod_statemanagement.git
cd riverpod_statemanagement
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run the app**
```bash
flutter run
```

That's it! The app will launch with the main menu showing all 10 lectures.

---

## 📊 Decision Guide

### Which Pattern Should I Use?

<details>
<summary><b>I need read-only data that doesn't change</b></summary>

Use **Provider**
- App configuration
- Computed values from other providers
- User settings

```dart
final userNameProvider = Provider((ref) => 'John Doe');
```
</details>

<details>
<summary><b>I need simple mutable state (toggle, counter, etc.)</b></summary>

Use **StateProvider**
- Theme toggle
- Counter
- Selected tab index

```dart
final counterProvider = StateProvider((ref) => 0);
```
</details>

<details>
<summary><b>I need complex state with business logic</b></summary>

Use **StateNotifierProvider**
- Cart management
- Authentication state
- Search with filters
- Todo lists

```dart
final cartProvider = StateNotifierProvider((ref) => CartNotifier());
```
</details>

<details>
<summary><b>I need to load data once asynchronously</b></summary>

Use **FutureProvider**
- Load user profile on app start
- Fetch configuration from API
- Download initial images

```dart
final userProvider = FutureProvider((ref) async => await fetchUser());
```
</details>

<details>
<summary><b>I need continuous live data updates</b></summary>

Use **StreamProvider**
- Real-time chat messages
- Stock price tickers
- Location tracking
- WebSocket connections

```dart
final priceStream = StreamProvider((ref) async* {
  yield* priceService.watchPrice();
});
```
</details>

---

## ✅ Best Practices & Decision Guide

### Choosing the Right Pattern

1. **Is the data read-only or computed from other providers?** → Use `Provider`
2. **Is it simple UI state (toggle, counter)?** → Use `StateProvider`
3. **Does it have complex business logic and multiple methods?** → Use `StateNotifierProvider`
4. **Is it loading data once asynchronously?** → Use `FutureProvider`
5. **Is it a continuous stream of updates?** → Use `StreamProvider`

### 💡 Key Takeaways

- **✅ Immutability First:** Always use `copyWith()` or create new instances instead of mutating state
- **✅ ProviderScope Required:** Every app must wrap its root widget with `ProviderScope`
- **✅ ref.watch() for Rebuilds:** Use in widget builds to automatically rebuild on changes
- **✅ ref.read() for Actions:** Use in callbacks to access state without rebuilds
- **✅ Async Support:** `FutureProvider` and `StreamProvider` handle loading/error states automatically
- **✅ No Manual Subscriptions:** Riverpod manages subscriptions and cleanup automatically

### 🎯 Example Decision Flowchart

```
Does my widget need to display or modify state?
│
├─ Yes, it's simple mutable value (counter, toggle)
│  └─→ StateProvider
│
├─ Yes, complex state with business logic
│  └─→ StateNotifierProvider
│
├─ Yes, but it's read-only or computed
│  └─→ Provider
│
├─ Yes, one-time async loading
│  └─→ FutureProvider
│
├─ Yes, continuous live updates
│  └─→ StreamProvider
│
└─ No, regular UI
   └─→ StatelessWidget
```

---

## 📖 How To Run

```bash
# Install dependencies
flutter pub get

# Run on emulator/device
flutter run

# Run on specific device
flutter run -d <device_id>
```

---

## 🎁 What You'll Learn

After completing all 10 lectures, you'll understand:

✨ **Immutable State Updates** - Why and how to use `copyWith`  
✨ **Simple & Complex State** - When to use `StateProvider` vs `StateNotifierProvider`  
✨ **Async Data Loading** - Handling loading, error, and success states  
✨ **Real-time Updates** - Working with streams and WebSocket-like data  
✨ **API Integration** - Fetching and parsing JSON from REST APIs  
✨ **Production Patterns** - Best practices used in real Flutter apps  
✨ **Widget Types** - Using `ConsumerWidget` and `ConsumerStatefulWidget`  
✨ **Provider Dependencies** - Creating providers that depend on other providers  

---

## 📝 Notes

- The project is intended for learning Riverpod fundamentals through small, focused demos
- The home page is the main navigation hub for all lecture screens
- Each lecture is completely self-contained and can be studied independently
- Try modifying the code in each lecture to deepen your understanding

---

## 🤝 Contributing

Found a bug or want to improve something? Feel free to open an issue or submit a pull request!

---

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

---

## 📚 Resources

- [Riverpod Official Docs](https://riverpod.dev)
- [Flutter State Management Guide](https://flutter.dev/docs/development/data-and-backend/state-mgmt/intro)
- [DummyJSON API](https://dummyjson.com)
- [Flutter Documentation](https://flutter.dev/docs)

---

<div align="center">

**Made with ❤️ for Flutter developers learning state management**

⭐ If this helps you learn Riverpod, please consider giving it a star!

</div>
