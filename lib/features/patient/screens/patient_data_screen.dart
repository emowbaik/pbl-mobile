import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/custom_header.dart';
import '../widgets/patient_data_row.dart';

class PatientDataScreen extends StatefulWidget {
  const PatientDataScreen({super.key});

  @override
  State<PatientDataScreen> createState() => _PatientDataScreenState();
}

class _PatientDataScreenState extends State<PatientDataScreen> {
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primary, // Button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- 1. HEADER GLOBAL ---
              const CustomHeader(),
              const SizedBox(height: 32),

              // --- 2. JUDUL HALAMAN ---
              const Text(
                "Data Pasien",
                style: TextStyle(color: AppColors.accent, fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 2),
              const Text("Direktori Rekam Medis Pasien Terdaftar",
                  style: TextStyle(color: Colors.grey, fontSize: 12)),
              const SizedBox(height: 20),

              // --- 3. FILTER AREA (SEARCH & DATE) ---
              Row(
                children: [
                  // Search Box
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Cari berdasarkan No RM atau NIK",
                          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 12, right: 8),
                            child: Icon(Icons.search, color: Colors.grey.shade500, size: 20),
                          ),
                          prefixIconConstraints: const BoxConstraints(
                            minWidth: 30,
                            minHeight: 30,
                          ),
                          isDense: true,
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Date Picker Button
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: AppColors.gradientSecondaryToPrimary,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(color: AppColors.accent.withValues(alpha: 0.3), blurRadius: 8, offset: const Offset(0, 4)),
                        ],
                      ),
                      child: const Center(
                        child: Icon(Icons.calendar_today, color: Colors.white, size: 18),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // --- 4. TABEL REKAM MEDIS ---
              _buildPatientDataTable(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPatientDataTable() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 10)],
      ),
      child: Column(
        children: [
          // Header Teal Tabel
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            decoration: const BoxDecoration(
              gradient: AppColors.gradientSecondaryToPrimary,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Icon(Icons.list_alt, color: Colors.white, size: 16),
                    ),
                    const SizedBox(width: 10),
                    const Text("Rekam Medis", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                  ],
                ),
                Text(
                  DateFormat('dd MMMM yyyy').format(_selectedDate), 
                  style: const TextStyle(color: Colors.white70, fontSize: 10)
                ),
              ],
            ),
          ),

          // Scrollable Area Tabel
          RawScrollbar(
            thumbVisibility: true,
            thickness: 6,
            radius: const Radius.circular(10),
            thumbColor: Colors.grey,
            trackColor: Colors.grey.shade200,
            trackBorderColor: Colors.transparent,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                width: PatientDataRow.totalWidth,
                child: Column(
                  children: [
                    _buildTableHeader(),
                    // Menggunakan widget PatientDataRow
                    const PatientDataRow(
                      no: "RM-001", 
                      nama: "Budi Santoso", 
                      nik: "6371012345670001", 
                      tglLahir: "12 Ags 1978", 
                      gender: "Laki-laki", 
                      kunjungan: "20 Apr 2026\n(Poli Mata)", 
                      statusChip: "Selesai"
                    ),
                    const PatientDataRow(
                      no: "RM-002", 
                      nama: "Dewi Lestari", 
                      nik: "6371023456780002", 
                      tglLahir: "05 Nov 1996", 
                      gender: "Perempuan", 
                      kunjungan: "25 Apr 2026\n(Poli Umum)", 
                      statusChip: "Di dokter"
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        border: Border(bottom: BorderSide(color: Colors.grey.shade200))
      ),
      child: const Row(
        children: [
          SizedBox(width: PatientDataRow.colNo, child: Text("NO. RM", style: TextStyle(fontSize: 8, fontWeight: FontWeight.w700, color: Colors.grey))),
          SizedBox(width: PatientDataRow.colNama, child: Text("NAMA PASIEN", style: TextStyle(fontSize: 8, fontWeight: FontWeight.w700, color: Colors.grey))),
          SizedBox(width: PatientDataRow.colNIK, child: Text("NIK", style: TextStyle(fontSize: 8, fontWeight: FontWeight.w700, color: Colors.grey))),
          SizedBox(width: PatientDataRow.colTglLahir, child: Text("TANGGAL LAHIR", style: TextStyle(fontSize: 8, fontWeight: FontWeight.w700, color: Colors.grey))),
          SizedBox(width: PatientDataRow.colGender, child: Text("JENIS KELAMIN", style: TextStyle(fontSize: 8, fontWeight: FontWeight.w700, color: Colors.grey))),
          SizedBox(width: PatientDataRow.colKunjungan, child: Text("KUNJUNGAN TERAKHIR", style: TextStyle(fontSize: 8, fontWeight: FontWeight.w700, color: Colors.grey))),
          SizedBox(width: PatientDataRow.colStatus, child: Text("STATUS", textAlign: TextAlign.center, style: TextStyle(fontSize: 8, fontWeight: FontWeight.w700, color: Colors.grey))),
        ],
      ),
    );
  }
}
