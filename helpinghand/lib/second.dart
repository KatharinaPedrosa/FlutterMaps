import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class SecondPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new SecondPageState();
  }

}

class SecondPageState extends State<SecondPage>{
  GoogleMapController mapController;

  LatLng _center = const LatLng(45.521563, -122.677433);

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void _onMapCreated(GoogleMapController controller) {
    //evento para quando o mapa é inicializado
    mapController = controller; //seta o controlador
    getLocalization(); //método para buscar a posicao do gps
  }

  void addMarker() {
    final MarkerId markerId = MarkerId("your"); //id para o marker

    // criar o MARKER
    final Marker marker = Marker(
      markerId: markerId,
      position: LatLng(
        _center.latitude,
        _center.longitude,
      ),
      infoWindow: InfoWindow(title: "Estou aqui"),
    );

    setState(() {
      // adicionar um novo marcador no mapa
      markers[markerId] = marker;
    });
  }

  Future getLocalization() async {
    LocationPermission permission =
        await Geolocator.requestPermission(); //pede permissão
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      Position position =
          await Geolocator.getLastKnownPosition(); //ultima posiçao conhecida
      _center = LatLng(position.latitude, position.longitude);
      await mapController
          .moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: _center,
        zoom: 16.0,
      )));
      addMarker();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Negócios na região"),
          backgroundColor: Color.fromRGBO(21, 182, 214, 1),
        ),
        body: GoogleMap(//widget do GoogleMaps
          onMapCreated: _onMapCreated, //evento de criação do mapa
          initialCameraPosition: CameraPosition(
            //posicao do mapa
            target: _center, //posicao da camera - latitute e longitude
            zoom: 11.0,
          ),
          markers:
              Set<Marker>.of(markers.values), //o vermelho que marca a posicao
        ));
  }
  }


