//inside of models/collection.dart

import 'package:cloud_firestore/cloud_firestore.dart';
class Collection {
  final String id;
  final String title;
  final List<String> artworkIds; // IDs of artworks in the collection
  final String creatorId;
  final String? featuredImageUrl; // Now nullable

  Collection({
    required this.id,
    required this.title,
    required this.artworkIds,
    required this.creatorId,
    this.featuredImageUrl, // Nullable image URL
  });

  // Assuming you might need a method to deserialize your data
  factory Collection.fromMap(Map<String, dynamic> map) {
    return Collection(
      id: map['id'],
      title: map['title'],
      artworkIds: List<String>.from(map['artworkIds']),
      creatorId: map['creatorId'],
      featuredImageUrl: map['featuredImageUrl'] as String?, // Handle nullable URLs
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'artworkIds': artworkIds,
      'creatorId': creatorId,
      'featuredImageUrl': featuredImageUrl, // Nullable field
    };
  }
  // Method to create a copy of an instance with modified fields.
  Collection copyWith({
    String? id,
    String? title,
    List<String>? artworkIds,
    String? creatorId,
  }) {
    return Collection(
      id: id ?? this.id,
      title: title ?? this.title,
      artworkIds: artworkIds ?? this.artworkIds,
      creatorId: creatorId ?? this.creatorId,
    );
  }


}



