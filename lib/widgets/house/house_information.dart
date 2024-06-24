import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'facilities.dart';

class HouseInformation extends StatelessWidget {
  HouseInformation({super.key, required this.imageUrl});
  final String imageUrl;

  final List icons = [
    FontAwesomeIcons.bed,
    FontAwesomeIcons.shower,
    FontAwesomeIcons.wifi,
    FontAwesomeIcons.wifi,
    FontAwesomeIcons.wifi
  ];

  final List desc = [
    "3 bedrooms",
    "2 bathrooms",
    "available",
    "available",
    "1 bar"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.maxFinite,
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(imageUrl), fit: BoxFit.cover)),
                  )),
              Positioned(
                  left: 30,
                  top: 40,
                  child: InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: const FaIcon(
                      FontAwesomeIcons.circleChevronLeft,
                      color: Colors.grey,
                    ),
                  )),
              Positioned(
                  top: 270,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Single Villa",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                              Text(
                                "\$ 280k",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.locationDot,
                                size: 16,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Phnom Penph",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.grey),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            width: double.maxFinite,
                            child: Text(
                              "Facilities",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 100,
                            width: double.maxFinite,
                            child: ListView.builder(
                              itemCount: 5,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, int index) {
                                return Facilities(
                                  facilityInfo: desc[index],
                                  icon: icons[index],
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const SizedBox(
                            width: double.maxFinite,
                            child: Text(
                              "Description",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Illum cupiditate, qui dolore excepturi exercitationem velit soluta earum adipisci, commodi vero minus pariatur autem ipsum fuga quo dolor asperiores dignissimos libero, a vel id eius ut. Id doloribus necessitatibus animi error, tempore nemo, quibusdam veniam, consequatur laboriosam aut quidem deleniti cumque cum odio voluptas ipsum distinctio. At, ab. Minima, eum? Repudiandae hic, debitis repellendus quo eos exercitationem id quod officia illum?",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
