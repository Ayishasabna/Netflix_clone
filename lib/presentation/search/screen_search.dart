import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/presentation/search/widgets/search_idle.dart';
import 'package:netflix_clone/presentation/search/widgets/search_result.dart';

class ScreenSearch extends StatefulWidget {
  ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    TextEditingController _searchController = TextEditingController();
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              //controller: _searchController,
              onChanged: (value) {
                setState(() {
                  query = value;
                  // print(query);
                });
              },
              backgroundColor: Colors.grey.withOpacity(0.4),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(
                CupertinoIcons.xmark_circle_fill,
                color: Colors.grey,
              ),
              style: const TextStyle(color: kWhiteColor),
            ),
            Expanded(
              child: query.isEmpty
                  ? SearchIdleWidget()
                  : SearchResultWidget(
                      apiQuery: query,
                    ),
            ),
            //  Visibility(visible: query.isEmpty, child: SearchIdleWidget()),
            // Visibility(visible: query.isNotEmpty, child: SearchResultWidget()),
          ],
        ),
      )),
    );
  }
}
