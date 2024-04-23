//inside of models/message.dart


import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String id;
  final String senderId;
  final String receiverId;
  final String text;
  final DateTime sentAt;

  Message({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.text,
    required this.sentAt,
  });

  // Factory constructor for creating a new Message instance from a map.
  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['id'],
      senderId: map['senderId'],
      receiverId: map['receiverId'],
      text: map['text'],
      sentAt: (map['sentAt'] as Timestamp).toDate(),
    );
  }

  // Method to convert a Message instance to a map.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'senderId': senderId,
      'receiverId': receiverId,
      'text': text,
      'sentAt': Timestamp.fromDate(sentAt),
    };
  }

  // Method to create a copy of an instance with modified fields.
  Message copyWith({
    String? id,
    String? senderId,
    String? receiverId,
    String? text,
    DateTime? sentAt,
  }) {
    return Message(
      id: id ?? this.id,
      senderId: senderId ?? this.senderId,
      receiverId: receiverId ?? this.receiverId,
      text: text ?? this.text,
      sentAt: sentAt ?? this.sentAt,
    );
  }
}
