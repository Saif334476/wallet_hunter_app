import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PlacePickerTextField extends StatelessWidget {
  final String label;
  final Function({
  required String city,
  required String state,
  required String country,
  required String pincode,
  }) onPlaceSelected;

  const PlacePickerTextField({super.key,
    required this.label,
    required this.onPlaceSelected,
  });

  @override
  Widget build(BuildContext context) {
    final apiKey = dotenv.env['GOOGLE_MAPS_API_KEY_ANDROID']!;

    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.grey[900]
            : Colors.grey[200],
      ),
      onTap: () async {
        Prediction? prediction = await PlacesAutocomplete.show(
          context: context,
          apiKey: apiKey,
          mode: Mode.overlay,
          language: "en",
          components: [Component(Component.country, "pk",)],
        );

        if (prediction != null) {
          final places = GoogleMapsPlaces(apiKey: apiKey);
          final detail = await places.getDetailsByPlaceId(prediction.placeId!);
          final result = detail.result;

          String city = "", state = "", country = "", pincode = "";

          for (var comp in result.addressComponents) {
            if (comp.types.contains('locality')) city = comp.longName;
            if (comp.types.contains('administrative_area_level_1')) state = comp.longName;
            if (comp.types.contains('country')) country = comp.longName;
            if (comp.types.contains('postal_code')) pincode = comp.longName;
          }

          onPlaceSelected(
            city: city,
            state: state,
            country: country,
            pincode: pincode,
          );
        }
      },
    );
  }
}
