import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/custom_header.dart';
import '../widgets/history_row.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- HEADER ---
              const CustomHeader(),
              const SizedBox(height: 32),

              // --- TITLE ---
              const Text(
                "Riwayat Asesmen",
                style: TextStyle(
                  color: AppColors.accent,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                "Hasil asesmen perawat yang sudah diselesaikan hari ini",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),

              // --- TABEL RIWAYAT ---
              _buildHistoryTable(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }



  // === TABEL RIWAYAT ASESMEN ===
  Widget _buildHistoryTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header Teal
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: const BoxDecoration(
              gradient: AppColors.gradientSecondaryToPrimary,
              borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Icon(Icons.assignment_turned_in, color: Colors.white, size: 16),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    "Asesmen Selesai Hari Ini",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                const Text(
                  "Sabtu, 25 April 2026",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),

          // Scrollable Area
          RawScrollbar(
            thumbVisibility: true,
            trackVisibility: true,
            thickness: 6.0,
            radius: const Radius.circular(10),
            thumbColor: Colors.grey,
            trackColor: Colors.grey.shade200,
            trackBorderColor: Colors.transparent,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  // Header Kolom (Label)
                  _buildTableHeader(),

                  // Data Riwayat (Dinamis menggunakan ListView.builder)
                  SizedBox(
                    width: HistoryRow.totalWidth,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _historyData.length,
                      itemBuilder: (context, index) {
                        final data = _historyData[index];
                        return HistoryRow(
                          noAntrian: data['noAntrian']!,
                          nama: data['nama']!,
                          td: data['td']!,
                          fisik: data['fisik']!,
                          suhu: data['suhu']!,
                          spo2: data['spo2']!,
                          catatan: data['catatan']!,
                          status: data['status']!,
                        );
                      },
                    ),
                  ),

                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      width: HistoryRow.totalWidth,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: const Row(
        children: [
          SizedBox(
            width: HistoryRow.colNo,
            child: Text("NO. ANTRIAN",
                style: TextStyle(fontSize: 8, fontWeight: FontWeight.w700, color: Colors.grey)),
          ),
          SizedBox(
            width: HistoryRow.colNama,
            child: Text("NAMA PASIEN",
                style: TextStyle(fontSize: 8, fontWeight: FontWeight.w700, color: Colors.grey)),
          ),
          SizedBox(
            width: HistoryRow.colTD,
            child: Text("TD",
                style: TextStyle(fontSize: 8, fontWeight: FontWeight.w700, color: Colors.grey)),
          ),
          SizedBox(
            width: HistoryRow.colFisik,
            child: Text("BB/TB/BMI",
                style: TextStyle(fontSize: 8, fontWeight: FontWeight.w700, color: Colors.grey)),
          ),
          SizedBox(
            width: HistoryRow.colSuhu,
            child: Text("SUHU",
                style: TextStyle(fontSize: 8, fontWeight: FontWeight.w700, color: Colors.grey)),
          ),
          SizedBox(
            width: HistoryRow.colSpO2,
            child: Text("SpO2",
                style: TextStyle(fontSize: 8, fontWeight: FontWeight.w700, color: Colors.grey)),
          ),
          SizedBox(
            width: HistoryRow.colCatatan,
            child: Text("CATATAN",
                style: TextStyle(fontSize: 8, fontWeight: FontWeight.w700, color: Colors.grey)),
          ),
          SizedBox(
            width: HistoryRow.colStatus,
            child: Text("STATUS",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 8, fontWeight: FontWeight.w700, color: Colors.grey)),
          ),
        ],
      ),
    );
  }

  // === DATA DUMMY RIWAYAT ===
  static final List<Map<String, String>> _historyData = [
    {
      'noAntrian': 'A-001',
      'nama': 'Budi Santoso',
      'td': '110/80 mmHg',
      'fisik': '70 kg/ 170 cm/ 27.6',
      'suhu': '36.7°C',
      'spo2': '98 bpm',
      'catatan': 'Penglihatan buram saat sore hari',
      'status': 'Selesai',
    },
    {
      'noAntrian': 'A-002',
      'nama': 'Dewi Lestari',
      'td': '120/85 mmHg',
      'fisik': '58 kg/ 158 cm/ 20.0',
      'suhu': '37.6°C',
      'spo2': '87 bpm',
      'catatan': 'Mata merah dan berair',
      'status': 'Di dokter',
    },
    {
      'noAntrian': 'A-003',
      'nama': 'Siti Rahayu',
      'td': '130/90 mmHg',
      'fisik': '65 kg/ 160 cm/ 25.4',
      'suhu': '36.5°C',
      'spo2': '96 bpm',
      'catatan': 'Keluhan penglihatan ganda sejak 2 hari lalu',
      'status': 'Selesai',
    },
    {
      'noAntrian': 'A-004',
      'nama': 'Ahmad Fadil',
      'td': '115/75 mmHg',
      'fisik': '80 kg/ 175 cm/ 26.1',
      'suhu': '36.8°C',
      'spo2': '99 bpm',
      'catatan': 'Benjolan di kelopak mata kanan',
      'status': 'Selesai',
    },
    {
      'noAntrian': 'A-005',
      'nama': 'Rina Wulandari',
      'td': '108/70 mmHg',
      'fisik': '52 kg/ 155 cm/ 21.6',
      'suhu': '37.1°C',
      'spo2': '97 bpm',
      'catatan': 'Mata kering dan perih',
      'status': 'Di dokter',
    },
  ];
}
