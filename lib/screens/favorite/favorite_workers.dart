import 'package:furniture_movers_project/screens/furniture_moving/worker_model.dart';

class FavoriteWorkers {
  static List<WorkerModel> favorites = [];

  static void addToFavorites(WorkerModel worker) {
    if (!favorites.contains(worker)) {
      favorites.add(worker);
    }
  }

  static void removeFromFavorites(WorkerModel worker) {
    favorites.remove(worker);
  }

  static bool isFavorite(WorkerModel worker) {
    return favorites.contains(worker);
  }
}
