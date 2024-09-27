import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key, this.markers, this.onTap, this.controller});

  final MapController? controller;
  final List<Marker>? markers;
  final Function(TapPosition, LatLng)? onTap;
  final LatLng _bologna = const LatLng(44.49389254584445, 11.342627064157739);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: (controller != null) ? controller : null,
      options: MapOptions(
        initialCenter: _bologna, //LatLng(51.509364, -0.128928),
        initialZoom: 5.3,
        minZoom: 1.15,
        maxZoom: 18,
        interactionOptions: const InteractionOptions(
            flags: InteractiveFlag.all & ~InteractiveFlag.rotate),
        cameraConstraint: CameraConstraint.contain(
          bounds: LatLngBounds(
            const LatLng(84, 192),
            const LatLng(-79, -192),
          ),
        ),
        onLongPress: (markers == null || markers == []) ? onTap : null,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.sea.app',
          tileProvider: CancellableNetworkTileProvider(),
        ),
        MarkerLayer(
          alignment: Alignment.topCenter,
          markers: markers == null ? [] : markers!,
        ),
        CurrentLocationLayer(),
        RichAttributionWidget(
          alignment: AttributionAlignment.bottomLeft,
          attributions: [
            TextSourceAttribution(
              'OpenStreetMap contributors',
              onTap: () =>
                  launchUrl(Uri.parse('https://openstreetmap.org/copyright')),
            ),
          ],
        ),
      ],
    );
  }
}
