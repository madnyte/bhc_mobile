import 'package:bhc_mobile/widgets/house/details/house_actions.dart';
import 'package:bhc_mobile/widgets/house/details/house_feature.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const List imageSlider = [
  "assets/images/place2.jpg",
  "assets/images/place3.jpg",
  "assets/images/place4.jpg",
  "assets/images/place5.jpg",
  "assets/images/place6.jpg"
];

class HouseDetails extends StatefulWidget {
  const HouseDetails({super.key});

  @override
  State<HouseDetails> createState() => _HouseDetailsState();
}

class _HouseDetailsState extends State<HouseDetails> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  List<Widget> _getItems() {
    List<Card> _cards = [];
    for (int i = 1; i <= 50; i++) {
      _cards.add(Card(
        margin: EdgeInsets.all(8.0),
        child: ListTile(
          title: Text("items: $i"),
        ),
      ));
    }
    return _cards;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar.large(
              centerTitle: true,
              backgroundColor:
                  Theme.of(context).colorScheme.surfaceContainerLow,
              snap: true,
              pinned: false,
              floating: true,
              expandedHeight: 400.0,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                background: Column(children: [
                  Expanded(
                    child: CarouselSlider(
                      items: imageSlider
                          .map(
                            (item) => Image.asset(
                              item,
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width,
                            ),
                          )
                          .toList(),
                      carouselController: _controller,
                      options: CarouselOptions(
                          autoPlay: true,
                          height: MediaQuery.of(context).size.height,
                          viewportFraction: 1.0,
                          disableCenter: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          }),
                    ),
                  )
                ]),
                collapseMode: CollapseMode.pin,
              ),
              leading: Container(
                margin: const EdgeInsets.only(
                  left: 10.0,
                ),
                child: Center(
                  child: MaterialButton(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.white,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    height: 40,
                    minWidth: 40,
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
              title: Chip(
                side: BorderSide.none,
                label: Text(
                  'P3500/month',
                  style: Theme.of(context).textTheme.labelLarge?.apply(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                ),
                elevation: 0,
                backgroundColor: Colors.white,
              ),
              actions: [
                Container(
                  margin: const EdgeInsets.only(
                    right: 10.0,
                  ),
                  child: Center(
                    child: MaterialButton(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.white,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      height: 40,
                      minWidth: 40,
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      top: 10.0,
                      right: 20.0,
                    ),
                    child: Text(
                      "3 Bedroom House",
                      style: Theme.of(context).textTheme.headlineMedium?.apply(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      top: 10.0,
                      right: 20.0,
                    ),
                    child: Row(
                      children: [
                        const FaIcon(
                          FontAwesomeIcons.locationDot,
                          size: 16,
                          color: Colors.black26,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Text(
                            'Phase 2, Gaborone',
                            overflow: TextOverflow.ellipsis,
                            style:
                                Theme.of(context).textTheme.titleMedium?.apply(
                                      color: Colors.black26,
                                    ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      top: 10.0,
                      right: 20.0,
                    ),
                    width: double.maxFinite,
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        HouseFeature(),
                        HouseFeature(),
                        HouseFeature()
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 20.0, top: 10.0, right: 20.0),
                    child: Text(
                      "Details",
                      style: Theme.of(context).textTheme.headlineSmall?.apply(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        left: 20.0, top: 10.0, right: 20.0),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec ornare turpis quis libero feugiat, non tincidunt ipsum malesuada. Ut at ante quis neque luctus congue et sit amet leo. Integer odio leo, vulputate ut sagittis venenatis, lacinia ut ipsum. Suspendisse eu ante consequat, venenatis nunc in, pellentesque neque. Nullam tempor id lorem at gravida. Maecenas scelerisque eros id ligula rhoncus congue. Nunc rutrum diam in leo laoreet pulvinar. Integer odio augue, facilisis facilisis felis elementum, cursus fringilla tellus.",
                      style: Theme.of(context).textTheme.bodyMedium?.apply(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
                          ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          icon: const Icon(
            Icons.attach_file,
            size: 20,
          ),
          label: Text(
            'Apply',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      ),
    );
  }
}
