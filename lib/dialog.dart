import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ComunicationDialog {
  void showContactsOptions(BuildContext context,
      {var whatsappNumber, var phoneNumber}) {
    showDialog(
        context: context,
        builder: (_) => AlertDialog(
            title: Text("Selecciona la opción de contacto"),
            content: SingleChildScrollView(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      RawMaterialButton(
                        onPressed: () => {doPhoneCall(phoneNumber)},
                        elevation: 2.0,
                        fillColor: Colors.white,
                        child: Icon(
                          Icons.phone,
                          color: Colors.greenAccent.shade200,
                          size: 50,
                        ),
                        shape: CircleBorder(),
                      ),
                      TextButton(onPressed: () {}, child: Text('Llamar')),
                    ],
                  ),
                  Column(
                    children: [
                      RawMaterialButton(
                        onPressed: () => {goToWhatsappChat(whatsappNumber)},
                        elevation: 2.0,
                        fillColor: Colors.white,
                        child: Image(
                          image: AssetImage('images/wss.png'),
                          width: 50,
                          height: 50,
                        ),
                        shape: CircleBorder(),
                      ),
                      TextButton(onPressed: () {}, child: Text('Chatear'))
                    ],
                  ),
                ],
              ),
            )));
  }

  Future<void> doPhoneCall(var phoneNumber) async {
    if (await canLaunch('tel:$phoneNumber')) {
      await launch('tel:$phoneNumber');
    } else {
      throw 'Could not launch $phoneNumber';
    }
  }

  Future<void> goToWhatsappChat(var whatsappNumber) async {
    String urlWhatsappNumber;
    if (Platform.isAndroid) {
      urlWhatsappNumber =
          "https://wa.me/$whatsappNumber/?text=urlencodedtext"; // new line
    } else {
      urlWhatsappNumber =
          "https://api.whatsapp.com/send?phone=$whatsappNumber=urlencodedtext"; // new line
    }
    if (await canLaunch(urlWhatsappNumber)) {
      await launch(urlWhatsappNumber);
    } else {
      throw 'Could not launch $whatsappNumber';
    }
  }
}
