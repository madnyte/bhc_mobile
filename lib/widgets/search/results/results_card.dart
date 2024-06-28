import 'package:bhc_mobile/models/house.dart';
import 'package:bhc_mobile/widgets/house/house_location.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ResultsCard extends StatefulWidget {
  const ResultsCard({
    super.key,
    required this.house,
  });

  final House house;

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
          context.go('/house/${widget.house.id}');
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
                        image: NetworkImage(widget.house.thumbnail),
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
                                widget.house.title,
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
                              child: HouseLocation(
                                  location: widget.house.location),
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
                  widget.house.payment_method == 'rent'
                      ? 'P${widget.house.price}/month'
                      : 'P ${widget.house.price}',
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
