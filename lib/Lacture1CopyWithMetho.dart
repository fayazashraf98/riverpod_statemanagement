import 'package:flutter/material.dart';

// Lecture 1: Demonstrates immutable update using copyWith.
class CopyWith extends StatefulWidget {
  const CopyWith({super.key});

  @override
  State<CopyWith> createState() => _CopyWithState();
}

class _CopyWithState extends State<CopyWith> {
  // Initial state object.
  Person person = Person(name: "Fayaz", age: 25);

  // Updates person by creating a new object instead of mutating old data.
  void updatePerson() {
    print(person.name); // Output: Fayaz
    setState(() {
      // copyWith returns a new Person with only provided fields changed.
      person = person.copyWith(name: "Muhammad Fayaz", age: 26);
      print(person.name); // Output: Muhammad Fayaz
    });
  }

  @override
  void initState() {
    super.initState();
    // Run once to show copyWith update behavior on first load.
    updatePerson();
  }

  // Renders current values from the latest person state.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Copy With Method")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Name : ${person.name}"),
            Text("Age : ${person.age}"),
          ],
        ),
      ),
    );
  }
}

class Person {
  final String name;
  final int age;

  Person({required this.name, required this.age});

  // Keeps old values when null is passed, updates only non-null fields.
  Person copyWith({String? name, int? age}) {
    return Person(name: name ?? this.name, age: age ?? this.age);
  }
}
