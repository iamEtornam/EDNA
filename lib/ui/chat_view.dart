import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_generative_language_api/google_generative_language_api.dart'
    as gmr;
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../resources/resources.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key, required this.name});
  final String name;

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  static String botId = '1a998815-db44-46de-b263-87162faa9a26';
  static String userId = '82091008-a484-4a89-ae75-a22bf8d6f3ac';
  final List<types.Message> _messages = [];
  types.User? _user, _bot;

  @override
  void initState() {
    super.initState();

    _user = types.User(
        id: userId,
        lastSeen: DateTime.now().millisecondsSinceEpoch,
        firstName: widget.name);
    _bot = types.User(
        id: botId,
        lastSeen: DateTime.now().millisecondsSinceEpoch,
        firstName: 'Edna.ai');
    final m = types.TextMessage(
      author: _bot!,
      text: 'Hello ${widget.name}, how can i help you today?',
      id: const Uuid().v4(),
      status: types.Status.delivered,
    );
    _messages.add(m);
  }

  void _addMessage(types.Message message) async {
    setState(() {
      _messages.insert(0, message);
    });

    final allMessages = _messages.map((e) {
      final message0 = e as dynamic;
      return gmr.Message(author: e.author.firstName, content: message0.text);
    }).toList();
    if (message is types.TextMessage) {
      // Generate a message
      final request = gmr.GenerateMessageRequest(
          prompt:
              gmr.MessagePrompt(context: message.text, messages: allMessages),);

      final generatedMessage = await gmr.GenerativeLanguageAPI.generateMessage(
        modelName: 'models/chat-bison-001',
        request: request,
        apiKey: const String.fromEnvironment('API_KEY'),
      );

      // Print the candidates
      String res = generatedMessage.messages[0].content;

      final m = types.TextMessage(
        author: _bot!,
        text: res,
        id: const Uuid().v4(),
        status: types.Status.delivered,
      );
      setState(() {
        _messages.insert(0, m);
      });
    }
  }

  void _handleMessageTap(BuildContext _, types.Message message) async {
    if (message is types.TextMessage) {
      Clipboard.setData(ClipboardData(text: message.text))
          .then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: const Text('Message copied!'),
                clipBehavior: Clip.none,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                behavior: SnackBarBehavior.floating,
              )));
    }
  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user!,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: const Uuid().v4(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

  // void _loadMessages() async {
  //   final response = await rootBundle.loadString('assets/messages.json');
  //   final messages = (jsonDecode(response) as List)
  //       .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
  //       .toList();

  //   setState(() {
  //     _messages = messages;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: Text(
            'EDNA.ai',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.anekGujarati().fontFamily),
          ),
        ),
        body: Chat(
          messages: _messages,
          onMessageTap: _handleMessageTap,
          onPreviewDataFetched: _handlePreviewDataFetched,
          onSendPressed: _handleSendPressed,
          timeFormat: DateFormat('hh:mm a'),
          showUserAvatars: true,
          showUserNames: true,
          user: _user!,
          emptyState: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                  child: Opacity(
                      opacity: .5,
                      child: Image.asset(
                        Images.ednaLogo,
                        width: 120,
                        height: 120,
                      ))),
              const SizedBox(height: 10),
              Text('Start chatting with ENDA.ai',
                  style: GoogleFonts.poppins().copyWith(
                      fontStyle: FontStyle.italic, color: Colors.grey.shade500))
            ],
          ),
          inputOptions: const InputOptions(
              sendButtonVisibilityMode: SendButtonVisibilityMode.always),
          theme: DefaultChatTheme(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            inputBorderRadius: BorderRadius.circular(10),
            inputTextColor: Theme.of(context).textTheme.bodyLarge!.color!,
            inputTextDecoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.tertiary,
                      width: .5)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.tertiary,
                      width: .5)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.tertiary,
                      width: .5)),
              contentPadding: const EdgeInsets.all(10),
              fillColor: Theme.of(context).cardColor,
            ),
            inputTextCursorColor: Theme.of(context).colorScheme.primary,
            inputBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
            attachmentButtonIcon: const Icon(Icons.attach_file),
            secondaryColor: Theme.of(context).colorScheme.tertiary,
            receivedMessageBodyTextStyle:
                GoogleFonts.poppins().copyWith(color: Colors.white),
            primaryColor: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
