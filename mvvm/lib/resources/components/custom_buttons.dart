import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {
  final String? title;
  final VoidCallback onTap;
  final bool loading;
  const CustomButtons({
    super.key,
    required this.title,
    required this.onTap,
    required this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(5),
        ),
        height: 35,
        width: 120,
        child: Center(
          child: loading
              ? CircularProgressIndicator(color: Colors.white)
              : Text(title!, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
