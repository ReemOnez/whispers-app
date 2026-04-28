import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/confession.dart';

class ConfessionsNotifier extends StateNotifier<List<Confession>> {
  ConfessionsNotifier() : super([]) {
    _init();
  }

  void _init() {
    state = [
      Confession(
        id: '1',
        body: 'I wish I had said goodbye before you left.',
        createdAt: DateTime.now().subtract(const Duration(hours: 2)),
        mood: 'Regret',
      ),
      Confession(
        id: '2',
        body: 'Sometimes I sit in my car for 10 minutes before going inside just to have some silence.',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        mood: 'Exhausted',
      ),
      Confession(
        id: '3',
        body: 'Sometimes I sit in my car for 10 minutes before going inside just to have some silence.',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        mood: 'Regret',
      ),
      Confession(
        id: '4',
        body: 'Sometimes I sit in my car for 10 minutes before going inside just to have some silence.',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        mood: 'Happy',
      ),
      Confession(
        id: '5',
        body: 'Sometimes I sit in my car for 10 minutes before going inside just to have some silence.',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        mood: 'Exhausted',
      ),
      Confession(
        id: '6',
        body: 'Sometimes I sit in my car for 10 minutes before going inside just to have some silence.',
        createdAt: DateTime.now().subtract(const Duration(days: 1)),
        mood: 'Regret',
      ),
    ];
  }

  void addConfession(String body, String? mood) {
    final newConfession = Confession(id: DateTime.now().millisecondsSinceEpoch.toString(), body: body, createdAt: DateTime.now(), mood: mood);
    state = [newConfession, ...state];
  }

  void archiveConfession(String id) {
    state = state.where((c) => c.id != id).toList();
  }
}

final confessionsProvider = StateNotifierProvider<ConfessionsNotifier, List<Confession>>((ref) {
  return ConfessionsNotifier();
});
