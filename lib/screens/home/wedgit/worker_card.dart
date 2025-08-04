import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:furniture_movers_project/core/theme/colors.dart';
import 'package:furniture_movers_project/core/widgets/custom_button_hajz.dart';
import 'package:furniture_movers_project/screens/service/service.dart';
import 'package:furniture_movers_project/screens/favorite/favorite_workers.dart';
import 'package:furniture_movers_project/screens/furniture_moving/worker_model.dart'; // تم التعديل

class WorkerCard extends StatelessWidget {
  final WorkerModel worker;
  final VoidCallback onFavoritePressed;

  const WorkerCard({
    Key? key,
    required this.worker,
    required this.onFavoritePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isFavorite = FavoriteWorkers.isFavorite(worker);

    return SizedBox(
      height: 160,
      width: double.infinity,
      child: Card(
        color: AppColors.lightPrimaryGrey,
        elevation: 0,
        child: Row(
          children: [_buildImageSection(isFavorite), _buildInfoSection()],
        ),
      ),
    );
  }

  Widget _buildImageSection(bool isFavorite) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              worker.imagePath,
              width: 140,
              height: 140,
              fit: BoxFit.cover,
              errorBuilder:
                  (context, error, stackTrace) => Container(
                    width: 140,
                    height: 140,
                    color: Colors.grey[300],
                    child: const Icon(Icons.person, size: 50),
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
                  isFavorite ? Icons.favorite : Icons.favorite_border,
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
            Text(worker.name, style: GoogleFonts.almarai(fontSize: 14)),
            const SizedBox(height: 4),
            Text(
              worker.jobTitle,
              style: GoogleFonts.almarai(
                fontSize: 16,
                color: AppColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8),
            RatingBar.builder(
              initialRating: worker.rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 20,
              itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
              itemBuilder:
                  (context, _) => const Icon(Icons.star, color: Colors.amber),
              onRatingUpdate: (rating) {
                print('تم التقييم: $rating');
              },
            ),
            SizedBox(height: 16.h),
            CustomBttonHajz(text: "أحجز الأن", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class WorkersList extends StatefulWidget {
  final List<WorkerModel> workers;

  const WorkersList({Key? key, required this.workers}) : super(key: key);

  @override
  State<WorkersList> createState() => _WorkersListState();
}

class _WorkersListState extends State<WorkersList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.workers.length,
      separatorBuilder: (context, index) => const SizedBox(height: 4),
      itemBuilder: (context, index) {
        final worker = widget.workers[index];
        return InkWell(
          onTap: () {
           // pass the worker id to serviceDetails
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
                if (FavoriteWorkers.isFavorite(worker)) {
                  FavoriteWorkers.removeFromFavorites(worker);
                  print('تم إزالة ${worker.name} من المفضلة');
                } else {
                  FavoriteWorkers.addToFavorites(worker);
                  print('تم إضافة ${worker.name} إلى المفضلة');
                }
              });
            },
          ),
        );
      },
    );
  }
}
