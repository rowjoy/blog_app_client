// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppLodder extends StatelessWidget {
  const AppLodder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
         strokeWidth: 2.0,
      ),
    );
  }
}