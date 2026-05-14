import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../core/constants/app_colors.dart';
import '../../../shared/widgets/main_nav_wrapper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // State untuk melacak peran yang dipilih
  String selectedRole = 'Perawat';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login_bg.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(height: 40),
                Image.asset('assets/images/logo_white.png', height: 60),

                const SizedBox(height: 40),
                const Text(
                  "Selamat Datang",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Pilih peran dan poli anda untuk melanjutkan",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.white, fontSize: 14),
                ),

                const SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => selectedRole = 'Perawat'),
                        child: _buildRoleButton(
                          FontAwesomeIcons.userNurse, 
                          "Perawat",
                          selectedRole == 'Perawat',
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => selectedRole = 'Dokter'),
                        child: _buildRoleButton(
                          FontAwesomeIcons.userDoctor, 
                          "Dokter",
                          selectedRole == 'Dokter',
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),
                _buildInputField("Nama Pengguna", "Masukan nama pengguna anda"),
                const SizedBox(height: 20),
                _buildInputField("Kata Sandi", "Masukan kata sandi anda", isPassword: true),
                const SizedBox(height: 20),
                _buildInputField("Poli", "Pilih poli anda", isDropdown: true),

                const SizedBox(height: 40),
                Center(
                  child: Container(
                    width: 150,
                    height: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.15),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const MainNavWrapper()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.white.withValues(alpha: 0.2),
                        foregroundColor: AppColors.white,
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: AppColors.white.withValues(alpha: 0.5)),
                        ),
                      ),
                      child: const Text("Masuk", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),

                const SizedBox(height: 15),
                TextButton(
                  onPressed: () {},
                  child: const Text("Lupa kata sandi?", style: TextStyle(color: AppColors.white, fontSize: 12)),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget Helper untuk Input Field
  Widget _buildInputField(String label, String hint, {bool isPassword = false, bool isDropdown = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: AppColors.white, fontWeight: FontWeight.bold, fontSize: 14)),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.15),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextField(
            obscureText: isPassword,
            style: const TextStyle(color: AppColors.white),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: AppColors.white.withValues(alpha: 0.6), fontSize: 13),
              filled: true,
              fillColor: AppColors.white.withValues(alpha: 0.2),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              suffixIcon: isDropdown ? const Icon(Icons.keyboard_arrow_down, color: AppColors.white) : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: AppColors.white.withValues(alpha: 0.3)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: AppColors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // Widget Helper untuk Tombol Peran
  Widget _buildRoleButton(IconData icon, String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.white.withValues(alpha: 0.3) : AppColors.white.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? AppColors.white : AppColors.white.withValues(alpha: 0.3),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: AppColors.white, size: 20),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: AppColors.white,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal
            )
          ),
        ],
      ),
    );
  }
}
