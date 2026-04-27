class Confession {
  const Confession({
    required this.id,
    required this.body,
    required this.createdAt,
    this.mood,
    this.isSent = false,
  });

  final String id;
  final String body;
  final DateTime createdAt;
  final String? mood;
  final bool isSent;
}
