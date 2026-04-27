import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/theme.dart';
import '../../../confession/presentation/providers/confessions_notifier.dart';

class WriteScreen extends ConsumerStatefulWidget {
  const WriteScreen({super.key});

  @override
  ConsumerState<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends ConsumerState<WriteScreen> {
  final _textCtrl = TextEditingController();
  String? _selectedMood;

  final List<String> _moods = ['Regret', 'Hopeful', 'Exhausted', 'Nostalgic', 'Anxious', 'Peaceful'];

  @override
  void dispose() {
    _textCtrl.dispose();
    super.dispose();
  }

  void _save() {
    if (_textCtrl.text.trim().isNotEmpty) {
      ref.read(confessionsProvider.notifier).addConfession(_textCtrl.text.trim(), _selectedMood);
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leave a Thought'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
        actions: [
          TextButton(
            onPressed: _save,
            child: Text('Keep', style: AppTextStyles.bodyMd.copyWith(color: AppColors.etherealLavender)),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.containerPadding),
              child: TextField(
                controller: _textCtrl,
                maxLines: null,
                expands: true,
                style: AppTextStyles.bodyLg,
                decoration: InputDecoration(
                  hintText: 'Write into the dark...',
                  hintStyle: AppTextStyles.placeholder,
                  filled: false,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(AppSpacing.stackGap),
            decoration: BoxDecoration(
              color: AppColors.surfaceBright,
              border: Border(top: BorderSide(color: AppColors.outlineVariant)),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _moods.map((mood) {
                    final isSelected = _selectedMood == mood;
                    return Padding(
                      padding: const EdgeInsets.only(right: AppSpacing.sm),
                      child: FilterChip(
                        label: Text(mood),
                        selected: isSelected,
                        onSelected: (selected) {
                          setState(() {
                            _selectedMood = selected ? mood : null;
                          });
                        },
                        backgroundColor: AppColors.theVoid,
                        selectedColor: AppColors.primaryContainer.withOpacity(0.3),
                        labelStyle: AppTextStyles.labelSm.copyWith(
                          color: isSelected ? AppColors.etherealLavender : AppColors.ghostText,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: AppRadius.brFull,
                          side: BorderSide(color: isSelected ? AppColors.etherealLavender : AppColors.outlineVariant),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
