import 'package:flutter/material.dart';
import 'package:qr_reader_app/src/bloc/scans_bloc.dart';
import 'dart:async';


import 'package:qr_reader_app/src/pages/mapa_page.dart';
import 'package:qr_reader_app/src/pages/mapas_page.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

int currentIndex = 0;

class _HomePageState extends State<HomePage> {

  final scansBloc = new ScansBloc();

  @override
  Widget build(BuildContext context) {
    FadeInImage(
          image: AssetImage('assets/1. APP – 1.png'),
          placeholder: AssetImage('assets/1. APP – 1.png'),
          fadeInDuration: Duration(seconds: 3),
          fit: BoxFit.cover,
        );
        Future.delayed(const Duration(seconds: 3), () => "3");
    return  MapaPage();
  }
}