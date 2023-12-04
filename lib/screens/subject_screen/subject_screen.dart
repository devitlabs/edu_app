import 'package:edu_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SubjectScreen extends StatefulWidget {
  final String? subjectTitle;
  const SubjectScreen({super.key, required this.subjectTitle});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {

  final _kTabs = <Tab>[
    const Tab(icon: Icon(Icons.chat), text: 'Chat'),
    const Tab(icon: Icon(Icons.picture_as_pdf), text: 'Fichiers'),
    const Tab(icon: Icon(Icons.person_add_alt_1_outlined), text: 'Membres'),
  ];


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          leading: IconButton(
              onPressed: () {
                context.go("/app-menu");
              },
              splashRadius: 20,
              padding: EdgeInsets.zero,
              icon: Icon(Icons.arrow_back)
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${widget.subjectTitle}",
                style: TextStyle(fontSize: 22),
              ),
              Text(
                "10 Membres en ligne",
                style: TextStyle(fontSize: 16,),
              )
            ],
          ),
          bottom: TabBar(
            tabs: _kTabs,
          ),
          actions: [
            IconButton(
                onPressed: () {},
                splashRadius: 20,
                padding: EdgeInsets.zero,
                icon: Icon(Icons.notification_important_rounded)
            ),
            SizedBox(
              width: 10,
            ),
            IconButton(
                onPressed: () {},
                splashRadius: 20,
                padding: EdgeInsets.zero,
                icon: Icon(Icons.more_vert_sharp)
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
        body: TabBarView(
          children: [
            ChatWidget(),
            FileWidget(),
            MemberWidget(),
          ],
        ),
      ),
    );
  }
}

class ChatWidget extends StatefulWidget {
  const ChatWidget({super.key});

  @override
  State<ChatWidget> createState() => _ChatWidgetState();
}

class _ChatWidgetState extends State<ChatWidget> {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [];

  void _handleSubmitted(String text) {
    _textController.clear();

    ChatMessage message = ChatMessage(
      text: text,
    );

    setState(() {
      _messages.insert(0, message);
    });
  }

  Widget _buildMessageList() {
    return Flexible(
      child: ListView.builder(
        padding: const EdgeInsets.all(2.0),
        reverse: true,
        itemBuilder: (_, int index) => _messages[index],
        itemCount: _messages.length,
      ),
    );
  }

  Widget _buildTextComposer() {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2.0),
      child: Row(
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: _textController,
              maxLines: null, // Set to null for unlimited lines
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text),
                ),
                counterText: '',
                hintText: 'Envoyer un message...',
                border: OutlineInputBorder(),
              ),
              onChanged: (text) => setState(() {}),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.orange.withOpacity(0.2),
          width: double.infinity,
          height: double.infinity,
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMessageList(),
              const SizedBox(height: 5,),
              _buildTextComposer(),
              const SizedBox(height: 10,),
            ],
          ),
        ),
      ],
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String text;

  ChatMessage({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 4.0),
            child: const CircleAvatar(
              radius: 15,
              child: Center(child: Text('FH',style: TextStyle(fontSize: 12),)),
            ),
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(12.0),

              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                  bottomLeft: Radius.circular(12.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Fabrice H.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 2.0),
                    child: SelectableText(
                      text,
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontStyle: FontStyle.italic
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class FileWidget extends StatefulWidget {
  const FileWidget({super.key});

  @override
  State<FileWidget> createState() => _FileWidgetState();
}

class _FileWidgetState extends State<FileWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("Fichiers"),),
    );
  }
}

class MemberWidget extends StatefulWidget {
  const MemberWidget({super.key});

  @override
  State<MemberWidget> createState() => _MemberWidgetState();
}

class _MemberWidgetState extends State<MemberWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Membres"),
      ),
    );
  }
}


