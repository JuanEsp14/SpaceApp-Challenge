import 'package:latlong/latlong.dart';

class ScanModel {
    int id = 0;
    String tipo = 'geo';
    String valor = '-28.30,-57.30';

    ScanModel({
        this.id,
        this.tipo,
        this.valor,
    }){
      this.tipo = 'geo';
      if(this.valor.contains('http')){
        this.tipo = 'http';
      }      
    }

    factory ScanModel.fromJson(Map<String, dynamic> json) => new ScanModel(
        id    : json["id"],
        tipo  : json["tipo"],
        valor : json["valor"],
    );

    Map<String, dynamic> toJson() => {
        "id"    : id,
        "tipo"  : tipo,
        "valor" : valor,
    };

    LatLng getLatLng(){
      final latlong = valor.substring(4).split(',');
      final lat = double.parse(latlong[0]);
      final long = double.parse(latlong[1]);

      return LatLng(lat, long);
    }
}