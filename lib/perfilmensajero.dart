import 'package:appmensajeros/dialog.dart';
import 'package:appmensajeros/main.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Perfilmensajero extends StatelessWidget {
  final Post perfil;
  Perfilmensajero({Key key, this.perfil});
  ComunicationDialog comunicationDialog = new ComunicationDialog();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perfil Mensajero <Esteban Rodríguez>'),
        ),
        body: ListView(children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
            height: 515, //460
            width: double.maxFinite,
            child: Card(
              elevation: 5,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    top: -50,
                    left: (MediaQuery.of(context).size.width / 2) - 55,
                    child: Container(
                      height: 100,
                      width: 100,
                      //color: Colors.blue,
                      child: Card(
                        elevation: 2,
                        child: Image.network(perfil.foto),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Column(
                            children: [
                              Text(
                                perfil.nombre,
                                style: TextStyle(fontSize: 20),
                              ),
                              Text(perfil.moto),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Calificaciones'),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Text('Cumplimiento'),
                                      CircleAvatar(child: Text('0.0')),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Responsabilidad'),
                                      CircleAvatar(child: Text('0.0')),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text('Amabilidad'),
                                      CircleAvatar(child: Text('0.0')),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('Descripcion:'),
                              Text('Mensajero las 24 Horas'),
                              SizedBox(height: 20),
                              Text('Verificar Placa:'),
                              SizedBox(height: 10),
                              Container(
                                width: 100,
                                height: 50,
                                color: Colors.yellowAccent,
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                child: Text(
                                  perfil.placa,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              SizedBox(height: 20),
                              SizedBox(height: 20),
                              ElevatedButton(
                                  onPressed: null,
                                  onLongPress: () {
                                    comunicationDialog.showContactsOptions(
                                        context,
                                        phoneNumber: perfil.telefono,
                                        whatsappNumber: perfil.whatsapp);
                                  },
                                  child: Text('Contactar')),
                              SizedBox(height: 20),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Regresar'))
        ]),
      ),
    );
  }
}
