class Contact {
  int? id;
  String name;
  String lastName;
  Contact({
    this.id,
    required this.name,
    required this.lastName,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'lastName': lastName,
    };
  }

  factory Contact.fromMap(Map<String, Object?> map) => Contact(
    id: map['id'] as int?,
    name: map['name'] as String,
    lastName: map['lastName'] as String,
  );
}
