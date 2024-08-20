class MemeModel {
  MemeModel({
    required this.postLink,
    required this.subreddit,
    required this.title,
    required this.url,
    required this.nsfw,
    required this.spoiler,
    required this.author,
    required this.ups,
    required this.preview,
  });
  late final String postLink;
  late final String subreddit;
  late final String title;
  late final String url;
  late final bool nsfw;
  late final bool spoiler;
  late final String author;
  late final int ups;
  late final List<String> preview;
  
  MemeModel.fromJson(Map<String, dynamic> json){
    postLink = json['postLink'];
    subreddit = json['subreddit'];
    title = json['title'];
    url = json['url'];
    nsfw = json['nsfw'];
    spoiler = json['spoiler'];
    author = json['author'];
    ups = json['ups'];
    preview = List.castFrom<dynamic, String>(json['preview']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['postLink'] = postLink;
    _data['subreddit'] = subreddit;
    _data['title'] = title;
    _data['url'] = url;
    _data['nsfw'] = nsfw;
    _data['spoiler'] = spoiler;
    _data['author'] = author;
    _data['ups'] = ups;
    _data['preview'] = preview;
    return _data;
  }
}