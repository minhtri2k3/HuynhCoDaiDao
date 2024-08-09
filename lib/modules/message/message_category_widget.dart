import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:huynhcodaidaover2/modules/message/message.dart';
import 'package:huynhcodaidaover2/modules/message/message_list.dart';
import 'package:huynhcodaidaover2/modules/message/message_category.dart';
import 'package:huynhcodaidaover2/models/banner.dart' as BannerModel;

import 'package:huynhcodaidaover2/widgets/network_image_widget.dart';
import 'package:huynhcodaidaover2/widgets/banner_widget.dart';
import 'package:huynhcodaidaover2/widgets/loading_widget.dart';
import 'package:huynhcodaidaover2/widgets/label_widget.dart';

import 'package:huynhcodaidaover2/modules/message/message_category_repository.dart';
import 'package:huynhcodaidaover2/services/router_service.dart';

final GetIt getIt = GetIt.instance;

class MessageCategoryWidget extends StatefulWidget {
  final String actionUrl;

  const MessageCategoryWidget({
    Key? key,
    this.actionUrl = '/app/messages/thong-bao',
  }) : super(key: key);

  @override
  State createState() => _MessageCategoryWidgetState();
}

class _MessageCategoryWidgetState extends State<MessageCategoryWidget> {
  final MessageCategoryRepository _messageCategoryRepository = getIt.get<MessageCategoryRepository>();

  dynamic _state;
  late Future<MessageCategory> _messageCategoryFuture;
  late BannerModel.Banner _banner;
  int _page = 1;
  bool _shouldLoad = false;
  // MessageCategory? _messageCategory ; // 1st
  List<Message>? _messages; // 2nd
  Message? _message; // 3rd
  @override
  void initState() {
    _fetchMessageList();

    super.initState();
  }

  @override
  void didUpdateWidget(covariant MessageCategoryWidget oldWidget) {
    _fetchMessageList();
    super.didUpdateWidget(oldWidget);
  }
  @override
  void dispose() {
    super.dispose();
  }
  Future <void> _fetchMessageList() async{
    try{
      print('Fetching the message');
       final MessageCategory  _messageCategory =  _messageCategoryRepository.get(
        path: widget.actionUrl,
      ) as MessageCategory;
        _messages = _messageCategory.messages as List<Message>?;
        print('The message category is ${_messageCategory.id}');
    }catch(e){

    }
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       body:  Column(
         children: [
           Text('This is the message widget'),
         ],
     )
     );
  }


}
