import 'dart:developer';

import 'package:bhc_mobile/widgets/house/house_location.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ResultsCard extends StatefulWidget {
  const ResultsCard(
      {super.key,
      required this.name,
      required this.location,
      required this.description,
      required this.imageUrl,
      required this.price});

  final String name;
  final String location;
  final String description;
  final String imageUrl;
  final double price;

  @override
  State<ResultsCard> createState() => _ResultsCardState();
}

class _ResultsCardState extends State<ResultsCard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: InkWell(
        onTap: () {
          log("tapped");
        },
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        splashColor: Theme.of(context).colorScheme.primaryContainer,
        enableFeedback: true,
        child: Stack(
          children: [
            Container(
              height: 225,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                        image: AssetImage(widget.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(
                                widget.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.apply(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryFixedVariant,
                                    ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: HouseLocation(location: widget.location),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 15.0),
                        padding: const EdgeInsets.all(8.0),
                        child: FaIcon(
                          FontAwesomeIcons.circleChevronRight,
                          size: 32,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: 10,
              left: 20,
              child: Chip(
                side: BorderSide.none,
                label: Text(
                  'P${widget.price}/month',
                  style: Theme.of(context).textTheme.labelLarge?.apply(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                ),
                elevation: 0,
                backgroundColor: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
