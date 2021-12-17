import 'dart:convert';

import 'package:flutter_gitee/generated/json/base/json_field.dart';
import 'package:flutter_gitee/generated/json/branch_entity.g.dart';

@JsonSerializable()
class BranchEntity {
  String? name;
  BranchCommit? commit;
  bool? protected;
  @JSONField(name: "protection_url")
  String? protectionUrl;

  BranchEntity();

  factory BranchEntity.fromJson(Map<String, dynamic> json) =>
      $BranchEntityFromJson(json);

  Map<String, dynamic> toJson() => $BranchEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class BranchCommit {
  String? sha;
  String? url;

  BranchCommit();

  factory BranchCommit.fromJson(Map<String, dynamic> json) =>
      $BranchCommitFromJson(json);

  Map<String, dynamic> toJson() => $BranchCommitToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
