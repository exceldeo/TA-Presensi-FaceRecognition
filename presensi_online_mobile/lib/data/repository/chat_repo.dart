import 'package:presensi_online_mobile/data/model/chat_model.dart';

class ChatRepo {
  List<ChatModel> getChatList() {
    List<ChatModel> chatList = [
      ChatModel('Hi', false),
    ];
    return chatList;
  }
}
