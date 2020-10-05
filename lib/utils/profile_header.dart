import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget with PreferredSizeWidget {
  const ProfileHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFD84764),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Hello Ajay'),
            Text(
              "Edit your profile",
              style: TextStyle(fontSize: 13),
            )
          ],
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.all(24),
          child: IconButton(
            icon: Icon(Icons.help_outline),
            onPressed: null,
            iconSize: 70,
          ),
        )
      ],
      toolbarHeight: 150,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(150);
}
