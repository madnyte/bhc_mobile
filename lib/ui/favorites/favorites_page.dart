import 'package:bhc_mobile/models/favorites.dart';
import 'package:bhc_mobile/models/house.dart';
import 'package:bhc_mobile/models/profile.dart';
import 'package:bhc_mobile/services/authentication/auth.dart';
import 'package:bhc_mobile/widgets/search/results/results_card.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pocketbase/pocketbase.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  Future<List<RecordModel?>?> getFavorites() async {
    final user = Profile.fromRecord(auth.authStore.model as RecordModel);

    try {
      return await auth.collection('favorites').getFullList(
            sort: '-created',
            expand: 'houses',
          );
    } on ClientException catch (e) {
      Fluttertoast.showToast(
        msg: 'Failed to get favorites',
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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
      body: FutureBuilder(
        future: getFavorites(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          Favorites? favorites = Favorites.fromRecord(snapshot.data![0]!);

          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20),
                  child: Text(
                    "Favorites",
                    style: Theme.of(context).textTheme.headlineMedium?.apply(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                        ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 20.0,
                  ),
                  height: double.maxFinite,
                  child: ListView.builder(
                    itemCount: favorites.houses?.length,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (_, int index) {
                      House house = House.fromRecord(favorites.houses![index]);
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: ResultsCard(
                          house: house,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
