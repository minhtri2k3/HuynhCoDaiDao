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
  late MessageCategory _messageCategory;
  late MessageList _messageList;
  late List<Message> _messages;
  late BannerModel.Banner _banner;
  int _page = 1;
  bool _shouldLoad = false;

  @override
  void initState() {
    _messageCategoryFuture = _messageCategoryRepository.get(
      path: widget.actionUrl,
    );
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  Future <void> _fetchMessageList(int pagekey) async{
    try{
      print('Fetching the message');

    }catch(e){

    }
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<MessageCategory>(
      future: _messageCategoryFuture,
      builder: (BuildContext context, AsyncSnapshot<MessageCategory> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: SpinKitFadingCircle(
              size: 120,
              color: Colors.amber,
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            _messageCategory = snapshot.data!;
            _messageList = _messageCategory.messages!;
            _messages = _messageList.data ?? [];
            _banner = _messageCategory.banner!;

            // You can use _messageCategory, _messageList, _messages, and _banner here
          } else if (snapshot.hasError) {
            // Handle error state
            return Center(child: Text('Error: ${snapshot.error}'));
          }
        }

        return _buildContent();
      },
    );
  }

  Widget _buildContent() {
    if (_messages.isEmpty) {
      return Center(child: Text('No messages found.'));
    }

    return ListView.builder(
      itemCount: _messages.length,
      itemBuilder: (context, index) {
        final message = _messages[index];
        return ListTile(
          title: Text(message.title ?? 'No title'),
        );
      },
    );
  }
}
