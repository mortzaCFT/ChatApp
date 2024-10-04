import 'package:chatapp/data/data.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatController extends GetxController {
  final _messagesKey = 'messages';

  RxList<Message> _messages = RxList<Message>();

  List<Message> get messages => _messages;

  void sendMessage(String message, bool isMe) {
    _messages.add(Message(message: message, isMe: isMe));
    _saveMessages();
  }

Future<void> getMessages() async {
  final prefs = await SharedPreferences.getInstance();
  final messages = prefs.getStringList(_messagesKey);
  if (messages != null) {
    _messages.clear();
    messages.forEach((message) {
      final messageParts = message.split(',');
      if (messageParts.length >= 2) {
        _messages.add(Message(message: messageParts[0], isMe: messageParts[1] == 'true'));
      } else {
        print('Invalid message format: $message');
      }
    });
  }
}

  Future<void> _saveMessages() async {
    final prefs = await SharedPreferences.getInstance();
    final messages = _messages.map((message) => '${message.message},${message.isMe}').toList();
    await prefs.setStringList(_messagesKey, messages);
  }

  @override
  void onInit() {
    getMessages();
    super.onInit();
  }
}