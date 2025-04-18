

import 'package:flutter/material.dart';

class GomdongModal extends StatelessWidget {
  final String header;
  final String content;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

  const GomdongModal({
    super.key,
    required this.header,
    required this.content,
    required this.onCancel,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(header, style: const TextStyle(fontWeight: FontWeight.bold)),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: onCancel,
          child: const Text("취소"),
        ),
        ElevatedButton(
          onPressed: onConfirm,
          child: const Text("확인"),
        ),
      ],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    );
  }
}