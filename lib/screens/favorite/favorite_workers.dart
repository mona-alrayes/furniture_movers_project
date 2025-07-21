import 'package:furniture_movers_project/screens/home/wedgit/worker_card.dart';

class FavoriteWorkers {
  static List<Worker> favorites = [];

  static void addToFavorites(Worker worker) {
    if (!favorites.contains(worker)) {
      favorites.add(worker);
    }
  }

  static void removeFromFavorites(Worker worker) {
    favorites.remove(worker);
  }

  static bool isFavorite(Worker worker) {
    return favorites.contains(worker);
  }
}
