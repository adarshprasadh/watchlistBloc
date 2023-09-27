import '../api_details/watchlistrseponsemodel.dart';

class WatchlistState {}

class WatchlistInitial extends WatchlistState {}

class WatchlistFetchData extends WatchlistState {
  final List<WatchlistData> watchlistFetchData;
  
  WatchlistFetchData({
    required this.watchlistFetchData,
  });
}

class WatchlistFetchError extends WatchlistState {
  final String errorMessage;
  
  WatchlistFetchError({
    required this.errorMessage,
  });
}

class WatchlistSortedData extends WatchlistState {
  final List<WatchlistData> sortedData;
  
  WatchlistSortedData({
    required this.sortedData,
  });
}
