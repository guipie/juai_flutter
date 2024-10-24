import 'package:juai_flutter/app/data/model/chat.dart';

class DemoData {
  static List<Chat> getConversations() {
    List<Chat> data = [];
    if (true) {
      Chat chat = Chat();
      chat.name = "Dream.Machine";
      chat.online = true;
      chat.msg = "Photo 😻 Love u ❤️";
      chat.timestamp = "2 min ago";
      chat.portrait = "images/img/1.png";
      chat.unread = 4;
      data.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.online = true;
      chat.name = "Spoony";
      chat.msg = "Hello! How are you?";
      chat.timestamp = "15 min ago";
      chat.portrait = "images/img/2.png";
      chat.unread = 99;
      data.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "Emerson Herwitz";
      chat.msg = "Yep, it’ll be awesome. I prom...";
      chat.timestamp = "Yesterday";
      chat.portrait = "images/img/5.jpg";
      chat.unread = 6;
      chat.online = true;
      data.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "Dulce Bator";
      chat.msg = "Bye!";
      chat.timestamp = "Feb 22";
      chat.portrait = "images/img/4.jpg";
      chat.unread = 20;
      data.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "Giana Torff";
      chat.msg = "hot stuff here 🔥ui8.net";
      chat.timestamp = "Feb 16";
      chat.portrait = "images/img/5.jpg";
      data.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "Livia Herwitz";
      chat.msg = "hot stuff here 🔥ui8.net";
      chat.timestamp = "Feb 9";
      chat.portrait = "images/img/6.jpg";
      data.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "Audio message";
      chat.msg = "😱😱😱";
      chat.timestamp = "Feb 2";
      chat.online = true;
      chat.portrait = "images/img/1.png";
      data.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "❤️ Ruben Dias ❤️";
      chat.timestamp = "Jan 27";
      chat.msg = "just a sec";
      chat.portrait = "images/img/8.png";
      data.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "Emerson Herwitz";
      chat.timestamp = "Jan 16";
      chat.online = true;
      chat.msg = "😲😲😲";
      chat.portrait = "images/img/9.jpg";
      data.add(chat);
    }

    if (true) {
      Chat chat = Chat();
      chat.name = "Aspen Last";
      chat.timestamp = "Jan 5";
      chat.msg = "look at this photo";
      chat.portrait = "images/img/6.jpg";
      data.add(chat);
    }
    return data;
  }
}
