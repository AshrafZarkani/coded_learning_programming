

class Files {
  Files({
    required this.codeLanguage,
    required this.isInteractive,
    required this.content,
    required this.name,
  });
  late final String codeLanguage;
  late final bool isInteractive;
  late final String content;
  late final String name;

  Files.fromJson(Map<String, dynamic> json) {
    codeLanguage = json['codeLanguage'];
    isInteractive = json['isInteractive'];
    content = json['content'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['codeLanguage'] = codeLanguage;
    data['isInteractive'] = isInteractive;
    data['content'] = content;
    data['name'] = name;
    return data;
  }
}
