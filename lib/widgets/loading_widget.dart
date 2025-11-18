import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          // Spinner dengan warna biru
          CircularProgressIndicator(
            color: Colors.blueAccent,
            strokeWidth: 4,
          ),
          SizedBox(height: 16),
          // Teks loading
          Text(
            "Loading data...",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}