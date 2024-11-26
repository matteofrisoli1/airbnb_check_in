import 'package:airbnb_checkin/models/my_user/my_user.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final MyUser user;

  const UserTile({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minLeadingWidth: 0,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(
          user.imageUrl!,
          width: 32.0,
          height: 32.0,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        user.fullName,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade900,
          fontSize: 22,
        ),
      ),
    );
  }
}
