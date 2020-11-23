import 'package:flutter/material.dart';

class InputCard extends StatelessWidget {

  InputCard({
    this.title='',
    this.controller,
    this.placeholder = '',
    this.maxlines = 1,
    this.subtitle = '',
    this.isRequired = true,
    this.enabled = true,
  });

  final String title;
  final TextEditingController controller;
  final String placeholder;
  final maxlines;
  final String subtitle;
  final bool isRequired;
  bool enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (this.title.isNotEmpty) ?
        RichText(
          text: TextSpan(
            text: this.title,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            children: (isRequired) ? [
              TextSpan(text: '*', style: TextStyle(color: Colors.red)),
            ] : [],
          ),
        )
            : Container(),
        SizedBox(
          height: 8,
        ),
        Container(
          color: (this.enabled) ? Colors.white : Colors.black12,
          child: TextFormField(
            controller: this.controller,
            enabled: this.enabled,
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            keyboardType: TextInputType.multiline,
            maxLines: this.maxlines,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: this.placeholder,
              enabled: this.enabled,
            ),
          ),
        ),
        (this.subtitle.isNotEmpty)
            ? SizedBox(
                height: 8,
              )
            : Container(),
        (this.subtitle.isNotEmpty)
            ? Text(
                this.subtitle,
                style: TextStyle(
                    color: Colors.grey.withOpacity(0.5),
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              )
            : Container(),
      ],
    );
  }
}
