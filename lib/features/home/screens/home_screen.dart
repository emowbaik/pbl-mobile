import 'package:flutter/material.dart';
import 'package:dice_bear/dice_bear.dart';
import '../../../core/constants/app_colors.dart';
import '../widgets/patient_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              _buildHeader(),
              const SizedBox(height: 32),

              // --- JUDUL SEKSI ---
              const Text(
                "Antrian Poli Mata",
                style: TextStyle(
                  color: AppColors.accent,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 2),
              const Text(
                "Konfirmasi & Asesmen Pasien",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),

              // --- KARTU ANTRIAN UTAMA (HIGHLIGHT) ---
              _buildHighlightCard(),
              const SizedBox(height: 20),

              // --- STATISTIK RINGKAS ---
              _buildStatisticsRow(),
              const SizedBox(height: 22),

              // --- TABEL DAFTAR ANTRIAN ---
              _buildQueueTable(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      // Bottom navigation sekarang dikelola oleh MainNavWrapper
    );
  }

  // === HEADER ===
  Widget _buildHeader() {
    // Membuat avatar DiceBear dengan style Initials
    final avatarRequest = DiceBearRequest(
      style: DiceBearStyle.initials,
      coreOptions: DiceBearCoreOptions(
        seed: 'admin', // Seed deterministik: selalu menghasilkan avatar yang sama
      ),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Logo kiri
        Row(
          children: [
            Image.asset(
              'assets/images/logo_color.png',
              height: 40,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: AppColors.accent.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.local_hospital, color: AppColors.accent, size: 24),
                );
              },
            ),
            const SizedBox(width: 10),
          ],
        ),
        // Profil kanan — Avatar DiceBear
        ClipOval(
          child: Container(
            width: 40,
            height: 40,
            color: AppColors.accent.withValues(alpha: 0.15),
            child: avatarRequest.toImage(
              width: 40,
              height: 40,
              fit: BoxFit.cover,
              placeholderBuilder: (context) => const Icon(
                Icons.person,
                color: AppColors.accent,
                size: 24,
              ),
            ),
          ),
        ),
      ],
    );
  }

  // === KARTU UTAMA (A-003) ===
  Widget _buildHighlightCard() {
    return Container(
      decoration: BoxDecoration(
        gradient: AppColors.gradientSecondaryToPrimary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.all(1.5),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.5),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ==========================================
              // KOLOM KIRI: Nomor Antrian + Tombol Konfirmasi
              // ==========================================
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Nomor Antrian
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.accent.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "A-003",
                      style: TextStyle(
                        color: AppColors.accent,
                        fontSize: 38,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // Tombol Konfirmasi
                  Container(
                    decoration: BoxDecoration(
                      gradient: AppColors.gradientSecondaryToPrimary,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        elevation: 0,
                      ),
                      child: const Text(
                        "Konfirmasi &\nMulai Asesmen",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 16),

              // ==========================================
              // KOLOM KANAN: Info Pasien + Waktu Tunggu + Tombol Panggil
              // ==========================================
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Baris Info: Nama + Waktu Tunggu
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Info Pasien
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Siti Rahayu, 34 th", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Colors.black)),
                              Text("No RM: 2024-003", style: TextStyle(color: Colors.grey, fontSize: 11)),
                            ],
                          ),
                        ),
                        // Waktu Tunggu
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("MENUNGGU", style: TextStyle(fontSize: 8, color: Colors.grey, fontWeight: FontWeight.bold)),
                            Text("7 Menit", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
                            Text("Waktu Tunggu", style: TextStyle(fontSize: 8, color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    // Tombol Panggil Pasien (full width kolom kanan)
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          side: BorderSide(color: Colors.grey.shade400),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        ),
                        child: const Text(
                          "Panggil Pasien",
                          style: TextStyle(fontSize: 11, color: Colors.black54, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // === STATISTIK RINGKAS ===
  Widget _buildStatisticsRow() {
    return Row(
      children: [
        Expanded(
          child: _buildStatCard("TOTAL ANTRIAN", "12", "Hari Ini"),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildStatCard("MENUNGGU", "03", "Belum dipanggil"),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildStatCard("SELESAI ASESMEN", "07", "Dilanjutkan ke dokter"),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _buildStatCard("SEDANG DILAYANI", "02", "Di dokter"),
        ),
      ],
    );
  }

  Widget _buildStatCard(String title, String value, String sub) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 7,
              fontWeight: FontWeight.w700,
              color: Colors.grey,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            sub,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 7, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  // === TABEL ANTRIAN ===
  Widget _buildQueueTable() {
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
          // Header Tabel (tetap full-width, tidak ikut scroll)
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
                  child: const Icon(Icons.list_alt_rounded, color: Colors.white, size: 16),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Text(
                    "Daftar Antrian Poli Umum",
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

          // Area scroll horizontal untuk header kolom + data
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
                  Container(
                    width: PatientRow.totalWidth,
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade200),
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: PatientRow.colNoAntrian,
                          child: const Text(
                            "NO. ANTRIAN",
                            style: TextStyle(fontSize: 8, fontWeight: FontWeight.w700, color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          width: PatientRow.colNama,
                          child: const Text(
                            "NAMA PASIEN",
                            style: TextStyle(fontSize: 8, fontWeight: FontWeight.w700, color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          width: PatientRow.colUsia,
                          child: const Text(
                            "USIA/JK",
                            style: TextStyle(fontSize: 8, fontWeight: FontWeight.w700, color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          width: PatientRow.colKeluhan,
                          child: const Text(
                            "KELUHAN UTAMA",
                            style: TextStyle(fontSize: 8, fontWeight: FontWeight.w700, color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          width: PatientRow.colJam,
                          child: const Text(
                            "JAM",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 8, fontWeight: FontWeight.w700, color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          width: PatientRow.colStatus,
                          child: const Text(
                            "STATUS",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 8, fontWeight: FontWeight.w700, color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          width: PatientRow.colAksi,
                          child: const Text(
                            "AKSI",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 8, fontWeight: FontWeight.w700, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Data Pasien (Dinamis menggunakan ListView.builder)
                  SizedBox(
                    width: PatientRow.totalWidth,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return PatientRow(
                          noAntrian: "A-${(index + 1).toString().padLeft(3, '0')}",
                          nama: index % 2 == 0 ? "Budi Santoso" : "Dewi Lestari",
                          usiaJK: index % 2 == 0 ? "45 th/L" : "29 th/P",
                          keluhan: index == 2
                              ? "Benjolan di kelopak mata"
                              : "Penglihatan saya buram",
                          jam: "08:${(10 + index).toString().padLeft(2, '0')}",
                          status: index < 2 ? "Selesai" : (index == 2 ? "Di dokter" : "Menunggu"),
                          isActionRequired: index > 2,
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
}
