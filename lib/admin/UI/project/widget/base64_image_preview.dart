import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class Base64ImagePreview extends StatelessWidget {
  final String? base64Image;
  final VoidCallback onReupload;

  const Base64ImagePreview({
    Key? key,
    required this.base64Image,
    required this.onReupload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (base64Image != null)
          Container(
            width: 200,
            height: 200,
            color: Colors.grey[300],
            child: Image.memory(
              Uint8List.fromList(base64Decode(base64Image!)),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
        const SizedBox(height: 16),
        if (base64Image != null)
          ElevatedButton.icon(
            onPressed: onReupload,
            icon: const Icon(Icons.camera),
            label: const Text('Reupload Image'),
          ),
      ],
    );
  }
}
