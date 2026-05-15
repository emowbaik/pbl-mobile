import 'package:flutter/material.dart';
import 'package:dice_bear/dice_bear.dart';
import '../../core/constants/app_colors.dart';

/// Widget header global yang dipakai di lebih dari satu fitur.
/// Menampilkan logo aplikasi di kiri dan avatar profil di kanan.
class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
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
}
