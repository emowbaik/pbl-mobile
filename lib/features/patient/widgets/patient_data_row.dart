import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class PatientDataRow extends StatelessWidget {
  final String no;
  final String nama;
  final String nik;
  final String tglLahir;
  final String gender;
  final String kunjungan;
  final String statusChip;

  const PatientDataRow({
    super.key,
    required this.no,
    required this.nama,
    required this.nik,
    required this.tglLahir,
    required this.gender,
    required this.kunjungan,
    required this.statusChip,
  });

  // Konstanta Lebar Kolom (Disamakan dengan header di PatientDataScreen)
  static const double colNo = 70;
  static const double colNama = 120;
  static const double colNIK = 130;
  static const double colTglLahir = 100;
  static const double colGender = 100;
  static const double colKunjungan = 150;
  static const double colStatus = 80;
  static const double _horizontalPadding = 20; // Padding kiri 10 + kanan 10

  static const double totalWidth = colNo +
      colNama +
      colNIK +
      colTglLahir +
      colGender +
      colKunjungan +
      colStatus +
      _horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: totalWidth,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFEEEEEE))),
      ),
      child: Row(
        children: [
          SizedBox(width: colNo, child: Text(no, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600))),
          SizedBox(width: colNama, child: Text(nama, style: const TextStyle(fontSize: 10))),
          SizedBox(width: colNIK, child: Text(nik, style: const TextStyle(fontSize: 10, letterSpacing: 0.5))),
          SizedBox(width: colTglLahir, child: Text(tglLahir, style: const TextStyle(fontSize: 10))),
          SizedBox(width: colGender, child: Text(gender, style: const TextStyle(fontSize: 10))),
          SizedBox(width: colKunjungan, child: Text(kunjungan, style: const TextStyle(fontSize: 9, color: Colors.grey), maxLines: 2)),
          SizedBox(width: colStatus, child: _buildStatusChip(statusChip)),
        ],
      ),
    );
  }

  Widget _buildStatusChip(String label) {
    Color bgColor;
    Color textColor;

    switch (label.toLowerCase()) {
      case 'selesai':
        bgColor = const Color(0xFFE0E0E0);
        textColor = const Color(0xFF616161);
        break;
      case 'di dokter':
        bgColor = const Color(0xFFBBDEFB);
        textColor = const Color(0xFF1565C0);
        break;
      case 'menunggu':
        bgColor = const Color(0xFFFFE0B2);
        textColor = const Color(0xFFE65100);
        break;
      default:
        bgColor = AppColors.accent.withValues(alpha: 0.1);
        textColor = AppColors.accent;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 9,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),
      ),
    );
  }
}
