//inside of models/artwork.dart

import 'package:cloud_firestore/cloud_firestore.dart';

class Artwork {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final DateTime createdAt;
  final String artistId;

  Artwork({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.createdAt,
    required this.artistId,
  });

  // Factory constructor for creating a new Artwork instance from a map. Used for deserialization.
  factory Artwork.fromMap(Map<String, dynamic> map) {
    return Artwork(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      imageUrl: map['imageUrl'],
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      artistId: map['artistId'],
    );
  }

  // Method to convert an Artwork instance to a map. Used for serialization.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'createdAt': Timestamp.fromDate(createdAt),
      'artistId': artistId,
    };
  }

  // Method to create a copy of an instance with modified fields.
  Artwork copyWith({
    String? id,
    String? title,
    String? description,
    String? imageUrl,
    DateTime? createdAt,
    String? artistId,
  }) {
    return Artwork(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
      artistId: artistId ?? this.artistId,
    );
  }
}
