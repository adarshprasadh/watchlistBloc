import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlistsort/api_details/Watchlist_response.dart';
import 'package:watchlistsort/api_details/watchlistrseponsemodel.dart';
import 'package:watchlistsort/constants/constants.dart';
import 'package:watchlistsort/watchlist_bloc_logic/watchlist_event.dart';
import 'package:watchlistsort/watchlist_bloc_logic/watchlist_state.dart';

class WatchlistFetchBloc extends Bloc<WatchlistEvent, WatchlistState> {
  late List<WatchlistData> watchlistFetchData;

  WatchlistResponse watchlistResponse = WatchlistResponse();

  WatchlistFetchBloc() : super(WatchlistInitial()) {
    on<WatchlistEvent>((event, emit) async {
      if (event is FetchWatchlistData) {
        try {
          watchlistFetchData = await watchlistResponse.fetchWatchlistData();
          if (watchlistFetchData.isEmpty) {
            emit(WatchlistFetchError(errorMessage: AppConstants.noData));
          } else {
            emit(WatchlistFetchData(watchlistFetchData: watchlistFetchData));
          }
        } catch (e) {
          emit(WatchlistFetchError(errorMessage: 'Error fetching data: $e'));
        }
      } else if (event is SortWatchlistData) {
        List<WatchlistData> sortedData = List.from(event.dataList);

        sortedData.sort((a, b) {
          if (event.selectedSortOption == 0) {
            return event.isAscending
                ? int.parse(a.id).compareTo(int.parse(b.id))
                : int.parse(b.id).compareTo(int.parse(a.id));
          } else if (event.selectedSortOption == 1) {
            return event.isAscending
                ? int.parse(b.id).compareTo(int.parse(a.id))
                : int.parse(a.id).compareTo(int.parse(b.id));
          } else if (event.selectedSortOption == 2) {
            return event.isAscending
                ? a.name.toLowerCase().compareTo(b.name.toLowerCase())
                : b.name.toLowerCase().compareTo(a.name.toLowerCase());
          } else if (event.selectedSortOption == 3) {
            return event.isAscending
                ? b.name.toLowerCase().compareTo(a.name.toLowerCase())
                : a.name.toLowerCase().compareTo(b.name.toLowerCase());
          }
          return 0;
        });

        emit(WatchlistSortedData(sortedData: sortedData));
      }
    });
  }
}
