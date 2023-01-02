// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

@immutable
class Patient {
  final String name;
  final String dateOfBirth;
  final int mrn;
  final String? imageUrl;
  final List<String>? allergies;
  final List<String>? medications;
  final List<String>? conditions;
  final List<String>? notes;

  const Patient({
    required this.name,
    required this.dateOfBirth,
    required this.mrn,
    required this.imageUrl,
    required this.allergies,
    required this.medications,
    required this.conditions,
    required this.notes,
  });

  String get firstName => name.split(' ').first.trim();
  String get lastName => name.split(' ').last.trim();

  Patient copyWith({
    String? name,
    String? dateOfBirth,
    int? mrn,
    String? imageUrl,
    List<String>? allergies,
    List<String>? medications,
    List<String>? conditions,
    List<String>? notes,
  }) {
    return Patient(
      name: name ?? this.name,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      mrn: mrn ?? this.mrn,
      imageUrl: imageUrl ?? this.imageUrl,
      allergies: allergies ?? this.allergies,
      medications: medications ?? this.medications,
      conditions: conditions ?? this.conditions,
      notes: notes ?? this.notes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'dateOfBirth': dateOfBirth,
      'mrn': mrn,
      'imageUrl': imageUrl,
      'allergies': allergies,
      'medications': medications,
      'conditions': conditions,
      'notes': notes,
    };
  }

  factory Patient.fromMap(Map<String, dynamic> map) {
    return Patient(
      name: map['name'] as String,
      dateOfBirth: map['date_of_birth'] as String,
      mrn: int.parse(map['mrn']),
      imageUrl: map['image_url'] != null ? map['image_url'] as String : null,
      allergies: map['allergies'] != null
          ? List<String>.from(map['allergies'])
          : null,
      medications: map['medications'] != null
          ? List<String>.from(map['medications'])
          : null,
      conditions: map['medical_history'] != null
          ? List<String>.from(map['medical_history'])
          : null,
      notes: map['notes'] != null
          ? List<String>.from(map['notes'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Patient.fromJson(String source) =>
      Patient.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Patient(name: $name, dateOfBirth: $dateOfBirth, mrn: $mrn, imageUrl: $imageUrl, allergies: $allergies, medications: $medications, conditions: $conditions, notes: $notes)';
  }

  @override
  bool operator ==(covariant Patient other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.dateOfBirth == dateOfBirth &&
        other.mrn == mrn &&
        other.imageUrl == imageUrl &&
        listEquals(other.allergies, allergies) &&
        listEquals(other.medications, medications) &&
        listEquals(other.conditions, conditions) &&
        listEquals(other.notes, notes);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        dateOfBirth.hashCode ^
        mrn.hashCode ^
        imageUrl.hashCode ^
        allergies.hashCode ^
        medications.hashCode ^
        conditions.hashCode ^
        notes.hashCode;
  }
}
