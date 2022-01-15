import 'package:flutter/material.dart';
import 'package:flutter_gitee/generated/l10n.dart';
import 'package:flutter_gitee/repo/bean/repository_entity.dart';
import 'package:flutter_gitee/utils/global_utils.dart';

class RepoListItem extends StatelessWidget {
  final RepositoryEntity repo;
  final GestureTapCallback onTap;

  const RepoListItem({Key? key, required this.repo, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return InkWell(
        onTap: onTap,
        child: DecoratedBox(
          decoration: BoxDecoration(color: Theme.of(context).backgroundColor),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Text(
                      "${repo.name}",
                      style: TextStyle(
                          color: primary, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 5),
                    DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        child: Text(
                            repo.public ?? false
                                ? S.of(context).public
                                : S.of(context).private,
                            style: const TextStyle(
                                color: Colors.grey, fontSize: 10)),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 5),
                ConstrainedBox(
                  constraints: const BoxConstraints(minWidth: double.infinity),
                  child: Builder(
                    builder: (context) {
                      final desc = repo.description?.trim();
                      if (desc == null || desc.isEmpty) {
                        return const SizedBox(width: 0, height: 0);
                      }
                      return Text(
                        desc,
                        style: const TextStyle(color: Colors.grey),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Builder(builder: (context) {
                      return repo.stared ?? false
                          ? Icon(
                              Icons.star,
                              color: primary,
                              size: 18,
                            )
                          : Icon(
                              Icons.star_border,
                              color: primary,
                              size: 18,
                            );
                    }),
                    const SizedBox(width: 5),
                    Text(formatGitCount(repo.stargazersCount?.toInt())),
                    const SizedBox(width: 20),
                    Builder(builder: (context) {
                      return repo.language == null
                          ? const SizedBox(width: 0, height: 0)
                          : Flex(
                              direction: Axis.horizontal,
                              children: [
                                Icon(Icons.language, color: primary, size: 18),
                                const SizedBox(width: 5),
                                Text("${repo.language}")
                              ],
                            );
                    })
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
