import 'package:bumaco_aios/app_utils/app_bar_sbhome.dart';
import 'package:bumaco_aios/app_utils/app_const.dart';
import 'package:bumaco_aios/ui/controller/socket_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class SocketView extends StatefulWidget {
  SocketView({Key? key}) : super(key: key);

  @override
  State<SocketView> createState() => _SocketViewState();
}

class _SocketViewState extends State<SocketView> {
  final socketController = Get.find<SocketController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppbarSBHome(title: 'Chat'),
      bottomNavigationBar: Container(
          padding: MediaQuery.of(context).viewInsets,
          // color: Colors.grey[300],
          child: Container(
              padding: EdgeInsets.symmetric(vertical: 2),
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: TextField(
                controller: socketController.msgInputController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Type a message',
                  prefixIcon: Icon(Icons.person),
                  suffixIcon: Container(
                    margin: EdgeInsets.only(right: 10),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                        onPressed: () {
                          socketController.validateAndSendMessage(context);
                        },
                        icon: Icon(Icons.send)),
                  ),
                ),
              ))),
      body: Container(
        child: VStack([
          Expanded(
            child: Obx(
              () => ('Connected User: ${socketController.connectedUser.value}')
                  .text
                  .make()
                  .p8()
                  .centered(),
            ),
          ),
          Expanded(
              flex: 9,
              child: Container(
                child: Obx(
                  () => ListView.builder(
                      controller: socketController.scrollController,
                      itemCount: socketController.messageList.length,
                      itemBuilder: (context, index) {
                        final item = socketController.messageList[index];
                        return MessageItem(
                          item: item,
                          sentByMe: item.sentByMe == socketController.socket.id,
                        );
                      }),
                ),
              )),
        ]),
      ),
    );
  }
}

class MessageItem extends StatelessWidget {
  const MessageItem({required this.sentByMe, Key? key, required this.item})
      : super(key: key);
  final bool sentByMe;
  final SocketMessageModel item;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: sentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        margin: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        decoration: BoxDecoration(
            color: sentByMe ? kPrimaryColor : kWhiteColor,
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            item.message.text.xl2
                .color(sentByMe ? kWhiteColor : Vx.purple500)
                .make()
                .p2(),
            WidthBox(5),
            '10 am'
                .text
                .color(sentByMe ? kWhiteColor : Vx.purple500.withOpacity(0.7))
                .make()
                .p2()
          ],
        ),
      ),
    );
  }
}
