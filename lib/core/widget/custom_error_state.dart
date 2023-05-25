import 'package:flutter/material.dart';

class CustomErrorState extends StatelessWidget {
  const CustomErrorState({super.key, required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: Column(
              children: [
                const Icon(Icons.error_outline, size: 64.0),
                const SizedBox(
                  height: 24.0,
                ),
                Text(
                  'Duh, kamu tidak tersambung!',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 12.0),
                Text(
                  'Periksa kembali koneksi internet kamu agar kamu dapat belanja lagi',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: onRetry,
                child: Text(
                  'Retry',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
