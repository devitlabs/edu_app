import 'package:flutter/material.dart';

class CardRessource extends StatefulWidget {
  final int id;
  final String title;
  final String description;
  final String imagePath;
  const CardRessource({super.key, required this.title, required this.id, required this.description, required this.imagePath});

  @override
  State<CardRessource> createState() => _CardRessourceState();
}

class _CardRessourceState extends State<CardRessource> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
                width: 150,
                child: Image.network(widget.imagePath,
                  fit: BoxFit.fill,),
              ),
              const SizedBox(width: 5,),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 5,),
                  Container(
                    height: 120,
                    child: Text(widget.description,style: TextStyle(fontStyle: FontStyle.italic, fontSize: 14),overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              )
              )
            ],
          ),
        ),
        SizedBox(height: 2,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlinedButton(onPressed: (){
              print(widget.id);
            },
              child: const Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Text("Voir les détails"),
            ),),
            OutlinedButton(style: OutlinedButton.styleFrom(
                foregroundColor: Colors.red
            ),onPressed: (){}, child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Télécharger"),
            ),)
          ],
        ),
        Divider()
      ],
    );
  }
}