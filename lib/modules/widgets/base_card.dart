import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ponto_app/modules/ui/base.dart';

class BaseCard extends AppWidget {
  final Widget child;
  const BaseCard({super.key, required this.child});

  @override
  Widget builder(context, theme) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(6, 5),
            blurRadius: 10,
            spreadRadius: 0.1,
          ),
        ],
      ),
      child: child,
    );
  }
}