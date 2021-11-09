import 'package:bumaco_aios/app_utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketController extends GetxController {
  final scrollController = ScrollController();
  final msgInputController = TextEditingController();
  var connectedUser = ''.obs;
  var connectionStatus = ''.obs;
  var messageList = <SocketMessageModel>[].obs;
  late IO.Socket socket;

  @override
  void onInit() {
    super.onInit();
    socket = IO.io(
        'http://192.168.225.77:4000',
        // 'http://localhost:4000',
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            // .setExtraHeaders({'foo': 'bar'})
            .build());
    socket.onDisconnect((data) => {
          print('socket disconnected!'),
          connectionStatus.value = 'offline',
        });
    socket.onConnectError((data) => {
          print('socket onConnectionError!=${socket.id}'),
          connectionStatus.value = '[offline]',
        });
    socket.onConnect((data) => {
          print('socket Connected--->${socket.id}'),
          connectionStatus.value = 'online',
        });
    socket.onReconnect((data) => {
          print('socket Reconnecting..'),
          connectionStatus.value = 'reconnecting..',
        });
    socket.onConnecting((data) => {
          print('socket Connecting..'),
          connectionStatus.value = 'connecting..',
        });
    socket.connect();
    socket.on(
        'message-received',
        (data) => {
              print('-------message-received------->$data'),
              if (SocketMessageModel.fromJson(data).sentByMe != socket.id)
                {messageList.add(SocketMessageModel.fromJson(data))},
              scrollToBottom(),
            });
    socket.on(
        'connected-user',
        (data) => {
              print('-------connected-user-count------->$data'),
              connectedUser.value = data,
            });
  }

  @override
  void onClose() {
    socket.disconnect();
    scrollController.dispose();
    msgInputController.dispose();
    super.onClose();
  }

  void scrollToBottom() {
    // scrollController.animateTo(
    //   scrollController.position.maxScrollExtent,
    //   curve: Curves.easeOut,
    //   duration: const Duration(milliseconds: 300),
    // );
    scrollController.jumpTo(scrollController.position.maxScrollExtent);
  }

  void validateAndSendMessage(context) {
    if (msgInputController.text.isEmpty) {
      bumacoToast(context, 'Please type your message');
      return;
    }
    sendMessage(msgInputController.text);
    msgInputController.text = '';
  }

  void sendMessage(String text) {
    var messageJson = {'message': text, 'sentByMe': socket.id};
    print('messageEmit=====>$messageJson');
    socket.emit('message', messageJson);
    messageList.add(SocketMessageModel.fromJson(messageJson));
    scrollToBottom();
  }
}

class SocketMessageModel {
  String message, sentByMe;
  SocketMessageModel({required this.message, required this.sentByMe});
  factory SocketMessageModel.fromJson(Map<String, dynamic> json) {
    return SocketMessageModel(
        message: json['message'], sentByMe: json['sentByMe']);
  }
}
