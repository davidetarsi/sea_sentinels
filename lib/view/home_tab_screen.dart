import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sea_sentinels/model/diving_model.dart';
import 'package:sea_sentinels/providers/diving_provider.dart';
import 'package:sea_sentinels/repositories/diving_repository.dart';
import 'package:sea_sentinels/repositories/fish_repository.dart';
import 'package:sea_sentinels/view/collection_screen.dart';
import 'package:sea_sentinels/view/diving_information_screen.dart';
import 'package:sea_sentinels/view/map_screen.dart';
import 'package:sea_sentinels/constants.dart';
import 'package:sea_sentinels/view/new_diving_screen.dart';
import 'package:sea_sentinels/view/profile_screen.dart';
import 'package:sea_sentinels/view/widget/logo.dart';
import 'package:sea_sentinels/viewmodel/home_view_model.dart';

part 'home_tab_screen.g.dart';

@Riverpod()
Future<List<Diving>> getAllDives(GetAllDivesRef ref) async {
  final divingRepository = await ref.watch(divingRepositoryProvider.future);

  final dives = await divingRepository.getAllDives();

  return dives;
}

class HomeTabScreen extends ConsumerStatefulWidget {
  const HomeTabScreen({super.key});

  @override
  ConsumerState<HomeTabScreen> createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends ConsumerState<HomeTabScreen> {
  var mapController = MapController();

  /* void _onMapCreated(gmaps.GoogleMapController controller) {
    _mapController = controller;
  } */
  int _selectedPageIndex = 1;

  void selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void addDiving() async {
    //insertProva();
    //ref.read(divingProvider.notifier).resetData();
    Diving? newDiving = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) {
          return const NewDivingSurveyScreen();
        },
      ),
    );
    if (newDiving == null) {
      print('!!!!!!!!!!!!!!!!!!!!!!newDiving is null!!!!!!!!!!!!!!!!!!!!!');
      return;
    }
    //TODO adding a dive
    /* final divingRepositoryAsync = ref.watch(divingRepositoryProvider);
    final fishRepositoryAsync = ref.watch(fishRepositoryProvider); */
    final divingRepository = await ref.watch(divingRepositoryProvider.future);
    final fishRepository = await ref.watch(fishRepositoryProvider.future);

    divingRepository.addDiving(newDiving);
    fishRepository.updateFishCollection(newDiving.fishList);

    ref.invalidate(divingRepositoryProvider);
    ref.invalidate(divingNotifierProvider);
  }

  void center(MapController controller, WidgetRef ref) async {
    controller.move(const LatLng(44.49389254584445, 11.342627064157739), 5.2);
    List<Diving> dives = await ref.read(getAllDivesProvider.future);
    final user = await FirebaseAuth.instance.currentUser;
    print('user id: ${user!.uid}');
    ref.invalidate(divingRepositoryProvider);
    final dd = await ref.read(divingRepositoryProvider.future);
    if (dives.isNotEmpty) {
      for (Diving dive in dives) {
        print("Diving id: " + dive.id);
        print('Diving toString: ' + dive.toString());
        print('Diving json: ' + dive.toJson().toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final divesAsyc = ref.watch(getAllDivesProvider);
    final divingRepositoryAsync = ref.watch(divingRepositoryProvider);
    final bool isConnected = ref.watch(connectivityProvider);

    //dives provider

    //dives provider
    //dives provider

    Widget mapScreen = divesAsyc.when(
      data: (dives) {
        // Handle the data state
        final markers = dives.map((diving) {
          return Marker(
            point: diving.position,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  ModalBottomSheetRoute(
                    isScrollControlled: true,
                    builder: (ctx) {
                      return LayoutBuilder(
                        builder:
                            (BuildContext ctx, BoxConstraints constraints) =>
                                SizedBox(
                          height: constraints.maxHeight * 0.8,
                          child: DivingInformations(diving: diving),
                        ),
                      );
                    },
                  ),
                );
              },
              child: mapIcon,
            ),
          );
        }).toList();

        return MapScreen(markers: markers, controller: mapController);
      },
      error: (err, stack) => Center(child: Text('Error: $err')),
      loading: () => const Center(child: CircularProgressIndicator()),
    );

    Widget currentPage = isConnected
        ? mapScreen
        : const Center(
            child: Text('No connection'),
          );

    Widget? buttons = Padding(
      padding: const EdgeInsets.only(top: 120.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const LogoWidget(size: 50),
          Expanded(child: Container()),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: FloatingActionButton(
                  heroTag: 'settings',
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  onPressed: () {
                    center(mapController, ref);
                    print("!!!DEBUG!!!");
                  },
                  elevation: 10,
                  backgroundColor: kYellow,
                  foregroundColor: Colors.white,
                  child: const Icon(
                    Icons.refresh,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                width: 50,
                child: FloatingActionButton(
                  heroTag: 'add',
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  onPressed: () {
                    addDiving();
                  },
                  backgroundColor: kYellow,
                  foregroundColor: Colors.white,
                  elevation: 10,
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    if (_selectedPageIndex == 0) {
      buttons = null;
      currentPage = const CollectionScreen();
    }

    if (_selectedPageIndex == 2) {
      buttons = null;
      currentPage = ProfileScreen();
    }

    return Scaffold(
      floatingActionButton: buttons,
      body: SafeArea(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          child: currentPage,
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
        child: BottomNavigationBar(
          onTap: (index) {
            selectPage(index);
          },
          currentIndex: _selectedPageIndex,
          backgroundColor: kDarkBlue,
          selectedItemColor: kBlueGrey,
          unselectedItemColor: kBlueGrey,
          /* showSelectedLabels: false,
              showUnselectedLabels: false, */
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.collections_outlined),
              label: 'Collection',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

/*
   final isConnected = true;
    final markers = divings.map((diving) {
      return Marker(
        point: diving.getPosition,
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                ModalBottomSheetRoute(
                  //useSafeArea: true,
                  isScrollControlled: true,
                  builder: (ctx) {
                    return LayoutBuilder(
                      builder: (BuildContext ctx, BoxConstraints constraints) =>
                          SizedBox(
                        height: constraints.maxHeight * 0.8,
                        child: DivingInformations(diving: diving),
                      ),
                    );
                  },
                ),
              );
            },
            child: mapIcon),
      );
    }).toList();

    Widget currentPage = isConnected
        ? MapScreen(markers: markers, controller: mapController)
        : const Center(
            child: Text('No connection'),
          );

    Widget? buttons = Padding(
      padding: const EdgeInsets.only(top: 120.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const LogoWidget(size: 50),
          Expanded(child: Container()),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 50,
                width: 50,
                child: FloatingActionButton(
                  heroTag: 'settings',
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  onPressed: () {
                    center(mapController);
                    print("!!!DEBUG!!!");
                    print(
                        "Immersioni nella lista: " + divings.length.toString());
                    for (Diving d in divings) {
                      print("Immersione: " + d.toString());
                    }
                  },
                  elevation: 10,
                  backgroundColor: kYellow,
                  foregroundColor: Colors.white,
                  child: const Icon(
                    Icons.refresh,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                width: 50,
                child: FloatingActionButton(
                  heroTag: 'add',
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  onPressed: () {
                    addDiving();
                  },
                  backgroundColor: kYellow,
                  foregroundColor: Colors.white,
                  elevation: 10,
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    if (_selectedPageIndex == 0) {
      buttons = null;
      currentPage = CollectionScreen(fishList: fishList);
    }

    if (_selectedPageIndex == 2) {
      buttons = null;
      currentPage = const ProfileScreen();
    }

    return Scaffold(
      floatingActionButton: buttons,
      body: SafeArea(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
          child: currentPage,
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
        child: BottomNavigationBar(
          onTap: (index) {
            selectPage(index);
          },
          currentIndex: _selectedPageIndex,
          backgroundColor: kDarkBlue,
          selectedItemColor: kBlueGrey,
          unselectedItemColor: kBlueGrey,
          /* showSelectedLabels: false,
              showUnselectedLabels: false, */
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.collections_outlined),
              label: 'Collection',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_outlined),
              label: 'Map',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
    */
