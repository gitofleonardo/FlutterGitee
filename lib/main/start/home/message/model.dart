import 'package:flutter_gitee/main/start/home/message/bean/notification_message_entity.dart';
import 'package:flutter_gitee/main/start/home/message/bean/user_message_entity.dart';
import 'package:flutter_gitee/main/start/home/message/message_page.dart';
import 'package:flutter_gitee/utils/global_context.dart';
import 'package:flutter_gitee/utils/global_utils.dart';

import '../../../base/request_base_result.dart';

Future<BaseResult<UserMessageEntity>> getUserMessages(
    bool? unread, int page, int perPage) {
  final params = {
    "access_token": globalToken,
    "page": page,
    "per_page": perPage
  };
  if (unread != null) {
    params["unread"] = unread;
  }
  return postRequest<UserMessageEntity>(
      "api/v5/notifications/messages", RequestType.get, params);
}

Future<BaseResult<NotificationMessageEntity>> getNotificationMessages(
    bool? unread, int page, int perPage, MessageType type) {
  final params = {
    "access_token": globalToken,
    "page": page,
    "per_page": perPage
  };
  if (unread != null) {
    params["unread"] = unread;
  }
  switch (type) {
    case MessageType.event:
      params["type"] = "event";
      break;
    case MessageType.message:
      break;
    case MessageType.refer:
      params["type"] = "referer";
      break;
  }
  return postRequest<NotificationMessageEntity>(
      "api/v5/notifications/threads", RequestType.get, params);
}

Future<BaseResult<String>> markMessageAsRead(String messageId) {
  return postRequest("/api/v5/notifications/messages/$messageId",
      RequestType.patch, {"access_token": globalToken});
}
