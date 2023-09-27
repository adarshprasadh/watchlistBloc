// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlistsort/api_details/watchlistrseponsemodel.dart';
import 'package:watchlistsort/constants/constants.dart';
import 'package:watchlistsort/screen/sorting_bottomsheet.dart';
import 'package:watchlistsort/screen/watchlist_tabview.dart';
import 'package:watchlistsort/watchlist_bloc_logic/watchlist_bloc.dart';
import 'package:watchlistsort/watchlist_bloc_logic/watchlist_event.dart';
import 'package:watchlistsort/watchlist_bloc_logic/watchlist_state.dart';

class WatchlistDataUI extends StatefulWidget {
  const WatchlistDataUI({Key? key}) : super(key: key);

  @override
  State<WatchlistDataUI> createState() => _WatchlistDataUIState();
}

class _WatchlistDataUIState extends State<WatchlistDataUI> {
  late WatchlistFetchBloc watchlistFetchBloc;
  int currentSortOption = 0;
  List<WatchlistData>? watchlistData;

  @override
  void initState() {
    watchlistFetchBloc = WatchlistFetchBloc();
    watchlistFetchBloc.add(FetchWatchlistData());
    super.initState();
  }

  void handleSort(int selectedSortOption, bool isAscending) {
    watchlistFetchBloc.add(SortWatchlistData(
      selectedSortOption: selectedSortOption,
      isAscending: isAscending,
      dataList: watchlistData ?? [],
    ));
  }

  void SortingBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SortingBottomSheetContent(
          currentSortOption: currentSortOption,
          handleSort: handleSort,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => watchlistFetchBloc,
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 73, 139, 178),
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 85, 181, 198),
            title: Text(AppConstants.watchList),
            bottom: TabBar(
              labelColor: const Color.fromARGB(255, 240, 241, 243),
              unselectedLabelColor: Colors.black,
              tabs: [
                watchlistTabs(AppConstants.contactOneTab),
                watchlistTabs(AppConstants.contactTwoTab),
                watchlistTabs(AppConstants.contactThreeTab),
                watchlistTabs(AppConstants.contactFourTab),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.sort),
                color: const Color.fromARGB(255, 231, 232, 234),
                onPressed: () {
                  SortingBottomSheet(context);
                },
              ),
            ],
          ),
          body: BlocBuilder<WatchlistFetchBloc, WatchlistState>(
            builder: (context, state) {
              if (state is WatchlistInitial) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is WatchlistFetchData) {
                watchlistData = state.watchlistFetchData;

                return TabBarView(
                  children: <Widget>[
                    WatchlistTabview(data: watchlistData ?? []),
                    WatchlistTabview(data: watchlistData ?? []),
                    WatchlistTabview(data: watchlistData ?? []),
                    WatchlistTabview(data: watchlistData ?? []),
                  ],
                );
              } else if (state is WatchlistFetchError) {
                return noData(state.errorMessage);
              } else if (state is WatchlistSortedData) {
                List<WatchlistData> sortedData = state.sortedData;

                return TabBarView(
                  children: <Widget>[
                    WatchlistTabview(data: sortedData),
                    WatchlistTabview(data: sortedData),
                    WatchlistTabview(data: sortedData),
                    WatchlistTabview(data: sortedData),
                  ],
                );
              } else {
                return noData(AppConstants.noData);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget noData(String dataText) {
    return Center(
      child: Text(dataText),
    );
  }

  Widget watchlistTabs(String tabText) {
    return Tab(
      text: tabText,
    );
  }
}
