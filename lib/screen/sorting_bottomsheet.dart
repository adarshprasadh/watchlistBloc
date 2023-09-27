import 'package:flutter/material.dart';
import 'package:watchlistsort/constants/constants.dart';

class SortingBottomSheetContent extends StatelessWidget {
  final int currentSortOption;
  final Function(int, bool) handleSort;

  const SortingBottomSheetContent({super.key, 
    required this.currentSortOption,
    required this.handleSort,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    AppConstants.Sorting,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Padding(
                  padding:  const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      AppConstants.Done,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
               Text(
                  AppConstants.Numerical,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                const Spacer(),
                Expanded(
                  child: ListTile(
                    title:  Text(
                          AppConstants.Zerotonine,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                    onTap: () {
                      handleSort(0, true);
                      Navigator.pop(context);
                    },
                  ),
                ),
                const Spacer(),
                Expanded(
                  child: ListTile(
                    title: Text(
                          AppConstants.ninetozero,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                    onTap: () {
                      handleSort(1, true);
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                 Text(
                  AppConstants.Alphabetical,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                const Spacer(),
                Expanded(
                  child: ListTile(
                    title: Text(
                          AppConstants.atoz,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                    onTap: () {
                      handleSort(2, true);
                      Navigator.pop(context);
                    },
                  ),
                ),
                const Spacer(),
                Expanded(
                  child: ListTile(
                    title:  Text(
                          AppConstants.ztoa,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                    onTap: () {
                      handleSort(3, true);
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
