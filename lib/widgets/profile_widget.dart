import 'package:flutter/material.dart';
import '../models/user.dart';

class ProfileWidget extends StatelessWidget {
  final User user;
  final VoidCallback? onEditPressed;
  final bool isCompact;

  const ProfileWidget({Key? key, required this.user, this.onEditPressed, this.isCompact = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(isCompact ? 8.0 : 16.0),
        child: Row(
          children: [
            CircleAvatar(radius: isCompact ? 24 : 40, backgroundImage: NetworkImage(user.avatarUrl)),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.name, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                  Text(user.email, style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ),
            if (onEditPressed != null) IconButton(icon: const Icon(Icons.edit), onPressed: onEditPressed),
          ],
        ),
      ),
    );
  }
}
