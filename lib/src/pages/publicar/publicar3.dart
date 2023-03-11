import 'package:app_arriendosu/src/pages/publicar/publicar1.dart';
import 'package:flutter/material.dart';

class Publicar3Page extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.abc), onPressed: (){
           Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Publicar1Pagr()));
        },),
        actions: [Text('Hola')],
      ),
    );
  }
}
