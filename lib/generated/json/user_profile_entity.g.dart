import 'package:flutter_gitee/generated/json/base/json_convert_content.dart';
import 'package:flutter_gitee/user/bean/result/success/user_profile_entity.dart';

UserProfileEntity $UserProfileEntityFromJson(Map<String, dynamic> json) {
	final UserProfileEntity userProfileEntity = UserProfileEntity();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		userProfileEntity.id = id;
	}
	final String? login = jsonConvert.convert<String>(json['login']);
	if (login != null) {
		userProfileEntity.login = login;
	}
	final String? name = jsonConvert.convert<String>(json['name']);
	if (name != null) {
		userProfileEntity.name = name;
	}
	final String? avatarUrl = jsonConvert.convert<String>(json['avatar_url']);
	if (avatarUrl != null) {
		userProfileEntity.avatarUrl = avatarUrl;
	}
	final String? url = jsonConvert.convert<String>(json['url']);
	if (url != null) {
		userProfileEntity.url = url;
	}
	final String? htmlUrl = jsonConvert.convert<String>(json['html_url']);
	if (htmlUrl != null) {
		userProfileEntity.htmlUrl = htmlUrl;
	}
	final String? remark = jsonConvert.convert<String>(json['remark']);
	if (remark != null) {
		userProfileEntity.remark = remark;
	}
	final String? followersUrl = jsonConvert.convert<String>(json['followers_url']);
	if (followersUrl != null) {
		userProfileEntity.followersUrl = followersUrl;
	}
	final String? followingUrl = jsonConvert.convert<String>(json['following_url']);
	if (followingUrl != null) {
		userProfileEntity.followingUrl = followingUrl;
	}
	final String? gistsUrl = jsonConvert.convert<String>(json['gists_url']);
	if (gistsUrl != null) {
		userProfileEntity.gistsUrl = gistsUrl;
	}
	final String? starredUrl = jsonConvert.convert<String>(json['starred_url']);
	if (starredUrl != null) {
		userProfileEntity.starredUrl = starredUrl;
	}
	final String? subscriptionsUrl = jsonConvert.convert<String>(json['subscriptions_url']);
	if (subscriptionsUrl != null) {
		userProfileEntity.subscriptionsUrl = subscriptionsUrl;
	}
	final String? organizationsUrl = jsonConvert.convert<String>(json['organizations_url']);
	if (organizationsUrl != null) {
		userProfileEntity.organizationsUrl = organizationsUrl;
	}
	final String? reposUrl = jsonConvert.convert<String>(json['repos_url']);
	if (reposUrl != null) {
		userProfileEntity.reposUrl = reposUrl;
	}
	final String? eventsUrl = jsonConvert.convert<String>(json['events_url']);
	if (eventsUrl != null) {
		userProfileEntity.eventsUrl = eventsUrl;
	}
	final String? receivedEventsUrl = jsonConvert.convert<String>(json['received_events_url']);
	if (receivedEventsUrl != null) {
		userProfileEntity.receivedEventsUrl = receivedEventsUrl;
	}
	final String? type = jsonConvert.convert<String>(json['type']);
	if (type != null) {
		userProfileEntity.type = type;
	}
	final String? blog = jsonConvert.convert<String>(json['blog']);
	if (blog != null) {
		userProfileEntity.blog = blog;
	}
	final String? weibo = jsonConvert.convert<String>(json['weibo']);
	if (weibo != null) {
		userProfileEntity.weibo = weibo;
	}
	final String? bio = jsonConvert.convert<String>(json['bio']);
	if (bio != null) {
		userProfileEntity.bio = bio;
	}
	final int? publicRepos = jsonConvert.convert<int>(json['public_repos']);
	if (publicRepos != null) {
		userProfileEntity.publicRepos = publicRepos;
	}
	final int? publicGists = jsonConvert.convert<int>(json['public_gists']);
	if (publicGists != null) {
		userProfileEntity.publicGists = publicGists;
	}
	final int? followers = jsonConvert.convert<int>(json['followers']);
	if (followers != null) {
		userProfileEntity.followers = followers;
	}
	final int? following = jsonConvert.convert<int>(json['following']);
	if (following != null) {
		userProfileEntity.following = following;
	}
	final int? stared = jsonConvert.convert<int>(json['stared']);
	if (stared != null) {
		userProfileEntity.stared = stared;
	}
	final int? watched = jsonConvert.convert<int>(json['watched']);
	if (watched != null) {
		userProfileEntity.watched = watched;
	}
	final String? createdAt = jsonConvert.convert<String>(json['created_at']);
	if (createdAt != null) {
		userProfileEntity.createdAt = createdAt;
	}
	final String? updatedAt = jsonConvert.convert<String>(json['updated_at']);
	if (updatedAt != null) {
		userProfileEntity.updatedAt = updatedAt;
	}
	final String? email = jsonConvert.convert<String>(json['email']);
	if (email != null) {
		userProfileEntity.email = email;
	}
	return userProfileEntity;
}

Map<String, dynamic> $UserProfileEntityToJson(UserProfileEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['login'] = entity.login;
	data['name'] = entity.name;
	data['avatar_url'] = entity.avatarUrl;
	data['url'] = entity.url;
	data['html_url'] = entity.htmlUrl;
	data['remark'] = entity.remark;
	data['followers_url'] = entity.followersUrl;
	data['following_url'] = entity.followingUrl;
	data['gists_url'] = entity.gistsUrl;
	data['starred_url'] = entity.starredUrl;
	data['subscriptions_url'] = entity.subscriptionsUrl;
	data['organizations_url'] = entity.organizationsUrl;
	data['repos_url'] = entity.reposUrl;
	data['events_url'] = entity.eventsUrl;
	data['received_events_url'] = entity.receivedEventsUrl;
	data['type'] = entity.type;
	data['blog'] = entity.blog;
	data['weibo'] = entity.weibo;
	data['bio'] = entity.bio;
	data['public_repos'] = entity.publicRepos;
	data['public_gists'] = entity.publicGists;
	data['followers'] = entity.followers;
	data['following'] = entity.following;
	data['stared'] = entity.stared;
	data['watched'] = entity.watched;
	data['created_at'] = entity.createdAt;
	data['updated_at'] = entity.updatedAt;
	data['email'] = entity.email;
	return data;
}