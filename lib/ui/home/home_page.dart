import 'package:bhc_mobile/utils/constants.dart';
import 'package:bhc_mobile/utils/villages.dart';
import 'package:bhc_mobile/widgets/house/filter_options.dart';
import 'package:bhc_mobile/widgets/house/house_card.dart';
import 'package:bhc_mobile/widgets/search/custom_search_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:searchfield/searchfield.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FocusNode myFocusNode;
  HouseFilterOptions filterOption = HouseFilterOptions.added;
  List popularImages = [
    "assets/images/place2.jpg",
    "assets/images/place3.jpg",
    "assets/images/place4.jpg",
    "assets/images/place5.jpg",
    "assets/images/place6.jpg"
  ];

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
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Text(
                "Discover",
                style: Theme.of(context).textTheme.headlineMedium?.apply(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
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
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, int index) {
                  return HouseCard(
                    imageUrl: popularImages[index],
                  );
                },
              ),
            ),
          ],
        ));
  }
}
