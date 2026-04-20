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
- `FutureProvider`: Handle one-time asynchronous operations (for example, API calls)
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

## Implemented Lectures (1 to 3)

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

## Home Navigation

- File: `lib/home_page.dart`
- Added a centralized Home page with buttons to open each lecture screen.
- Navigation is implemented with `Navigator.push` and `MaterialPageRoute`.
- App entry now starts from Home page in `lib/main.dart`.

## Notes

- This project is intended for learning Riverpod fundamentals and best practices.
- Each provider type can be expanded with practical examples such as counters, API calls, and stream listeners.
