

import 'package:auto_size_text/auto_size_text.dart';
import 'package:chatview/chatview.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vendor/chat%20system/showImage.dart';
import 'dart:io';
import '../Constraints.dart';

class OpenChat extends StatefulWidget {
  OpenChat({super.key,required this.channel,required this.userName,required this.vendorId,required this.vendorShopName, required this.vendorShopImage});
  String channel;
  String userName;
  String vendorId;
  String vendorShopName;
  String vendorShopImage;
  @override
  State<OpenChat> createState() => _OpenChatState();
}

class _OpenChatState extends State<OpenChat> {
  bool chatRefresh=true;
  bool isDarkTheme = false;
  final currentUser = ChatUser(
    id: userModel["id"].toString(),
    name: userModel.isNotEmpty?"${userModel["fullname"]}":"",
    //profilePhoto: "assets/images/profile.jpg",
  );
  final _chatController = ChatController(
    initialMessageList: [],
    scrollController: ScrollController(),
    chatUsers: [],
  );


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height*1,
        width: size.width*1,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("chat channels")
              .doc(widget.channel)
              .snapshots(),
          builder: (BuildContext context, snapshot) {
          if(snapshot.hasData){
            print("data is ");
            print(widget.channel);
            print(snapshot.data?.data());
          }
            if(  snapshot.data?.data() !=null && snapshot.hasData && snapshot.data!.data()?["Chat"]!=null){
              print(" dataa is.............${snapshot.data?.data()}");
              // _chatController.chatUsers.clear();
              _chatController.initialMessageList.clear();
              _chatController.chatUsers.add(
                ChatUser(
                  id: widget.vendorId,
                  name: widget.userName,
                 // profilePhoto: "assets/images/img-2.png",
                ),
              );
              _chatController.chatUsers.toSet().toList();


              for( int index=0; index < snapshot.data!.data()?["Chat"].length;index++){
                _chatController.initialMessageList.add(
                    snapshot.data!.data()?["Chat"][index]["ReplyMassage"]==""
                        ?
                    Message(
                      id: snapshot.data!.data()!["Chat"][index]["Time"].toString(),
                      createdAt:snapshot.data!.data()?["Chat"][index]["Time"].toDate(),
                      message: snapshot.data!.data()!["Chat"][index]["Massage"].toString(),
                      sendBy: snapshot.data!.data()!["Chat"][index]["userId"],
                      // replyMessage:ReplyMessage. ,
                      messageType:
                      snapshot.data!.data()!["Chat"][index]["massageType"].toString()=="image"
                          ?
                      MessageType.image
                          :
                      MessageType.text,

                    )
                        :
                    Message(
                        id: snapshot.data!.data()!["Chat"][index]["Time"].toString(),
                        createdAt:snapshot.data!.data()?["Chat"][index]["Time"].toDate(),
                        message: snapshot.data!.data()!["Chat"][index]["Massage"].toString(),
                        sendBy: snapshot.data!.data()!["Chat"][index]["userId"],
                        // replyMessage:ReplyMessage. ,
                        messageType:
                        snapshot.data!.data()!["Chat"][index]["massageType"].toString()=="image"
                            ?
                        MessageType.image
                            :
                        MessageType.text,
                        replyMessage: ReplyMessage(

                          message:snapshot.data!.data()?["Chat"][index]["ReplyMassage"],
                          messageId: snapshot.data!.data()?["Chat"][index]["ReplyMassageId"],
                          messageType: MessageType.text,
                          replyBy: snapshot.data!.data()?["Chat"][index]["ReplyMassageBy"],
                          replyTo: snapshot.data!.data()?["Chat"][index]["ReplyMassageTo"],

                        )

                    )


                );
              }

            }
            return snapshot.hasData && snapshot.data?.data() !=null
                ?
            SizedBox(
              height: size.height * 1,
              width: size.width * 1,
              child: ChatView(
                currentUser: currentUser,
                chatController: _chatController,
                onSendTap: _onSendTap,
                chatViewState: ChatViewState.hasMessages,
                appBar:  ChatViewAppBar(
                  // leading: InkWell(
                  //     onTap: (){
                  //       Navigator.pop(context);
                  //     },
                  //     child: const Icon(CupertinoIcons.arrow_left,color: Colors.white,)),
                  //   backgroundColor: const Color.fromRGBO(174, 144, 194, 1),
                  // title:     Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     CircleAvatar(
                  //       radius: size.height*0.03,
                  //       backgroundImage: const NetworkImage("https://firebasestorage.googleapis.com/v0/b/mykanjee-55ea0.appspot.com/o/MykanjeeChatImages%2F22-4%2F1714372215610?alt=media&token=245ca624-2a73-4c0a-af2b-c6626525dec6"),
                  //     ),
                  //     SizedBox(
                  //       width: size.width*0.03,
                  //     ),
                  //     Column(
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         AutoSizeText(widget.userName.toString(),
                  //           maxLines: 1,
                  //         style: GoogleFonts.cabin(
                  //           fontSize: size.height*0.021,
                  //           fontWeight: FontWeight.w600,
                  //           color: Colors.white
                  //         ),),
                  //         AutoSizeText("online",style: GoogleFonts.cabin(
                  //             fontSize: size.height*0.02,
                  //             fontWeight: FontWeight.w500,
                  //             color: Colors.white
                  //         ),)
                  //       ],
                  //     )
                  //   ],
                  // ),
                  elevation: 0,
                  backGroundColor: const Color.fromRGBO(174, 144, 194, 1),
                  profilePicture: "https://firebasestorage.googleapis.com/v0/b/mykanjee-55ea0.appspot.com/o/MykanjeeChatImages%2F22-4%2F1714372215610?alt=media&token=245ca624-2a73-4c0a-af2b-c6626525dec6",
                  backArrowColor: Colors.white70,
                  chatTitle: widget.userName.toString(),
                  chatTitleTextStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 0.25,
                  ),
                  userStatus: "Offline",
                  userStatusTextStyle: const TextStyle(color: Colors.white),
                ),
                chatBackgroundConfig: const ChatBackgroundConfiguration(
                  messageTimeIconColor: Colors.green,
                  messageTimeTextStyle: TextStyle(color: Colors.pinkAccent),
                  defaultGroupSeparatorConfig: DefaultGroupSeparatorConfiguration(
                    textStyle: TextStyle(
                      color: Colors.teal,
                      fontSize: 17,
                    ),
                  ),
                  backgroundColor: Colors.white70,
                ),
                sendMessageConfig: SendMessageConfiguration(
                  replyMessageColor: Colors.black26,
                  defaultSendButtonColor:   const Color.fromRGBO(174, 144, 194, 1),
                  replyDialogColor: Colors.black26,
                  replyTitleColor: Colors.black26,
                  textFieldBackgroundColor:   Colors.grey.shade300,
                  closeIconColor: Colors.black,
                  allowRecordingVoice: false,
                  textFieldConfig: TextFieldConfiguration(
                    onMessageTyping: (status) {
                      /// Do with status
                      debugPrint(status.toString());
                    },
                    compositionThresholdTime: const Duration(seconds: 1),
                    textStyle: const TextStyle(color: Colors.black87),
                  ),
                ),
                chatBubbleConfig: ChatBubbleConfiguration(
                  outgoingChatBubbleConfig:  ChatBubble(
                    receiptsWidgetConfig:
                    const ReceiptsWidgetConfig(showReceiptsIn: ShowReceiptsIn.all),
                    color: Colors.purple.shade200,
                  ),
                  inComingChatBubbleConfig: ChatBubble(
                    linkPreviewConfig: const LinkPreviewConfiguration(
                      linkStyle: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      backgroundColor: Colors.white,
                      bodyStyle: TextStyle(fontSize: 10),
                      titleStyle: TextStyle(fontSize: 5),
                    ),
                    textStyle: const TextStyle(color: Colors.black87),
                    onMessageRead: (message) {
                      /// send your message reciepts to the other client
                      debugPrint('Message Read');
                    },
                    senderNameTextStyle: const TextStyle(color: Colors.black),
                    color: Colors.purple.shade100,
                  ),
                ),
                messageConfig:  MessageConfiguration(
                  imageMessageConfig:  ImageMessageConfiguration(
                    margin:  const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                    onTap: (p0) {
                      print("...................${p0}");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>Image_viewer(path: p0.toString(),),
                        ),
                      );
                    },

                  ),
                  messageReactionConfig: const MessageReactionConfiguration(
                    backgroundColor: Colors.white,
                    borderColor: Colors.black,
                    reactedUserCountTextStyle: TextStyle(color: Colors.black,),
                    reactionCountTextStyle: TextStyle(color: Colors.black),
                  ),
                ),
                replyPopupConfig:  ReplyPopupConfiguration(
                  backgroundColor: Colors.grey.shade500,
                  buttonTextStyle: const TextStyle(color: Colors.black),
                  topBorderColor: Colors.black,
                ),
                repliedMessageConfig: RepliedMessageConfiguration(
                  backgroundColor: Colors.grey.shade500,
                  verticalBarColor:   const Color.fromRGBO(174, 144, 194, 1),
                  repliedMsgAutoScrollConfig: RepliedMsgAutoScrollConfig(
                    enableHighlightRepliedMsg: true,
                    highlightColor: Colors.pinkAccent.shade100,
                    highlightScale: 1.1,
                  ),
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    letterSpacing: 0.25,
                  ),
                  replyTitleTextStyle: const TextStyle(color: Colors.black),
                ),
                swipeToReplyConfig: const SwipeToReplyConfiguration(
                  replyIconColor: Colors.green,
                ),
              ),
            )
                :
            SizedBox(
              height: size.height * 1,
              width: size.width * 1,
              child: ChatView(
                currentUser: currentUser,
                chatController: _chatController,
                onSendTap: _onSendTap,
                // featureActiveConfig: const FeatureActiveConfig(
                //   lastSeenAgoBuilderVisibility: true,
                //   receiptsBuilderVisibility: true,
                // ),
                chatViewState: ChatViewState.hasMessages,

                appBar:  ChatViewAppBar(
                  elevation: 0,
                  backGroundColor:  const Color.fromRGBO(174, 144, 194, 1),
                  profilePicture:"",
                  backArrowColor: Colors.white70,
                  chatTitle:  widget.userName.toString(),
                  chatTitleTextStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    letterSpacing: 0.25,
                  ),
                  userStatus: "Online",
                  userStatusTextStyle: const TextStyle(color: Colors.white),
                ),
                chatBackgroundConfig: const ChatBackgroundConfiguration(

                  messageTimeIconColor: Colors.green,
                  messageTimeTextStyle: TextStyle(color: Colors.pinkAccent),
                  defaultGroupSeparatorConfig: DefaultGroupSeparatorConfiguration(
                    textStyle: TextStyle(
                      color: Colors.teal,
                      fontSize: 17,
                    ),
                  ),
                  backgroundColor: Colors.white70,
                ),
                sendMessageConfig: SendMessageConfiguration(
                  replyMessageColor: Colors.black26,
                  defaultSendButtonColor: Colors.black26,
                  replyDialogColor: Colors.black26,
                  replyTitleColor: Colors.black26,
                  textFieldBackgroundColor: Colors.grey.shade300,
                  closeIconColor: Colors.black,
                  allowRecordingVoice: false,
                  textFieldConfig: TextFieldConfiguration(
                    onMessageTyping: (status) {
                      /// Do with status
                      debugPrint(status.toString());
                    },
                    compositionThresholdTime: const Duration(seconds: 1),
                    textStyle: const TextStyle(color: Colors.black),
                  ),
                ),
                // chatBubbleConfig: ChatBubbleConfiguration(
                //   outgoingChatBubbleConfig: const ChatBubble(
                //     receiptsWidgetConfig:
                //         ReceiptsWidgetConfig(showReceiptsIn: ShowReceiptsIn.all),
                //     color: CupertinoColors.activeOrange,
                //   ),
                //   inComingChatBubbleConfig: ChatBubble(
                //     linkPreviewConfig: const LinkPreviewConfiguration(
                //       linkStyle: TextStyle(
                //         color: Colors.blue,
                //         decoration: TextDecoration.underline,
                //       ),
                //       backgroundColor: Colors.white,
                //       bodyStyle: TextStyle(fontSize: 10),
                //       titleStyle: TextStyle(fontSize: 5),
                //     ),
                //     textStyle: const TextStyle(color: Colors.pinkAccent),
                //     onMessageRead: (message) {
                //       /// send your message reciepts to the other client
                //       debugPrint('Message Read');
                //     },
                //     senderNameTextStyle: const TextStyle(color: Colors.black),
                //     color: Colors.pinkAccent,
                //   ),
                // ),
                reactionPopupConfig: ReactionPopupConfiguration(
                  backgroundColor: Colors.white,
                  userReactionCallback: (message, emoji){
                    print("skjnskjcanckj ${message.message}");
                    print(emoji);
                    // Your code goes here
                  },
                  padding: const EdgeInsets.all(12),
                  shadow: const BoxShadow(
                    color: Colors.black54,
                    blurRadius: 20,
                  ),
                ),

                messageConfig: const MessageConfiguration(
                  messageReactionConfig: MessageReactionConfiguration(
                    backgroundColor: Colors.white,
                    borderColor: Colors.black,
                    reactedUserCountTextStyle: TextStyle(color: Colors.black),
                    reactionCountTextStyle: TextStyle(color: Colors.black),
                  ),
                ),


                // replyPopupConfig: const ReplyPopupConfiguration(
                //   backgroundColor: Colors.white,
                //   buttonTextStyle: TextStyle(color: Colors.black),
                //   topBorderColor: Colors.black,
                // ),
                // repliedMessageConfig: RepliedMessageConfiguration(
                //   backgroundColor: Colors.white,
                //   verticalBarColor: Colors.pinkAccent,
                //   repliedMsgAutoScrollConfig: RepliedMsgAutoScrollConfig(
                //     enableHighlightRepliedMsg: true,
                //     highlightColor: Colors.pinkAccent.shade100,
                //     highlightScale: 1.1,
                //   ),
                //   textStyle: const TextStyle(
                //     color: Colors.white,
                //     fontWeight: FontWeight.bold,
                //     letterSpacing: 0.25,
                //   ),
                //   replyTitleTextStyle: const TextStyle(color: Colors.black),
                // ),
                // swipeToReplyConfig: const SwipeToReplyConfiguration(
                //   replyIconColor: Colors.green,
                // ),
              ),
            )
            ;
          },
        ),
      ),
    );
  }

  Future<void> _onSendTap(
      String message,
      ReplyMessage replyMessage,
      MessageType messageType,
      ) async {
    print("image url is ${widget.vendorShopImage}");
    String downloadUrl="";
    await FirebaseFirestore.instance.collection("chat channels").doc(widget.channel).get().then((value) async {
      if(value.data()==null){
       if(messageType.isImage){
         print(".................bnccbnvfbc ff");
         Reference reference =
         FirebaseStorage.instance.ref();
         Reference imageDirectory =
         reference.child("MykanjeeChatImages");
         String fileName = DateTime.now().millisecondsSinceEpoch.toString();
         Reference imageFolder = imageDirectory.child(widget.channel).child(fileName);
         print(" if condition nnnnnnnnnnnnnnnnn$imageFolder");
         await imageFolder
             .putFile(File(message)).whenComplete(() async {
           print("mmmmmmmmmmmmmmm................   $imageFolder");
           downloadUrl =
           await imageFolder.getDownloadURL().whenComplete(() async {
             await FirebaseFirestore.instance.collection("chat channels").doc(widget.channel).set({
               "Chat":[{
                 "Name":userModel.isNotEmpty?"${userModel["fullname"]}":"",
                 "Email":userModel["id"].toString(),
                 "Massage":downloadUrl.toString(),
                 "Time":DateTime.now(),
                 "massageType":messageType.name,
                 "ReplyMassage":replyMessage.message,
                 "ReplyMassageId":replyMessage.messageId,
                 "ReplyMassageBy":replyMessage.replyBy,
                 "ReplyMassageType":replyMessage.messageType.name,
                 "ReplyMassageTo":replyMessage.replyTo,
                 "userId":userModel["id"].toString(),
               }]
             });
           });
         });


       }
       else{
         await FirebaseFirestore.instance.collection("chat channels").doc(widget.channel).set({
           "Chat":[{
             "Name":userModel.isNotEmpty?"${userModel["fullname"]}":"",
             "Email":userModel["id"].toString(),
             "Massage":message,
             "Time":DateTime.now(),
             "massageType":messageType.name,
             "ReplyMassage":replyMessage.message,
             "ReplyMassageId":replyMessage.messageId,
             "ReplyMassageBy":replyMessage.replyBy,
             "ReplyMassageType":replyMessage.messageType.name,
             "ReplyMassageTo":replyMessage.replyTo,
             "userId":userModel["id"].toString(),
           }]
         });
       }
      }
      else{

        if (messageType.isImage) {
          print("bnccbnvfbc ff");
          Reference reference = FirebaseStorage.instance.ref();
          Reference imageDirectory = reference.child("MykanjeeChatImages");

          String fileName = DateTime.now().millisecondsSinceEpoch.toString();
          Reference imageFolder = imageDirectory.child(widget.channel).child(fileName);

          print("else condition nnnnnnnnnnnnnnnnn$imageFolder");
          print("image is ............$message)");

          await imageFolder.putFile(File(message)).whenComplete(() async {
            print("mmmmmmmmmmmmmmm.   $imageFolder");
            downloadUrl = await imageFolder.getDownloadURL();
            print("Download url is ..............$downloadUrl");
            await FirebaseFirestore.instance.collection("chat channels").doc(widget.channel).update({
              "Chat": FieldValue.arrayUnion([
                {
                  "Name": userModel.isNotEmpty ? "${userModel["fullname"]}" : "",
                  "Email": userModel["id"].toString(),
                  "Massage": downloadUrl,
                  "Time": DateTime.now(),
                  "massageType": messageType.name,
                  "ReplyMassage": replyMessage.message,
                  "ReplyMassageId": replyMessage.messageId,
                  "ReplyMassageBy": replyMessage.replyBy,
                  "ReplyMassageType": replyMessage.messageType.name,
                  "ReplyMassageTo": replyMessage.replyTo,
                  "userId": userModel["id"].toString(),
                }
              ])
            });
          });
        }

        else{
        await FirebaseFirestore.instance.collection("chat channels").doc(widget.channel).update({
          "Chat":FieldValue.arrayUnion([{
            "Name":userModel.isNotEmpty?"${userModel["fullname"]}":"",
            "Email":userModel["id"].toString(),
            "Massage":message,
            "Time":DateTime.now(),
            "massageType":messageType.name,
            "ReplyMassage":replyMessage.message,
            "ReplyMassageId":replyMessage.messageId,
            "ReplyMassageBy":replyMessage.replyBy,
            "ReplyMassageType":replyMessage.messageType.name,
            "ReplyMassageTo":replyMessage.replyTo,
            "userId":userModel["id"].toString(),

          }])
        });
      }
      }
    });
  }


  putFileOnStorage(file) async {
    Reference reference =
    FirebaseStorage.instance.ref();
    Reference imageDirectory =
    reference.child("MykanjeeChatImages");

    Reference imageFolder = imageDirectory
        .child(widget.channel);

    await imageFolder
        .putFile(File(file.path)).whenComplete(() async {

      String downloadUrl =
          await imageFolder.getDownloadURL();
    });
  }


}
