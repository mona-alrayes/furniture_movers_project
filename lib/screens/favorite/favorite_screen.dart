import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/core/theme/colors.dart';
import 'package:furniture_movers_project/screens/home/wedgit/worker_card.dart';
import 'package:furniture_movers_project/screens/favorite/favorite_workers.dart';
import 'package:furniture_movers_project/screens/service/service.dart'; 

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    final favorites = FavoriteWorkers.favorites;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border(
              bottom: BorderSide(color: AppColors.regularGrey, width: 1),
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: Text(
              'المفضلة',
              style: GoogleFonts.almarai(
                fontSize: 18.sp,
                fontWeight: FontWeight.w800,
                color: AppColors.black,
              ),
            ),
          ),
        ),
      ),
      body: favorites.isEmpty
          ? Center(
              child: Text(
                "لا يوجد عناصر مفضلة",
                style: GoogleFonts.almarai(fontSize: 18.sp),
              ),
            )
          : ListView.separated(
              padding: EdgeInsets.all(16.w),
              itemCount: favorites.length,
              separatorBuilder: (_, __) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final worker = favorites[index];

                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ServiceDetails(workerId: worker.id!),
                      ),
                    );
                  },
                  child: WorkerCard(
                    worker: worker,
                    onFavoritePressed: () {
                      setState(() {
                        FavoriteWorkers.removeFromFavorites(worker);
                      });
                    },
                  ),
                );
              },
            ),
    );
  }
}
