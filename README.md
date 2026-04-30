# Riverpod State Management

A Flutter project focused on learning and implementing state management using Riverpod.

## Introduction

Riverpod is a modern state management library for Flutter and Dart. It helps you manage:

- App state
- Dependency injection
- Caching and async data flows

Riverpod is inspired by the `provider` package, but offers a safer and more scalable developer experience.

## Why Riverpod?

- Compile-time safety for many common state and dependency issues
- Cleaner dependency injection and better separation of concerns
- Improved handling of asynchronous states (loading, data, and error)
- More testable and maintainable architecture for medium and large apps

## Learning Roadmap

This project covers the most common Riverpod provider types:

- `Provider`: Read constant or computed values that do not change over time
- `StateProvider`: Manage simple mutable state (for example, counter or toggle)
- `FutureProvider`: Handle one-time asynchronous operations and expose loading, data, and error states (for example, API calls)
- `StreamProvider`: Handle continuous async data streams (for example, chat or connectivity)
- `StateNotifierProvider`: Manage complex business logic and state transitions
- `autoDispose`: Automatically clean up providers when no longer used
- `ProviderScope`: Define and control provider scope in the widget tree

## Packages Used

- `riverpod: ^3.2.1`
  Core Riverpod package for provider logic and state management concepts.
- `flutter_riverpod: ^3.3.1`
  Flutter integration for consuming providers directly inside widgets.

## Project Setup

Run the following commands to get started:

```bash
flutter pub get
flutter run
```

## Implemented Lectures (1 to 10)

This project currently includes the following completed lecture demos:

### Lecture 1: CopyWith Method

- File: `lib/Lacture1CopyWithMetho.dart`
- Demonstrates immutable state updates using a `copyWith` method.
- Uses a `StatefulWidget` to show how an object (`Person`) is replaced with a new updated instance.

### Lecture 2: Simple Provider

- File: `lib/Lacture2SimpleProvider.dart`
- Defines simple providers:
  - `name` (`Provider<String>`)
  - `age` (`Provider<int>`)
- Includes both implementations for learning comparison:
  - `SimpleProvider` using `ConsumerWidget` (stateless)
  - `SimpleProviderStateful` using `ConsumerStatefulWidget` (stateful)

### Lecture 3: State Provider

- File: `lib/Lacture3StateProvider.dart`
- Defines mutable providers:
  - `counter` (`StateProvider<int>`)
  - `isOn` (`StateProvider<bool>`)
- Includes both implementations for comparison:
  - `CounterAppStatefull` using `ConsumerStatefulWidget`
  - `CounterApp` using `ConsumerWidget`
- Features included:
  - Counter increment/decrement/reset
  - Switch toggle state handling
  - Rebuild behavior demonstration with `Consumer`

### Lecture 4: Multiple State in One Model

- File: `lib/Lacture4StateProviderMultipleState.dart`
- Demonstrates how to keep related UI state together in one `AppState` model.
- Uses one `StateProvider<AppState>` for two values:
  - `slider` for the slider and color opacity
  - `showPassword` for the visibility icon toggle
- Shows how `copyWith` updates only one field while keeping the rest of the state unchanged.
- Uses separate `Consumer` widgets with `select` so only the part of the UI that depends on a field rebuilds.
- Compares fine-grained rebuilds with a shared state object and demonstrates why smaller consumers are more efficient.

### Lecture 5: StateNotifierProvider

- File: `lib/Lacture5StateNotifyProvider.dart`
- Demonstrates managing state with `StateNotifierProvider` and a custom immutable state model.
- Uses `SearchState` with two fields:
  - `search` for the current text query
  - `isOn` for switch toggle state
- Uses `SearchNotifier` to centralize all state updates through methods:
  - `search(String query)`
  - `isswitch(bool isOn)`
- Uses `copyWith` in the state model to update one field while preserving other values.
- Demonstrates fine-grained rebuilds using `select` in separate `Consumer` widgets for search text and switch state.

### Lecture 6: Todo App with StateNotifierProvider

- Files:
  - `lib/Lacture6/homeScreen.dart`
  - `lib/Lacture6/itemProvider.dart`
  - `lib/Lacture6/item.dart`
- Demonstrates a practical CRUD-style todo flow with `StateNotifierProvider`.
- Uses `ItemNotifier` as a single source of truth for list operations:
  - `addItem(String name)`
  - `removeItem(String id)`
  - `updateItem(String id, String name)`
- Uses immutable list updates so UI rebuilds reliably after every state change.
- Shows how the UI can:
  - Watch provider state with `ref.watch(itemProvider)`
  - Trigger state changes through `ref.read(itemProvider.notifier)`
  - Keep dialogs and list interactions simple and predictable.

### Lecture 7: Favorites with Filter and Toggle

- Files:
  - `lib/Lacture7/home_favorite.dart` (Main UI)
  - `lib/Lacture7/Provider/favorite_provider.dart` (FavoriteNotifier & StateNotifierProvider)
  - `lib/Lacture7/Provider/favorite_state.dart` (FavoriteState model)
  - `lib/Lacture7/Model/favorite_items.dart` (favoriteItem model)
- Demonstrates a practical use case combining search/filter functionality with state management.
- Features:
  - Add sample items (fruits) using FloatingActionButton
  - Real-time search filtering as you type in the TextField
  - Toggle favorite status by clicking the heart icon
  - Immutable state updates with filtering logic
- Key concepts:
  - `StateNotifierProvider` manages three related state fields:
    - `allItems`: Complete list of items
    - `filteredItems`: Results after applying search query
    - `search`: Current search query text
  - `FavoriteNotifier` handles state transitions through methods:
    - `addItems()`: Adds sample fruit items to the list
    - `updateSearch(String query)`: Filters items by name and updates search text
    - `toggleFavorite(int id)`: Marks/unmarks an item as favorite and reapplies filter
  - Uses `ref.watch()` for watching filtered items and triggering rebuilds
  - Uses `ref.read()` in callbacks for non-reactive state updates (add, search, toggle)
  - Demonstrates efficient rebuilds by watching only `filteredItems` instead of the entire state

### Lecture 8: Future Provider

- Files:
  - `lib/Lacture8/home_future.dart`
  - `lib/Lacture8/future_provider.dart`
- Demonstrates how to load asynchronous data using `FutureProvider`.
- The provider returns a `FutureProvider<List<String>>` that simulates a delayed fetch and returns a list of fruit names.
- The UI uses `provider.when(...)` to switch between loading, data, and error states.
- The refresh button reloads the provider by invalidating it and awaiting the future again.
- Key concepts:
  - `ref.watch(futureProvider)` listens to the async state and rebuilds the widget
  - `AsyncValue.when` cleanly handles loading, data, and error branches
  - `ref.invalidate(futureProvider)` tells Riverpod to run the async task again
  - `ref.read(futureProvider.future)` waits for the refreshed value
  - `skipLoadingOnReload: false` keeps the loading indicator visible while reloading

### Lecture 9: Stream Provider

- Files:
  - `lib/Lacture9/home_strem.dart`
  - `lib/Lacture9/stream_provider.dart`
- Demonstrates how to listen to live data using `StreamProvider`.
- The stream emits a new stock price every second to mimic a live market feed.
- The UI shows a simple stock card with the current price and a live label.
- Key concepts:
  - `StreamProvider<double>` exposes a stream of changing values
  - `ref.watch(stockPriceProvider)` rebuilds the widget when a new value arrives
  - `AsyncValue.when` handles loading, error, and data states
  - Stream providers are useful for live updates like stock prices, sensors, or chat messages

### Lecture 10: Get API Data with FutureProvider

- Files:
  - `lib/Lacture10/home_getApi.dart` (Main UI)
  - `lib/Lacture10/provider/get_api.dart` (API provider)
- Demonstrates how to fetch and display data from a real API endpoint using `FutureProvider`.
- Fetches posts from `https://dummyjson.com/posts` API and displays them in a beautiful card-based list.
- Key concepts:
  - `FutureProvider<List<Map<String, dynamic>>>` handles async HTTP requests
  - JSON parsing using `jsonDecode()` to convert API response to usable data
  - Direct use of JSON maps without a model class (working with `Map<String, dynamic>`)
  - `ref.watch(postProvider)` watches the async state and triggers rebuilds
  - `AsyncValue.when` cleanly handles three states: loading, error, and data
  - Error handling with status code checking and exception messages
  - Beautiful UI with gradient cards, metadata badges, and proper text truncation
  - Each post displays: ID, User ID, Title (2 lines max), and Body (3 lines max)
- Features:
  - Loading state with spinner and message
  - Error state with icon and error message
  - Data state with scrollable list of posts in cards
  - Modern Material Design with rounded corners and gradients
- Learning takeaway:
  - How to work with raw JSON data without model classes
  - Importance of proper error handling in API calls
  - Building beautiful UIs with gradient backgrounds and metadata badges

## Home Navigation

- File: `lib/home_page.dart`
- Added a centralized Home page with buttons to open each lecture screen.
- Navigation is implemented with `Navigator.push` and `MaterialPageRoute` for all lectures (1-10).
- App entry now starts from Home page in `lib/main.dart`.
- All 10 lectures are now accessible from the home menu.
- Each lecture button displays a title and subtitle describing what the lecture covers.
- Consistent navigation pattern: buttons trigger `Navigator.push()` with `MaterialPageRoute` to open each lecture screen.

## Notes

- This project is intended for learning Riverpod fundamentals and best practices.
- Each provider type can be expanded with practical examples such as counters, API calls, and stream listeners.
