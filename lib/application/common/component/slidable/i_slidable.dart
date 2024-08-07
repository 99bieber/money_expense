import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../theme/i_colors.dart';

class ISlidable extends StatelessWidget {
  final Widget Function(BuildContext context) builder;

  const ISlidable({
    super.key,
    required this.builder,
  });

  factory ISlidable.primary({
    required Function(BuildContext context) onDelete,
    required Function(BuildContext context) onUpdate,
    required Widget child,
    // required SlidableController controller,
  }) {
    return ISlidable(
      builder: (context) {
        return Slidable(
          // controller: SlidableController(),
          key: const ValueKey(0),
          closeOnScroll: true,
          endActionPane: ActionPane(
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(8),
                ),
                onPressed: onUpdate,
                backgroundColor: Palette.secondary,
                foregroundColor: Colors.white,
                icon: Icons.edit_note_rounded,
                label: 'Ubah',
              ),
              SlidableAction(
                borderRadius: const BorderRadius.horizontal(
                  right: Radius.circular(8),
                ),
                onPressed: onDelete,
                backgroundColor: Palette.red,
                foregroundColor: Colors.white,
                icon: Icons.delete_outline_sharp,
                label: 'Hapus',
              ),
            ],
          ),
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return builder(context);
  }
}
