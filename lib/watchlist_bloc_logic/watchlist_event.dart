
import 'package:watchlistsort/api_details/watchlistrseponsemodel.dart';

abstract class WatchlistEvent {
  const WatchlistEvent();
}

class FetchWatchlistData extends WatchlistEvent {}

class SortWatchlistData extends WatchlistEvent {
  final List<WatchlistData> dataList; 
  final int selectedSortOption;
  final bool isAscending;

  SortWatchlistData({
    required this.dataList,
    required this.selectedSortOption,
    required this.isAscending,
  });
}
