import 'package:flutter/material.dart';

class PortoView extends StatelessWidget {
  static final String route = 'portoViewRoute';
  const PortoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/porto.png',
              width: 600.0,
              height: 240.0,
              fit: BoxFit.cover,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
              child: Text(
                'Porto',
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
              child: Text(
                  '''Porto or Oporto (Portuguese pronunciation: [ˈpoɾtu]) is the second-largest city in Portugal and one of the Iberian Peninsula's major urban areas. Porto city proper, which is the entire municipality of Porto, is small compared to its metropolitan area, with an estimated population of just 215,945 people in a municipality with only 41.42 km2. Porto's metropolitan area has around 1.7 million people (2019) in an area of 2,395 km2 (925 sq mi), making it the second-largest urban area in Portugal. It is recognized as a global city with a Gamma + rating from the Globalization and World Cities Research Network.
                  \nLocated along the Douro River estuary in northern Portugal, Porto is one of the oldest European centres, and its core was proclaimed a World Heritage Site by UNESCO in 1996, as "Historic Centre of Porto, Luiz I Bridge and Monastery of Serra do Pilar". The historic area is also a National Monument of Portugal. The western part of its urban area extends to the coastline of the Atlantic Ocean. Its settlement dates back many centuries, when it was an outpost of the Roman Empire. Its combined Celtic-Latin name, Portus Cale, has been referred to as the origin of the name Portugal, based on transliteration and oral evolution from Latin. In Portuguese, the name of the city includes a definite article: o Porto ("the port" or "the harbor"), which is where its English name "Oporto" comes from.
                  \nPort wine, one of Portugal's most famous exports, is named after Porto, since the metropolitan area, and in particular the cellars of Vila Nova de Gaia, were responsible for the packaging, transport, and export of fortified wine. In 2014 and 2017, Porto was elected The Best European Destination by the Best European Destinations Agency. Porto is on the Portuguese Way path of the Camino de Santiago.'''),
            ),
          ],
        ),
      ),
    );
  }
}
