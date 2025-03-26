import 'package:flutter/material.dart';

class FloatingUploadButton extends StatelessWidget {
  final VoidCallback onUpload;

  const FloatingUploadButton({required this.onUpload, super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onUpload,
      tooltip: 'Upload Image',
      child: const Icon(Icons.upload),
    );
  }
}
