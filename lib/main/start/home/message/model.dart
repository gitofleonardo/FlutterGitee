import 'package:flutter_gitee/main/start/home/message/bean/user_message_entity.dart';
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
