import 'package:flutter/material.dart';

class WR_Loading extends StatelessWidget {
  const WR_Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: Colors.green),
    );
  }
}
