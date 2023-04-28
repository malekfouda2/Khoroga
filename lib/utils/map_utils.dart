import 'package:url_launcher/url_launcher.dart';

class MapUtils{
  MapUtils._();
  static void openMap(double lat, double lng) async {
   var uri = Uri.parse("google.navigation:q=$lat,$lng&mode=d");
   
      await launchUrl(uri);
   
}
}