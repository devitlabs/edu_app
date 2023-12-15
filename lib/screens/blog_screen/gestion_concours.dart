import 'package:edu_app/constants/colors.dart';
import 'package:edu_app/core/api_client.dart';
import 'package:flutter/material.dart';

import '../../models/document_model.dart';
import 'card_blog.dart';

class GestionPublications extends StatefulWidget {
  const GestionPublications({super.key});

  @override
  State<GestionPublications> createState() => _GestionPublicationsState();
}

class _GestionPublicationsState extends State<GestionPublications> {

  List<DocumentModel> documents = [];
  bool isLoading = true;
  bool status = false;

  void initialisation() async {
    setState(() {
      isLoading = true;
    });
    final result = await ApiClient.getDocuments();
    await Future.delayed(const Duration(seconds: 1));
    if ( result != null && result != [] ) {
      setState(() {
        documents = result;
        status = true;
      });
    } else {
      setState(() {
        status = false;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    initialisation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: isLoading? const Center(
        child: CircularProgressIndicator(color: secondaryColor,),
      ) : status == false ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Aucune donnée"),
            const SizedBox(height: 10,),
            IconButton(
              icon: const Icon(Icons.refresh,color: Colors.green,),
              onPressed: () {
                initialisation();
              },
            ),
          ],
        ),
      ) :  SingleChildScrollView(
        child: Column(
          children: documents.map(
                  (doc) =>  CardRessource(
                    title: doc.typeDocumensLibelle,
                    id: doc.id,
                    description: doc.description,
                    imagePath: "http://164.160.33.223/assets/images/document/${doc.typeDocumensLibelle}.${doc.extension}",
                  ),
          ).toList(),
        ),
      ),
    );
  }

}





