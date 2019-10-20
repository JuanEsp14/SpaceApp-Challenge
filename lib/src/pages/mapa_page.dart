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

  String _titulo = 'Parque Nacional del Íbera';
  String _botonNombre = 'VER FOCOS';

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
        _crearMarcadores()
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

  _crearMarcadores() {
    return MarkerLayerOptions(
      markers: <Marker>[
        Marker(
          width: 100.0,
          height: 100.0,
          point: LatLng(-28.00,-57.30),
          builder: (context) => Container(
            child: Image( 
              image: AssetImage('assets/reporte_incendio.png')
            ),
          )
        ),
        Marker(
          width: 100.0,
          height: 100.0,
          point: LatLng(-28.00,-57.00),
          builder: (context) => Container(
            child: Image( 
              image: AssetImage('assets/sin_reporte.png')
            ),
          )
        ),
        Marker(
          width: 100.0,
          height: 100.0,
          point: LatLng(-28.30,-57.30),
          builder: (context) => Container(
            child: Image( 
              image: AssetImage('assets/sin_reporte.png')
            ),
          )
        ),
        Marker(
          width: 100.0,
          height: 100.0,
          point: LatLng(-28.15,-57.22),
          builder: (context) => Container(
            child: Image( 
              image: AssetImage('assets/reporte_incendio.png')
            ),
          )
        ),
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
            _titulo,
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
                _botonNombre,
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
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const SizedBox(height: 30),
                  Text(
                    _titulo,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    width: 350.0,
                    height: 72.0,
                    child: FlatButton(
                      onPressed: () {
                        map.move(LatLng(-28.15,-57.22), 15);
                        Navigator.pop(context);
                        _titulo = 'Terminal 905 - Foco 1';
                        setState(() { });
                      },
                      child: Center(
                        child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const ListTile(
                            leading: Image(image: AssetImage('assets/reporte_incendio.png')),
                            title: Text('Terminal 905 - Foco 1', style: TextStyle(fontSize: 20)),
                            subtitle: Text("28º16'19''S, 57º16'33'' W"),
                          ),
                        ],
                      ),
                      )
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    width: 350.0,
                    height: 72.0,
                    child: FlatButton(
                      onPressed: () {
                        map.move(LatLng(-28.00,-57.30), 15);
                        Navigator.pop(context);
                        _titulo = 'Terminal 905 - Foco 1';
                        setState(() { });
                      },
                      child: Center(
                        child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const ListTile(
                            leading: Image(image: AssetImage('assets/reporte_incendio.png')),
                            title: Text('Terminal 907 - Foco 3', style: TextStyle(fontSize: 20)),
                            subtitle: Text("28º10'19''S, 57º22'33'' W"),
                          ),
                        ],
                      ),
                      )
                    ),
                  ),
                   Container(
                    margin: const EdgeInsets.all(10.0),
                    width: 350.0,
                    height: 72.0,
                    child: FlatButton(
                      onPressed: ()  {
                        map.move(LatLng(-28.30,-57.30), 15);
                        Navigator.pop(context);
                        _titulo = 'Terminal 905 - Foco 1';
                        setState(() { });
                      },
                      child: Center(
                        child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          const ListTile(
                            leading: Image(image: AssetImage('assets/sin_reporte.png')),
                            title: Text('Terminal 906 - Foco 2', style: TextStyle(fontSize: 20)),
                            subtitle: Text("28º55'19''S, 57º60'33'' W"),
                          ),
                        ],
                      ),
                      )
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn,
                    width: 350,
                    height: 50,
                    child: Center(
                      child: Text(
                        'SELECCIONAR UN ZONA',
                        style: TextStyle(fontSize: 20, color: Color.fromRGBO(255, 255, 255, 1)),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                  ),
                ],
              )
            )
          );
        }
      );
  }
}

 