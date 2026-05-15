import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class HistoryRow extends StatelessWidget {
  final String noAntrian;
  final String nama;
  final String td;
  final String fisik; // BB/TB/BMI
  final String suhu;
  final String spo2;
  final String catatan;
  final String status;

  // Konstanta Lebar Kolom agar sejajar antara Header dan Row
  static const double colNo = 60;
  static const double colNama = 120;
  static const double colTD = 80;
  static const double colFisik = 120; // BB/TB/BMI
  static const double colSuhu = 60;
  static const double colSpO2 = 60;
  static const double colCatatan = 150;
  static const double colStatus = 80;
  static const double _horizontalPadding = 20; // padding kiri + kanan (10+10)
  static const double totalWidth =
      colNo +
      colNama +
      colTD +
      colFisik +
      colSuhu +
      colSpO2 +
      colCatatan +
      colStatus +
      _horizontalPadding;

  const HistoryRow({
    super.key,
    required this.noAntrian,
    required this.nama,
    required this.td,
    required this.fisik,
    required this.suhu,
    required this.spo2,
    required this.catatan,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: totalWidth,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFEEEEEE))),
      ),
      child: Row(
        children: [
          // No. Antrian
          SizedBox(
            width: colNo,
            child: Text(
              noAntrian,
              style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
            ),
          ),

          // Nama Pasien
          SizedBox(
            width: colNama,
            child: Text(
              nama,
              style: const TextStyle(fontSize: 10),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          // Tekanan Darah
          SizedBox(
            width: colTD,
            child: Text(
              td,
              style: const TextStyle(fontSize: 10),
            ),
          ),

          // BB/TB/BMI
          SizedBox(
            width: colFisik,
            child: Text(
              fisik,
              style: const TextStyle(fontSize: 10),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          // Suhu
          SizedBox(
            width: colSuhu,
            child: Text(
              suhu,
              style: const TextStyle(fontSize: 10),
            ),
          ),

          // SpO2
          SizedBox(
            width: colSpO2,
            child: Text(
              spo2,
              style: const TextStyle(fontSize: 10),
            ),
          ),

          // Catatan
          SizedBox(
            width: colCatatan,
            child: Text(
              catatan,
              style: const TextStyle(fontSize: 9),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          // Status Chip
          SizedBox(
            width: colStatus,
            child: _buildStatusChip(status),
          ),
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
