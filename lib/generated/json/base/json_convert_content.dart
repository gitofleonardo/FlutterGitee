// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter_gitee/repo/bean/branch_entity.dart';
import 'package:flutter_gitee/repo/bean/commit_detail_entity.dart';
import 'package:flutter_gitee/repo/bean/issue_comment_entity.dart';
import 'package:flutter_gitee/repo/bean/issue_result_entity.dart';
import 'package:flutter_gitee/repo/bean/pull_request_entity.dart';
import 'package:flutter_gitee/repo/bean/repo_commit_entity.dart';
import 'package:flutter_gitee/repo/bean/repo_file_entity.dart';
import 'package:flutter_gitee/repo/bean/repository_blob_entity.dart';
import 'package:flutter_gitee/repo/bean/repository_entity.dart';
import 'package:flutter_gitee/repo/bean/repository_tree_entity.dart';
import 'package:flutter_gitee/user/bean/event_result_entity.dart';
import 'package:flutter_gitee/user/bean/follow_result_entity.dart';
import 'package:flutter_gitee/user/bean/login_success_result_entity.dart';
import 'package:flutter_gitee/user/bean/user_profile_entity.dart';

JsonConvert jsonConvert = JsonConvert();

class JsonConvert {
  T? convert<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    return asT<T>(value);
  }

  List<T?>? convertList<T>(List<dynamic>? value) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => asT<T>(e)).toList();
    } catch (e, stackTrace) {
      print('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) => asT<T>(e)!).toList();
    } catch (e, stackTrace) {
      print('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  T? asT<T extends Object?>(dynamic value) {
    if (value is T) {
      return value;
    }
    final String type = T.toString();
    try {
      final String valueS = value.toString();
      if (type == "String") {
        return valueS as T;
      } else if (type == "int") {
        final int? intValue = int.tryParse(valueS);
        if (intValue == null) {
          return double.tryParse(valueS)?.toInt() as T?;
        } else {
          return intValue as T;
        }
      } else if (type == "double") {
        return double.parse(valueS) as T;
      } else if (type == "DateTime") {
        return DateTime.parse(valueS) as T;
      } else if (type == "bool") {
        if (valueS == '0' || valueS == '1') {
          return (valueS == '1') as T;
        }
        return (valueS == 'true') as T;
      } else {
        return JsonConvert.fromJsonAsT<T>(value);
      }
    } catch (e, stackTrace) {
      print('asT<$T> $e $stackTrace');
      return null;
    }
  }

  //Go back to a single instance by type
  static M? _fromJsonSingle<M>(Map<String, dynamic> json) {
    final String type = M.toString();
    if (type == (BranchEntity).toString()) {
      return BranchEntity.fromJson(json) as M;
    }
    if (type == (BranchCommit).toString()) {
      return BranchCommit.fromJson(json) as M;
    }
    if (type == (CommitDetailEntity).toString()) {
      return CommitDetailEntity.fromJson(json) as M;
    }
    if (type == (CommitDetailCommit).toString()) {
      return CommitDetailCommit.fromJson(json) as M;
    }
    if (type == (CommitDetailCommitAuthor).toString()) {
      return CommitDetailCommitAuthor.fromJson(json) as M;
    }
    if (type == (CommitDetailCommitCommitter).toString()) {
      return CommitDetailCommitCommitter.fromJson(json) as M;
    }
    if (type == (CommitDetailCommitTree).toString()) {
      return CommitDetailCommitTree.fromJson(json) as M;
    }
    if (type == (CommitDetailParents).toString()) {
      return CommitDetailParents.fromJson(json) as M;
    }
    if (type == (CommitDetailStats).toString()) {
      return CommitDetailStats.fromJson(json) as M;
    }
    if (type == (CommitDetailFiles).toString()) {
      return CommitDetailFiles.fromJson(json) as M;
    }
    if (type == (IssueCommentEntity).toString()) {
      return IssueCommentEntity.fromJson(json) as M;
    }
    if (type == (IssueCommentUser).toString()) {
      return IssueCommentUser.fromJson(json) as M;
    }
    if (type == (IssueCommentTarget).toString()) {
      return IssueCommentTarget.fromJson(json) as M;
    }
    if (type == (IssueCommentTargetIssue).toString()) {
      return IssueCommentTargetIssue.fromJson(json) as M;
    }
    if (type == (IssueResultEntity).toString()) {
      return IssueResultEntity.fromJson(json) as M;
    }
    if (type == (IssueResultLabel).toString()) {
      return IssueResultLabel.fromJson(json) as M;
    }
    if (type == (IssueResultAssignee).toString()) {
      return IssueResultAssignee.fromJson(json) as M;
    }
    if (type == (IssueResultMilestone).toString()) {
      return IssueResultMilestone.fromJson(json) as M;
    }
    if (type == (IssueResultProgram).toString()) {
      return IssueResultProgram.fromJson(json) as M;
    }
    if (type == (IssueResultProgramAssignee).toString()) {
      return IssueResultProgramAssignee.fromJson(json) as M;
    }
    if (type == (IssueResultProgramAuthor).toString()) {
      return IssueResultProgramAuthor.fromJson(json) as M;
    }
    if (type == (IssueResultIssueTypeDetail).toString()) {
      return IssueResultIssueTypeDetail.fromJson(json) as M;
    }
    if (type == (IssueResultIssueStateDetail).toString()) {
      return IssueResultIssueStateDetail.fromJson(json) as M;
    }
    if (type == (PullRequestEntity).toString()) {
      return PullRequestEntity.fromJson(json) as M;
    }
    if (type == (PullRequestLabel).toString()) {
      return PullRequestLabel.fromJson(json) as M;
    }
    if (type == (PullRequestHead).toString()) {
      return PullRequestHead.fromJson(json) as M;
    }
    if (type == (PullRequestHeadUser).toString()) {
      return PullRequestHeadUser.fromJson(json) as M;
    }
    if (type == (PullRequestHeadRepo).toString()) {
      return PullRequestHeadRepo.fromJson(json) as M;
    }
    if (type == (PullRequestHeadRepoNamespace).toString()) {
      return PullRequestHeadRepoNamespace.fromJson(json) as M;
    }
    if (type == (PullRequestHeadRepoOwner).toString()) {
      return PullRequestHeadRepoOwner.fromJson(json) as M;
    }
    if (type == (PullRequestHeadRepoAssigner).toString()) {
      return PullRequestHeadRepoAssigner.fromJson(json) as M;
    }
    if (type == (PullRequestBase).toString()) {
      return PullRequestBase.fromJson(json) as M;
    }
    if (type == (PullRequestBaseUser).toString()) {
      return PullRequestBaseUser.fromJson(json) as M;
    }
    if (type == (PullRequestBaseRepo).toString()) {
      return PullRequestBaseRepo.fromJson(json) as M;
    }
    if (type == (PullRequestBaseRepoNamespace).toString()) {
      return PullRequestBaseRepoNamespace.fromJson(json) as M;
    }
    if (type == (PullRequestBaseRepoOwner).toString()) {
      return PullRequestBaseRepoOwner.fromJson(json) as M;
    }
    if (type == (PullRequestBaseRepoAssigner).toString()) {
      return PullRequestBaseRepoAssigner.fromJson(json) as M;
    }
    if (type == (PullRequestLinks).toString()) {
      return PullRequestLinks.fromJson(json) as M;
    }
    if (type == (PullRequestLinksSelf).toString()) {
      return PullRequestLinksSelf.fromJson(json) as M;
    }
    if (type == (PullRequestLinksHtml).toString()) {
      return PullRequestLinksHtml.fromJson(json) as M;
    }
    if (type == (PullRequestLinksIssue).toString()) {
      return PullRequestLinksIssue.fromJson(json) as M;
    }
    if (type == (PullRequestLinksComments).toString()) {
      return PullRequestLinksComments.fromJson(json) as M;
    }
    if (type == (PullRequestLinksReviewComments).toString()) {
      return PullRequestLinksReviewComments.fromJson(json) as M;
    }
    if (type == (PullRequestLinksReviewComment).toString()) {
      return PullRequestLinksReviewComment.fromJson(json) as M;
    }
    if (type == (PullRequestLinksCommits).toString()) {
      return PullRequestLinksCommits.fromJson(json) as M;
    }
    if (type == (PullRequestUser).toString()) {
      return PullRequestUser.fromJson(json) as M;
    }
    if (type == (RepoCommitEntity).toString()) {
      return RepoCommitEntity.fromJson(json) as M;
    }
    if (type == (RepoCommitCommit).toString()) {
      return RepoCommitCommit.fromJson(json) as M;
    }
    if (type == (RepoCommitCommitAuthor).toString()) {
      return RepoCommitCommitAuthor.fromJson(json) as M;
    }
    if (type == (RepoCommitCommitCommitter).toString()) {
      return RepoCommitCommitCommitter.fromJson(json) as M;
    }
    if (type == (RepoCommitCommitTree).toString()) {
      return RepoCommitCommitTree.fromJson(json) as M;
    }
    if (type == (RepoCommitAuthor).toString()) {
      return RepoCommitAuthor.fromJson(json) as M;
    }
    if (type == (RepoCommitCommitter).toString()) {
      return RepoCommitCommitter.fromJson(json) as M;
    }
    if (type == (RepoCommitParents).toString()) {
      return RepoCommitParents.fromJson(json) as M;
    }
    if (type == (RepoFileEntity).toString()) {
      return RepoFileEntity.fromJson(json) as M;
    }
    if (type == (ReadmeLinks).toString()) {
      return ReadmeLinks.fromJson(json) as M;
    }
    if (type == (RepositoryBlobEntity).toString()) {
      return RepositoryBlobEntity.fromJson(json) as M;
    }
    if (type == (RepositoryEntity).toString()) {
      return RepositoryEntity.fromJson(json) as M;
    }
    if (type == (RepositoryNamespace).toString()) {
      return RepositoryNamespace.fromJson(json) as M;
    }
    if (type == (RepositoryOwner).toString()) {
      return RepositoryOwner.fromJson(json) as M;
    }
    if (type == (RepositoryAssigner).toString()) {
      return RepositoryAssigner.fromJson(json) as M;
    }
    if (type == (RepositoryPermission).toString()) {
      return RepositoryPermission.fromJson(json) as M;
    }
    if (type == (RepositoryAssignee).toString()) {
      return RepositoryAssignee.fromJson(json) as M;
    }
    if (type == (RepositoryTesters).toString()) {
      return RepositoryTesters.fromJson(json) as M;
    }
    if (type == (RepositoryTreeEntity).toString()) {
      return RepositoryTreeEntity.fromJson(json) as M;
    }
    if (type == (RepositoryTreeTree).toString()) {
      return RepositoryTreeTree.fromJson(json) as M;
    }
    if (type == (EventResultEntity).toString()) {
      return EventResultEntity.fromJson(json) as M;
    }
    if (type == (EventResultActor).toString()) {
      return EventResultActor.fromJson(json) as M;
    }
    if (type == (EventResultRepo).toString()) {
      return EventResultRepo.fromJson(json) as M;
    }
    if (type == (EventResultPayload).toString()) {
      return EventResultPayload.fromJson(json) as M;
    }
    if (type == (EventResultPayloadComment).toString()) {
      return EventResultPayloadComment.fromJson(json) as M;
    }
    if (type == (EventResultPayloadIssue).toString()) {
      return EventResultPayloadIssue.fromJson(json) as M;
    }
    if (type == (EventResultPayloadCommit).toString()) {
      return EventResultPayloadCommit.fromJson(json) as M;
    }
    if (type == (EventResultPayloadCommitAuthor).toString()) {
      return EventResultPayloadCommitAuthor.fromJson(json) as M;
    }
    if (type == (EventResultPayloadTarget).toString()) {
      return EventResultPayloadTarget.fromJson(json) as M;
    }
    if (type == (EventResultOrg).toString()) {
      return EventResultOrg.fromJson(json) as M;
    }
    if (type == (FollowResultEntity).toString()) {
      return FollowResultEntity.fromJson(json) as M;
    }
    if (type == (LoginSuccessResultEntity).toString()) {
      return LoginSuccessResultEntity.fromJson(json) as M;
    }
    if (type == (UserProfileEntity).toString()) {
      return UserProfileEntity.fromJson(json) as M;
    }

    print("$type not found");

    return null;
  }

  //list is returned by type
  static M? _getListChildType<M>(List<dynamic> data) {
    if (<BranchEntity>[] is M) {
      return data.map<BranchEntity>((e) => BranchEntity.fromJson(e)).toList()
          as M;
    }
    if (<BranchCommit>[] is M) {
      return data.map<BranchCommit>((e) => BranchCommit.fromJson(e)).toList()
          as M;
    }
    if (<CommitDetailEntity>[] is M) {
      return data
          .map<CommitDetailEntity>((e) => CommitDetailEntity.fromJson(e))
          .toList() as M;
    }
    if (<CommitDetailCommit>[] is M) {
      return data
          .map<CommitDetailCommit>((e) => CommitDetailCommit.fromJson(e))
          .toList() as M;
    }
    if (<CommitDetailCommitAuthor>[] is M) {
      return data
          .map<CommitDetailCommitAuthor>(
              (e) => CommitDetailCommitAuthor.fromJson(e))
          .toList() as M;
    }
    if (<CommitDetailCommitCommitter>[] is M) {
      return data
          .map<CommitDetailCommitCommitter>(
              (e) => CommitDetailCommitCommitter.fromJson(e))
          .toList() as M;
    }
    if (<CommitDetailCommitTree>[] is M) {
      return data
          .map<CommitDetailCommitTree>(
              (e) => CommitDetailCommitTree.fromJson(e))
          .toList() as M;
    }
    if (<CommitDetailParents>[] is M) {
      return data
          .map<CommitDetailParents>((e) => CommitDetailParents.fromJson(e))
          .toList() as M;
    }
    if (<CommitDetailStats>[] is M) {
      return data
          .map<CommitDetailStats>((e) => CommitDetailStats.fromJson(e))
          .toList() as M;
    }
    if (<CommitDetailFiles>[] is M) {
      return data
          .map<CommitDetailFiles>((e) => CommitDetailFiles.fromJson(e))
          .toList() as M;
    }
    if (<IssueCommentEntity>[] is M) {
      return data
          .map<IssueCommentEntity>((e) => IssueCommentEntity.fromJson(e))
          .toList() as M;
    }
    if (<IssueCommentUser>[] is M) {
      return data
          .map<IssueCommentUser>((e) => IssueCommentUser.fromJson(e))
          .toList() as M;
    }
    if (<IssueCommentTarget>[] is M) {
      return data
          .map<IssueCommentTarget>((e) => IssueCommentTarget.fromJson(e))
          .toList() as M;
    }
    if (<IssueCommentTargetIssue>[] is M) {
      return data
          .map<IssueCommentTargetIssue>(
              (e) => IssueCommentTargetIssue.fromJson(e))
          .toList() as M;
    }
    if (<IssueResultEntity>[] is M) {
      return data
          .map<IssueResultEntity>((e) => IssueResultEntity.fromJson(e))
          .toList() as M;
    }
    if (<IssueResultLabel>[] is M) {
      return data
          .map<IssueResultLabel>((e) => IssueResultLabel.fromJson(e))
          .toList() as M;
    }
    if (<IssueResultAssignee>[] is M) {
      return data
          .map<IssueResultAssignee>((e) => IssueResultAssignee.fromJson(e))
          .toList() as M;
    }
    if (<IssueResultMilestone>[] is M) {
      return data
          .map<IssueResultMilestone>((e) => IssueResultMilestone.fromJson(e))
          .toList() as M;
    }
    if (<IssueResultProgram>[] is M) {
      return data
          .map<IssueResultProgram>((e) => IssueResultProgram.fromJson(e))
          .toList() as M;
    }
    if (<IssueResultProgramAssignee>[] is M) {
      return data
          .map<IssueResultProgramAssignee>(
              (e) => IssueResultProgramAssignee.fromJson(e))
          .toList() as M;
    }
    if (<IssueResultProgramAuthor>[] is M) {
      return data
          .map<IssueResultProgramAuthor>(
              (e) => IssueResultProgramAuthor.fromJson(e))
          .toList() as M;
    }
    if (<IssueResultIssueTypeDetail>[] is M) {
      return data
          .map<IssueResultIssueTypeDetail>(
              (e) => IssueResultIssueTypeDetail.fromJson(e))
          .toList() as M;
    }
    if (<IssueResultIssueStateDetail>[] is M) {
      return data
          .map<IssueResultIssueStateDetail>(
              (e) => IssueResultIssueStateDetail.fromJson(e))
          .toList() as M;
    }
    if (<PullRequestEntity>[] is M) {
      return data
          .map<PullRequestEntity>((e) => PullRequestEntity.fromJson(e))
          .toList() as M;
    }
    if (<PullRequestLabel>[] is M) {
      return data
          .map<PullRequestLabel>((e) => PullRequestLabel.fromJson(e))
          .toList() as M;
    }
    if (<PullRequestHead>[] is M) {
      return data
          .map<PullRequestHead>((e) => PullRequestHead.fromJson(e))
          .toList() as M;
    }
    if (<PullRequestHeadUser>[] is M) {
      return data
          .map<PullRequestHeadUser>((e) => PullRequestHeadUser.fromJson(e))
          .toList() as M;
    }
    if (<PullRequestHeadRepo>[] is M) {
      return data
          .map<PullRequestHeadRepo>((e) => PullRequestHeadRepo.fromJson(e))
          .toList() as M;
    }
    if (<PullRequestHeadRepoNamespace>[] is M) {
      return data
          .map<PullRequestHeadRepoNamespace>(
              (e) => PullRequestHeadRepoNamespace.fromJson(e))
          .toList() as M;
    }
    if (<PullRequestHeadRepoOwner>[] is M) {
      return data
          .map<PullRequestHeadRepoOwner>(
              (e) => PullRequestHeadRepoOwner.fromJson(e))
          .toList() as M;
    }
    if (<PullRequestHeadRepoAssigner>[] is M) {
      return data
          .map<PullRequestHeadRepoAssigner>(
              (e) => PullRequestHeadRepoAssigner.fromJson(e))
          .toList() as M;
    }
    if (<PullRequestBase>[] is M) {
      return data
          .map<PullRequestBase>((e) => PullRequestBase.fromJson(e))
          .toList() as M;
    }
    if (<PullRequestBaseUser>[] is M) {
      return data
          .map<PullRequestBaseUser>((e) => PullRequestBaseUser.fromJson(e))
          .toList() as M;
    }
    if (<PullRequestBaseRepo>[] is M) {
      return data
          .map<PullRequestBaseRepo>((e) => PullRequestBaseRepo.fromJson(e))
          .toList() as M;
    }
    if (<PullRequestBaseRepoNamespace>[] is M) {
      return data
          .map<PullRequestBaseRepoNamespace>(
              (e) => PullRequestBaseRepoNamespace.fromJson(e))
          .toList() as M;
    }
    if (<PullRequestBaseRepoOwner>[] is M) {
      return data
          .map<PullRequestBaseRepoOwner>(
              (e) => PullRequestBaseRepoOwner.fromJson(e))
          .toList() as M;
    }
    if (<PullRequestBaseRepoAssigner>[] is M) {
      return data
          .map<PullRequestBaseRepoAssigner>(
              (e) => PullRequestBaseRepoAssigner.fromJson(e))
          .toList() as M;
    }
    if (<PullRequestLinks>[] is M) {
      return data
          .map<PullRequestLinks>((e) => PullRequestLinks.fromJson(e))
          .toList() as M;
    }
    if (<PullRequestLinksSelf>[] is M) {
      return data
          .map<PullRequestLinksSelf>((e) => PullRequestLinksSelf.fromJson(e))
          .toList() as M;
    }
    if (<PullRequestLinksHtml>[] is M) {
      return data
          .map<PullRequestLinksHtml>((e) => PullRequestLinksHtml.fromJson(e))
          .toList() as M;
    }
    if (<PullRequestLinksIssue>[] is M) {
      return data
          .map<PullRequestLinksIssue>((e) => PullRequestLinksIssue.fromJson(e))
          .toList() as M;
    }
    if (<PullRequestLinksComments>[] is M) {
      return data
          .map<PullRequestLinksComments>(
              (e) => PullRequestLinksComments.fromJson(e))
          .toList() as M;
    }
    if (<PullRequestLinksReviewComments>[] is M) {
      return data
          .map<PullRequestLinksReviewComments>(
              (e) => PullRequestLinksReviewComments.fromJson(e))
          .toList() as M;
    }
    if (<PullRequestLinksReviewComment>[] is M) {
      return data
          .map<PullRequestLinksReviewComment>(
              (e) => PullRequestLinksReviewComment.fromJson(e))
          .toList() as M;
    }
    if (<PullRequestLinksCommits>[] is M) {
      return data
          .map<PullRequestLinksCommits>(
              (e) => PullRequestLinksCommits.fromJson(e))
          .toList() as M;
    }
    if (<PullRequestUser>[] is M) {
      return data
          .map<PullRequestUser>((e) => PullRequestUser.fromJson(e))
          .toList() as M;
    }
    if (<RepoCommitEntity>[] is M) {
      return data
          .map<RepoCommitEntity>((e) => RepoCommitEntity.fromJson(e))
          .toList() as M;
    }
    if (<RepoCommitCommit>[] is M) {
      return data
          .map<RepoCommitCommit>((e) => RepoCommitCommit.fromJson(e))
          .toList() as M;
    }
    if (<RepoCommitCommitAuthor>[] is M) {
      return data
          .map<RepoCommitCommitAuthor>(
              (e) => RepoCommitCommitAuthor.fromJson(e))
          .toList() as M;
    }
    if (<RepoCommitCommitCommitter>[] is M) {
      return data
          .map<RepoCommitCommitCommitter>(
              (e) => RepoCommitCommitCommitter.fromJson(e))
          .toList() as M;
    }
    if (<RepoCommitCommitTree>[] is M) {
      return data
          .map<RepoCommitCommitTree>((e) => RepoCommitCommitTree.fromJson(e))
          .toList() as M;
    }
    if (<RepoCommitAuthor>[] is M) {
      return data
          .map<RepoCommitAuthor>((e) => RepoCommitAuthor.fromJson(e))
          .toList() as M;
    }
    if (<RepoCommitCommitter>[] is M) {
      return data
          .map<RepoCommitCommitter>((e) => RepoCommitCommitter.fromJson(e))
          .toList() as M;
    }
    if (<RepoCommitParents>[] is M) {
      return data
          .map<RepoCommitParents>((e) => RepoCommitParents.fromJson(e))
          .toList() as M;
    }
    if (<RepoFileEntity>[] is M) {
      return data
          .map<RepoFileEntity>((e) => RepoFileEntity.fromJson(e))
          .toList() as M;
    }
    if (<ReadmeLinks>[] is M) {
      return data.map<ReadmeLinks>((e) => ReadmeLinks.fromJson(e)).toList()
          as M;
    }
    if (<RepositoryBlobEntity>[] is M) {
      return data
          .map<RepositoryBlobEntity>((e) => RepositoryBlobEntity.fromJson(e))
          .toList() as M;
    }
    if (<RepositoryEntity>[] is M) {
      return data
          .map<RepositoryEntity>((e) => RepositoryEntity.fromJson(e))
          .toList() as M;
    }
    if (<RepositoryNamespace>[] is M) {
      return data
          .map<RepositoryNamespace>((e) => RepositoryNamespace.fromJson(e))
          .toList() as M;
    }
    if (<RepositoryOwner>[] is M) {
      return data
          .map<RepositoryOwner>((e) => RepositoryOwner.fromJson(e))
          .toList() as M;
    }
    if (<RepositoryAssigner>[] is M) {
      return data
          .map<RepositoryAssigner>((e) => RepositoryAssigner.fromJson(e))
          .toList() as M;
    }
    if (<RepositoryPermission>[] is M) {
      return data
          .map<RepositoryPermission>((e) => RepositoryPermission.fromJson(e))
          .toList() as M;
    }
    if (<RepositoryAssignee>[] is M) {
      return data
          .map<RepositoryAssignee>((e) => RepositoryAssignee.fromJson(e))
          .toList() as M;
    }
    if (<RepositoryTesters>[] is M) {
      return data
          .map<RepositoryTesters>((e) => RepositoryTesters.fromJson(e))
          .toList() as M;
    }
    if (<RepositoryTreeEntity>[] is M) {
      return data
          .map<RepositoryTreeEntity>((e) => RepositoryTreeEntity.fromJson(e))
          .toList() as M;
    }
    if (<RepositoryTreeTree>[] is M) {
      return data
          .map<RepositoryTreeTree>((e) => RepositoryTreeTree.fromJson(e))
          .toList() as M;
    }
    if (<EventResultEntity>[] is M) {
      return data
          .map<EventResultEntity>((e) => EventResultEntity.fromJson(e))
          .toList() as M;
    }
    if (<EventResultActor>[] is M) {
      return data
          .map<EventResultActor>((e) => EventResultActor.fromJson(e))
          .toList() as M;
    }
    if (<EventResultRepo>[] is M) {
      return data
          .map<EventResultRepo>((e) => EventResultRepo.fromJson(e))
          .toList() as M;
    }
    if (<EventResultPayload>[] is M) {
      return data
          .map<EventResultPayload>((e) => EventResultPayload.fromJson(e))
          .toList() as M;
    }
    if (<EventResultPayloadComment>[] is M) {
      return data
          .map<EventResultPayloadComment>(
              (e) => EventResultPayloadComment.fromJson(e))
          .toList() as M;
    }
    if (<EventResultPayloadIssue>[] is M) {
      return data
          .map<EventResultPayloadIssue>(
              (e) => EventResultPayloadIssue.fromJson(e))
          .toList() as M;
    }
    if (<EventResultPayloadCommit>[] is M) {
      return data
          .map<EventResultPayloadCommit>(
              (e) => EventResultPayloadCommit.fromJson(e))
          .toList() as M;
    }
    if (<EventResultPayloadCommitAuthor>[] is M) {
      return data
          .map<EventResultPayloadCommitAuthor>(
              (e) => EventResultPayloadCommitAuthor.fromJson(e))
          .toList() as M;
    }
    if (<EventResultPayloadTarget>[] is M) {
      return data
          .map<EventResultPayloadTarget>(
              (e) => EventResultPayloadTarget.fromJson(e))
          .toList() as M;
    }
    if (<EventResultOrg>[] is M) {
      return data
          .map<EventResultOrg>((e) => EventResultOrg.fromJson(e))
          .toList() as M;
    }
    if (<FollowResultEntity>[] is M) {
      return data
          .map<FollowResultEntity>((e) => FollowResultEntity.fromJson(e))
          .toList() as M;
    }
    if (<LoginSuccessResultEntity>[] is M) {
      return data
          .map<LoginSuccessResultEntity>(
              (e) => LoginSuccessResultEntity.fromJson(e))
          .toList() as M;
    }
    if (<UserProfileEntity>[] is M) {
      return data
          .map<UserProfileEntity>((e) => UserProfileEntity.fromJson(e))
          .toList() as M;
    }

    print("${M.toString()} not found");

    return null;
  }

  static M? fromJsonAsT<M>(dynamic json) {
    if (json == null) {
      return null;
    }
    if (json is List) {
      return _getListChildType<M>(json);
    } else {
      return _fromJsonSingle<M>(json as Map<String, dynamic>);
    }
  }
}
