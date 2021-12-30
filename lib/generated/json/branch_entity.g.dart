import 'package:flutter_gitee/generated/json/base/json_convert_content.dart';
import 'package:flutter_gitee/repo/bean/branch_entity.dart';

BranchEntity $BranchEntityFromJson(Map<String, dynamic> json) {
	final BranchEntity branchEntity = BranchEntity();
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		branchEntity.name = name;
	}
	final BranchCommit? commit = jsonConvert.convert<BranchCommit>(json['commit']);
	if (commit != null) {
		branchEntity.commit = commit;
	}
	final bool? protected = jsonConvert.convert<bool>(json['protected']);
	if (protected != null) {
		branchEntity.protected = protected;
	}
	return branchEntity;
}

Map<String, dynamic> $BranchEntityToJson(BranchEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['name'] = entity.name;
	data['commit'] = entity.commit?.toJson();
	data['protected'] = entity.protected;
	return data;
}

BranchCommit $BranchCommitFromJson(Map<String, dynamic> json) {
	final BranchCommit branchCommit = BranchCommit();
	final String? sha = jsonConvert.convert<String>(json['sha']);
	if (sha != null) {
		branchCommit.sha = sha;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		branchCommit.url = url;
	}
	return branchCommit;
}

Map<String, dynamic> $BranchCommitToJson(BranchCommit entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['sha'] = entity.sha;
	data['url'] = entity.url;
	return data;
}