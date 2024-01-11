import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ClassScreen extends StatefulWidget {
  const ClassScreen({super.key});

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Salle de classe : 3ième ",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
          SizedBox(height: 5,),
          SubjectWidget(title: 'Mathématiques',color: Colors.amber,),
          SubjectWidget(title: 'Subejct 2',color: Colors.blue,),
          SubjectWidget(title: 'Subejct 3',color: Colors.green,),
          SubjectWidget(title: 'Subejct 4',color: Colors.red,),
        ],
      ),
    );
  }
}

class SubjectWidget extends StatefulWidget {
  final String title;
  final Color color;
  const SubjectWidget({super.key, required this.title, required this.color});

  @override
  State<SubjectWidget> createState() => _SubjectWidgetState();
}

class _SubjectWidgetState extends State<SubjectWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        context.go("/subject/${widget.title}");
      },
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(vertical: 5),
        width: double.infinity,
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(color: widget.color,borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Text("${widget.title[0].toUpperCase()}${widget.title[1].toUpperCase()}",style: const TextStyle(fontSize: 18,color: Colors.white),),
              ),
            ),
            const SizedBox(width: 10,),
            Text(widget.title,style: const TextStyle(fontSize: 22,color: Colors.black),)
          ],
        ),
      ),
    );
  }
}