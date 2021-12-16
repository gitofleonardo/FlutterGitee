enum SortBy { created, lastPush }

enum SortDirection { asc, desc }

enum RepoType { all, owner, personal, member, public, private }

final languages = <String>[
  "Java",
  "JavaScript",
  "PHP",
  "Python",
  "C#",
  "Android",
  "Objective-C",
  "C++",
  "Go",
  "C",
  "HTML",
  "NodeJS",
  "TypeScript",
  "Swift",
  "Shell",
  "Ruby",
  "Dart",
  "CSS",
  "Lua",
  "Docker",
  "Scala",
  "Matlab",
  "Rust",
  "Delphi",
  "TeX/LaTeX",
  "Verilog",
  "Visual Basic",
  "R",
  "Erlang",
  "ASP",
  "Groovy",
  "ActionScript",
  "Arduino",
  "VimL",
  "Perl",
  "FORTRAN",
  "Pascal",
  "Assembly",
  "QML",
  "PowerShell",
  "Clojure",
  "Emacs Lisp",
  "Julia",
  "CoffeeScript",
  "AutoHotkey",
  "VHDL",
  "M",
  "Elixir",
  "Haskell",
  "D",
  "Scheme",
  "Racket",
  "Logos",
  "Vala",
  "Common Lisp",
  "XSLT",
  "Haxe",
  "OCaml",
  "DOT",
  "Coq",
  "Puppet",
  "LiveScript",
  "Prolog",
  "Smalltalk",
  "Nemerle",
  "eC",
  "Eiffel",
  "Ada",
  "Standard ML",
  "Scilab",
  "Awk",
  "Slash",
  "ColdFusion",
  "Wechat",
  "Crystal",
  "Kotlin",
  "SQL",
  "Lisp",
  "XML",
  "C/C++",
  "HTML/CSS",
  "易语言",
  "汇编",
  "other",
  "Pawn",
  "Zephir",
  "YAML"
];

enum IssueState { open, progressing, closed, rejected }

class IssueFilter {
  String? language;
  String? label;
  IssueState? state;
  IssueFilterSort? sort;
  SortDirection? order;

  IssueFilter();

  IssueFilter.from(IssueFilter filter) {
    language = filter.language;
    label = filter.label;
    state = filter.state;
    sort = filter.sort;
    order = filter.order;
  }

  @override
  bool operator ==(Object other) {
    if (other is IssueFilter) {
      return language == other.language &&
          label == other.label &&
          state == other.state &&
          sort == other.sort &&
          order == other.order;
    }
    return false;
  }
}

enum IssueFilterSort { createAt, updatedAt, notesCount }

class RepositoryFilter {
  bool? fork;
  String? language;
  RepositoryFilterSort? sort;
  SortDirection? order;

  RepositoryFilter();

  RepositoryFilter.from(RepositoryFilter repoFilter) {
    fork = repoFilter.fork;
    language = repoFilter.language;
    sort = repoFilter.sort;
    order = repoFilter.order;
  }

  @override
  bool operator ==(Object other) {
    if (other is RepositoryFilter) {
      return fork == other.fork &&
          language == other.language &&
          sort == other.sort &&
          order == other.order;
    }
    return false;
  }
}

enum RepositoryFilterSort { lastPushAt, starsCount, forksCount, watchesCount }

enum UserFilterSort { joinedAt }

class UserFilter {
  UserFilterSort? sort;
  SortDirection? order;

  UserFilter();

  UserFilter.from(UserFilter filter) {
    sort = filter.sort;
    order = filter.order;
  }

  @override
  bool operator ==(Object other) {
    if (other is UserFilter) {
      return sort == other.sort && order == other.order;
    }
    return false;
  }
}
