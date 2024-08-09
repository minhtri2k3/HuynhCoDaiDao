import 'package:cached_network_image/cached_network_image.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hive/hive.dart';

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
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../../models/user_token.dart';

final GetIt getIt = GetIt.instance;

class MessageCategoryWidget extends StatefulWidget {
  final String Message_actionUrl;

  const MessageCategoryWidget({
    Key? key,
    this.Message_actionUrl = '/app/messages/thong-bao',
  }) : super(key: key);

  @override
  State createState() => _MessageCategoryWidgetState();
}

class _MessageCategoryWidgetState extends State<MessageCategoryWidget> {
  final Box _appData = Hive.box('appData');
  final MessageCategoryRepository _messageCategoryRepository =
      getIt.get<MessageCategoryRepository>();
  late final PagingController<int, Message> _pagingController;
  @override
  void initState() {
    super.initState();
    _pagingController = PagingController(firstPageKey: 1);
    _pagingController.addPageRequestListener((pageKey) {
      _fetchMessageList(pageKey);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _fetchMessageList(int pageKey) async {
    try {
      print('Fetching the message');
      final messageCatology =
          await _messageCategoryRepository.get(path: widget.Message_actionUrl);
      final messagesList = messageCatology.messages;
      final messagesData = messagesList?.data ?? [];
      final isLastPage = messagesList!.to >= messagesList.total;
      if (messagesList.nextPageUrl == null || isLastPage) {
        _pagingController.appendLastPage(messagesData);
        print('Fetch the last page');
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(messagesData, nextPageKey);
        print('Fetch the page');
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Expanded(
      child: PagedListView<int, Message>(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Message>(
            itemBuilder: (BuildContext context, Message item, int index) =>
                Padding(
                  padding: const EdgeInsets.only(left: 15 , top : 10 , bottom:  10 , right:  15),
                  child: Container(
                    decoration:  BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(15), // Rounded corners
                      // boxShadow: [
                      //   BoxShadow(
                      //     // color: Colors.black.withOpacity(0.1),
                      //     spreadRadius: 1,
                      //     blurRadius: 5,
                      //     offset: Offset(0, 3), // Shadow position
                      //   ),
                      // ],
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: item.customStyle?.primaryIconUrl != null
                              ? CachedNetworkImage(
                            httpHeaders: {
                              'Authorization': 'Bearer ' +
                                  (_appData.get('userToken') as UserToken)
                                      .accessToken,
                            },
                            imageUrl: item.customStyle!.primaryIconUrl!,
                            placeholder: (context, url) => CircleAvatar(
                              backgroundColor: Colors.grey,
                              child: CircularProgressIndicator(
                                color: Colors.orange,
                              ), // Spinner while loading
                            ),
                            errorWidget: (context, url, error) =>
                                CircleAvatar(
                                  child: Container(
                                      height: double.infinity,
                                      width: double.infinity,
                                      child: Icon(
                                        Icons.account_circle_rounded,
                                        color: Colors.grey,
                                        size: 40,
                                      )),
                                ),
                            width: 40, // Adjust width and height as needed
                            height: 40,
                            fit: BoxFit.cover,
                          )
                              : Image.asset(
                            'assets/default_menu_item_icon.png',
                            width: 35,
                            height: 35,
                          ),
                          title: Text(
                              '${item.date}',
                            style: TextStyle(
                              fontSize: 13,

                            ),
                          ),
                          subtitle: Text('${item.title}'),
                        ),
                      ],

                    ),
                  ),
                )
        ),
      ),
    ));
  }
}
