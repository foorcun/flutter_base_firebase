import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String? documentId;
  int? id;
  String? name;
  User({
    this.documentId,
    this.id,
    this.name,
  });

  User.empty();

  User copyWith({
    String? documentId,
    int? id,
    String? name,
  }) {
    return User(
      documentId: documentId ?? this.documentId,
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'documentId': documentId,
      'id': id,
      'name': name,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      documentId: map['documentId'],
      id: map['id']?.toInt(),
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() => 'User(documentId: $documentId, id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.documentId == documentId &&
        other.id == id &&
        other.name == name;
  }

  @override
  int get hashCode => documentId.hashCode ^ id.hashCode ^ name.hashCode;

  User.newFromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    // if (doc.data().containsKey("id") == true) {
    //   id = doc['id'];
    // } else {
    //   id = null;
    // }

    doc.data().containsKey("id") ? id = doc['id'] : id = null;

    // if (doc.data().containsKey("name") == true) {
    //   name = doc["name"];
    // } else {
    //   name = null;
    // }
    doc.data().containsKey("name") ? name = doc["name"] : name = null;

    documentId = doc.id;
  }
}
