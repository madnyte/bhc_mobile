import 'package:bhc_mobile/utils/constants.dart';
import 'package:bhc_mobile/widgets/house/filter_options.dart';
import 'package:bhc_mobile/widgets/house/house_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 50, left: 20),
                child: Text(
                  "Discover",
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, top: 20),
                padding: const EdgeInsets.all(5.0),
                width: double.maxFinite,
                height: 100,
                child: FilterOptions(
                  selectedFilter: filterOption,
                  setFilter: setFilterOption,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Popular",
                    ),
                    Text("See all",
                        style: TextStyle(color: Colors.grey, height: 1.2))
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
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
              // Container(
              //   margin: const EdgeInsets.only(left: 20, top: 20, right: 20),
              //   child: const Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       Text(
              //         "Recommended",
              //       ),
              //       Text("See all",
              //           style: TextStyle(color: Colors.grey, height: 1.2))
              //     ],
              //   ),
              // ),
              // Container(
              //   margin: const EdgeInsets.all(20),
              //   width: double.maxFinite,
              //   height: 250,
              //   child: ListView.builder(
              //     itemCount: 5,
              //     scrollDirection: Axis.horizontal,
              //     itemBuilder: (_, int index) {
              //       return HouseCard(
              //         imageUrl: popularImages[index],
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
