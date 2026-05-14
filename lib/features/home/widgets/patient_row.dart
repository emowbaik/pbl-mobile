import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class PatientRow extends StatelessWidget {
  final String noAntrian;
  final String nama;
  final String usiaJK;
  final String keluhan;
  final String jam;
  final String status;
  final bool isActionRequired;

  // Lebar kolom yang konsisten dengan header tabel
  static const double colNoAntrian = 80;
  static const double colNama = 120;
  static const double colUsia = 70;
  static const double colKeluhan = 160;
  static const double colJam = 70;
  static const double colStatus = 90;
  static const double colAksi = 90;
  static const double _horizontalPadding = 20; // padding kiri + kanan (10+10)
  static const double totalWidth =
      colNoAntrian +
      colNama +
      colUsia +
      colKeluhan +
      colJam +
      colStatus +
      colAksi +
      _horizontalPadding;

  const PatientRow({
    super.key,
    required this.noAntrian,
    required this.nama,
    required this.usiaJK,
    required this.keluhan,
    required this.jam,
    required this.status,
    this.isActionRequired = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: totalWidth,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Color(0xFFEEEEEE))),
      ),
      child: Row(
        children: [
          // No. Antrian
          SizedBox(
            width: colNoAntrian,
            child: Text(
              noAntrian,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
            ),
          ),

          // Nama Pasien
          SizedBox(
            width: colNama,
            child: Text(
              nama,
              style: const TextStyle(fontSize: 11),
              overflow: TextOverflow.ellipsis,
            ),
          ),

          // Usia/JK
          SizedBox(
            width: colUsia,
            child: Text(
              usiaJK,
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ),

          // Keluhan Utama
          SizedBox(
            width: colKeluhan,
            child: Text(
              keluhan,
              style: const TextStyle(fontSize: 10),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          // Jam Daftar
          SizedBox(
            width: colJam,
            child: Text(
              jam,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 11),
            ),
          ),

          // Status (Chip Style)
          Container(width: colStatus, padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4), child: _buildStatusChip(status)),

          // Aksi
          SizedBox(
            width: colAksi,
            child: isActionRequired
                ? Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: AppColors.gradientAccentToSecondary,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                        minimumSize: const Size(0, 28),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        "Asesmen",
                        style: TextStyle(
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                : const Text(
                    "Diteruskan",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
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
        bgColor = const Color(0xFFE0E0E0);
        textColor = const Color(0xFF616161);
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
