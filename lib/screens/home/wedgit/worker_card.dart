import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:furniture_movers_project/core/widgets/custom_button_hajz.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkerCard extends StatelessWidget {
  final String name;
  final String jobTitle;
  final String imagePath;
  final double rating;
  final VoidCallback onFavoritePressed;

  const WorkerCard({
    Key? key,
    required this.name,
    required this.jobTitle,
    required this.imagePath,
    required this.rating,
    required this.onFavoritePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: double.infinity,
      child: Card(
        color: AppColors.lightPrimaryGrey,
        elevation: 0,
        child: Row(
          children: [
            // الجزء الخاص بالصورة
            _buildImageSection(),
            // الجزء الخاص بالمعلومات والتقييم
            _buildInfoSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildImageSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              imagePath,
              width: 140,
              height: 140,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 140,
                height: 140,
                color: Colors.grey[300],
                child: Icon(Icons.person, size: 50),
              ),
            ),
          ),
          Positioned(
            top: 5,
            right: 5,
            child: GestureDetector(
              onTap: onFavoritePressed,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(4),
                child: Icon(
                  Icons.favorite_border,
                  size: 20,
                  color: AppColors.red,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name, style: GoogleFonts.almarai(fontSize: 14)),
            const SizedBox(height: 4),
            Text(
              jobTitle,
              style: GoogleFonts.almarai(
                fontSize: 16,
                color: AppColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            RatingBar.builder(
              initialRating: rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 20,
              itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
              itemBuilder: (context, _) =>
                  const Icon(Icons.star, color: Colors.amber),
              onRatingUpdate: (rating) {
                print('تم التقييم: $rating');
              },
            ),
            SizedBox(height: 20.h),
            // ElevatedButton(onPressed: () {}, child: Text("احجز الأن")),
            CustomBttonHajz(text: "أحجز الأن", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class WorkersList extends StatelessWidget {
  final List<Worker> workers;

  const WorkersList({Key? key, required this.workers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: workers.length,
      separatorBuilder: (context, index) => const SizedBox(height: 4),
      itemBuilder: (context, index) {
        final worker = workers[index];
        return WorkerCard(
          name: worker.name,
          jobTitle: worker.jobTitle,
          imagePath: worker.imagePath,
          rating: worker.rating,
          onFavoritePressed: () {
            print('تم إضافة ${worker.name} إلى المفضلة');
          },
        );
      },
    );
  }
}

class Worker {
  final String name;
  final String jobTitle;
  final String imagePath;
  final double rating;

  Worker({
    required this.name,
    required this.jobTitle,
    required this.imagePath,
    required this.rating,
  });
}
