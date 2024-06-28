import 'dart:developer';

import 'package:bhc_mobile/models/house.dart';
import 'package:bhc_mobile/services/authentication/auth.dart';
import 'package:bhc_mobile/utils/constants.dart';
import 'package:bhc_mobile/utils/villages.dart';
import 'package:bhc_mobile/widgets/house/filter_options.dart';
import 'package:bhc_mobile/widgets/house/house_card.dart';
import 'package:bhc_mobile/widgets/search/custom_search_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:searchfield/searchfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _isLoading = false;
  late FocusNode myFocusNode;
  HouseFilterOptions filterOption = HouseFilterOptions.added;

  void setFilterOption(HouseFilterOptions filter) {
    setState(() {
      filterOption = filter;
    });
  }

  @override
  void initState() {
    super.initState();

    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }

  Future<List<RecordModel?>?> getHouses() async {
    setState(() {
      _isLoading = true;
    });

    try {
      return await auth.collection('houses').getFullList(sort: '-price');
    } on ClientException catch (e) {
      Fluttertoast.showToast(
        msg: 'Failed to get houses',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget searchChild(x) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            FaIcon(
              FontAwesomeIcons.locationDot,
              size: 14,
              color: Theme.of(context).colorScheme.secondary,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              x,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
        body: FutureBuilder(
          future: getHouses(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            List<House?> houses = snapshot.data?.map((item) {
              return House.fromRecord(item!);
            }).toList() as List<House>;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20),
                  child: Text(
                    "Discover",
                    style: Theme.of(context).textTheme.headlineMedium?.apply(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                        ),
                  ),
                ),
                CustomSearchBar(focusNode: myFocusNode),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  width: double.maxFinite,
                  height: 100,
                  child: FilterOptions(
                    selectedFilter: filterOption,
                    setFilter: setFilterOption,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 0, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Featured Houses",
                        style: Theme.of(context).textTheme.labelLarge?.apply(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondaryContainer,
                            ),
                      ),
                      const Text(
                        "VIew all",
                        style: TextStyle(
                          color: Colors.grey,
                          height: 1.2,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 20.0,
                  ),
                  width: double.maxFinite,
                  height: 425,
                  child: ListView.builder(
                    itemCount: houses.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, int index) {
                      return HouseCard(
                        house: houses[index]!,
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
