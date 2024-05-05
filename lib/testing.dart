import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';

class Tesing extends StatefulWidget {
  const Tesing({Key? key}) : super(key: key);

  @override
  State<Tesing> createState() => _TesingState();
}

class _TesingState extends State<Tesing> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: /*Center(
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Enter address',
            suffixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () async {
                // Show Google Places Autocomplete
                Prediction? p = await PlacesAutocompleteResponse.show(
                    context: context,
                    apiKey: '<Your Google Maps API Key>',
                    mode: Mode.overlay,
                    language: 'en',
                    components: [Component(Component.country, 'us')]);
                if (p != null) {
                  // Set selected address to text field
                  setState(() {
                    _controller.text = p.description!;
                  });
                }
              },
            ),
          ),
        );,
      )*/
          SizedBox(
            height: size.height * 0.06,
            child: GooglePlaceAutoCompleteTextField(
        textEditingController: _controller,
        googleAPIKey: "AIzaSyD2wofI9yNNThitezD-zqxd37HYar3ZO9U",
        inputDecoration:InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderSide:
              BorderSide(color: Colors.black),
            ),
            border: const OutlineInputBorder(
              borderSide:
              BorderSide(color: Colors.black38),
            ),
            disabledBorder: const OutlineInputBorder(
              borderSide:
              BorderSide(color: Colors.black38),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide:
              BorderSide(color: Colors.black38),
            ),
            labelText: "shop's Physical Location",
            contentPadding: EdgeInsets.only(bottom: size.height*0.01),
            prefixIcon:
            const Icon(Icons.location_on_outlined),
            suffixIcon: const Icon(Icons.cancel_outlined),
            prefixIconColor: Colors.grey,
            labelStyle: GoogleFonts.openSans(
                fontSize: size.height * 0.018,
                fontWeight: FontWeight.w400),
        ),
        debounceTime: 800,
        countries: const ["in", "fr"],
        isLatLngRequired: true,
        getPlaceDetailWithLatLng: (Prediction prediction) {

        },
        itemClick: (Prediction prediction) {
            _controller.text = prediction.description!;
            _controller.selection = TextSelection.fromPosition(
                TextPosition(offset: prediction.description!.length));
        },
        itemBuilder: (context, index, Prediction prediction) {
            return Row(
              children: [
                const Icon(Icons.location_on),
                const SizedBox(
                  width: 7,
                ),
                Expanded(child: AutoSizeText(prediction.description ?? "",
                style: GoogleFonts.openSans(
                  fontSize: size.height*0.017,
                ),
                ))
              ],
            );
        },
        // if you want to add seperator between list items
        seperatedBuilder: const Divider(),
        isCrossBtnShown: false,
        containerHorizontalPadding: 10,
      ),
          ),
    );
  }
}
