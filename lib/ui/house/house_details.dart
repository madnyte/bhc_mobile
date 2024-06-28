import 'package:bhc_mobile/models/house.dart';
import 'package:bhc_mobile/services/authentication/auth.dart';
import 'package:bhc_mobile/widgets/house/details/house_feature.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:pocketbase/pocketbase.dart';

class HouseDetails extends StatefulWidget {
  const HouseDetails({super.key, required this.id});

  final String id;

  @override
  State<HouseDetails> createState() => _HouseDetailsState();
}

class _HouseDetailsState extends State<HouseDetails> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  Future<RecordModel?> getHouse() async {
    try {
      return await auth.collection('houses').getOne(widget.id);
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
          future: getHouse(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.data == null) {
              return const Center(
                child: Text('No Information Found.'),
              );
            }

            House? house = House.fromRecord(snapshot.data!);

            return CustomScrollView(
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
                          items: house.images
                              .map(
                                (item) => Image.network(
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
                        onPressed: () {
                          context.go('/');
                        },
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
                      house.payment_method == 'rent'
                          ? '${house.price}/month'
                          : house.price.toString(),
                      style: Theme.of(context).textTheme.labelLarge?.apply(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondaryContainer,
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
                          house.title,
                          style:
                              Theme.of(context).textTheme.headlineMedium?.apply(
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
                                house.location,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.apply(
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
                            HouseFeature(
                              feature: house.type,
                              icon: FontAwesomeIcons.house,
                            ),
                            HouseFeature(
                              feature: house.no_of_rooms.toString(),
                              icon: FontAwesomeIcons.bed,
                            ),
                            HouseFeature(
                              feature: house.no_of_bathrooms.toString(),
                              icon: FontAwesomeIcons.bath,
                            )
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
                          style:
                              Theme.of(context).textTheme.headlineSmall?.apply(
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
                          house.description,
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
            );
          },
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
