import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF005461);   // Teal Gelap
  static const Color secondary = Color(0xFF249E94); // Teal Menengah
  static const Color accent = Color(0xFF3BC1A8);    // Teal Muda/Hijau Toska
  static const Color white = Color(0xFFFFFFFF);    // Putih Bersih

  static const Color background = Color(0xFFF8FAFA); // Putih Kebiruan
  static const Color textPrimary = Color(0xFF002D34); // Teal Sangat Gelap untuk teks
  static const Color textSecondary = Color(0xFF507D83);

  // Warna Status
  static const Color success = Color(0xFF4CAF50);
  static const Color error = Color(0xFFD32F2F);
  static const Color warning = Color(0xFFFBC02D);

  // Gradient
  static const LinearGradient gradientSecondaryToPrimary = LinearGradient(
    colors: [secondary, primary],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );

  static const LinearGradient gradientAccentToSecondary = LinearGradient(
    colors: [accent, secondary],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}
