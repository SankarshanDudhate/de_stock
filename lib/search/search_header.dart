import 'package:flutter/material.dart';

class SearchHeader extends StatelessWidget with PreferredSizeWidget {
  const SearchHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFD84764),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(80))),
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
      toolbarHeight: 80,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(150);
}
