import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:qr_reader_app/src/models/scan_model.dart';
import 'package:latlong/latlong.dart';

class MapaPage extends StatefulWidget {

  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  final map = new MapController();

  String tipoMapa = 'streets';

  @override
  Widget build(BuildContext context) {

    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: null,
      body: _crearFlutterMap(scan),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child:_crearFloatingActionButton(context),
      ),
      );
  }
  

  Widget _crearFlutterMap(ScanModel scan) {
    return FlutterMap(
      mapController: map,
      options: MapOptions(
        center: LatLng(-28.30,-57.30),
        zoom: 10.0,
      ),
      layers: [
        _crearMapa(),
        _crearMarcadores(scan)
      ],
    );
  }

  _crearMapa() {
    return TileLayerOptions(
          urlTemplate: "https://api.mapbox.com/v4/"
              "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
          additionalOptions: {
            'accessToken': 'pk.eyJ1IjoianVhbWVzcCIsImEiOiJjanhtNGVubTgwMDFiM2dwMDRvc2Z4ZmNuIn0.gj_2FBXlnAbe4lY2VU9LzQ',
            'id': 'mapbox.$tipoMapa', //streets, dark, light, outdoors, satellite
          },
        );
  }

  _crearMarcadores(ScanModel scan) {
    return MarkerLayerOptions(
      markers: <Marker>[
        Marker(
          width: 100.0,
          height: 100.0,
          point: LatLng(-28.30,-57.30),
          builder: (context) => Container(
            child: Icon( 
              Icons.location_on, 
              size: 45.0,
              color: Theme.of(context).accentColor,  
            ),
          )
        )
      ]
    );
  }

  Widget _crearFloatingActionButton(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        _settingModalBottomSheet(context);
        
        
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 30),
          Text(
            'Parque Nacional del Íbera',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 30),
          AnimatedContainer(
            duration: Duration(seconds: 2),
            curve: Curves.fastOutSlowIn,
            width: 250,
            height: 50,
            child: Center(
              child: Text(
                'VER FOCOS',
                style: TextStyle(fontSize: 20, color: Color.fromRGBO(255, 255, 255, 1)),
              ),
            ),
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ), 
      color: Color.fromRGBO(255, 255, 255, 1),
    );
  }

  void _settingModalBottomSheet(context){
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc){
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                  leading: new Icon(Icons.music_note),
                  title: new Text('Music'),
                  onTap: () => {}          
                ),
                new ListTile(
                  leading: new Icon(Icons.videocam),
                  title: new Text('Video'),
                  onTap: () => {},          
                ),
              ],
            ),
          );
        }
      );
  }
}

 