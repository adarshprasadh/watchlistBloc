// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../api_details/watchlistrseponsemodel.dart';

class WatchlistTabview extends StatefulWidget {
  List<WatchlistData> data;
  WatchlistTabview({Key? key, required this.data}) : super(key: key);

  @override
  State<WatchlistTabview> createState() => _WatchlistTabviewState();
}

class _WatchlistTabviewState extends State<WatchlistTabview> {
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.data.length,
        itemBuilder: (context, index) {
          return Container(
            width: 300,
            height: 140,
            padding: const EdgeInsets.all(5),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 2,
              color: const Color.fromARGB(255, 241, 238, 238),
              child: ListTile(
                  title: showData(widget.data[index].name.toUpperCase(), 16,
                      FontWeight.bold, Colors.black),
                  subtitle: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: showData(widget.data[index].contacts, 13, FontWeight.bold,
                        Colors.black),
                  ),
                  trailing: const Padding(
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  )),
            ),
          );
        });
  }
}

Widget showData(String textData, double size, FontWeight weight, Color col) {
  return Text(
    textData,
    style: TextStyle(fontSize: size, fontWeight: weight, color: col),
  );
}

