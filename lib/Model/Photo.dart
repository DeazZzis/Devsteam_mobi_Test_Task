class Photo {
  final String small;
  final String regular;
  final String description;
  final String altDescription;
  final String username;
  final int likes;
  final DateTime createdAt;

  Photo({this.small, this.regular, this.description, this.altDescription,
    this.username, this.likes, this.createdAt});

  Photo.fromJson(Map json)
      :
        small = json['urls']['small'],
        regular = json['urls']['regular'],
        description = json['description'],
        altDescription = json['alt_description'],
        username = json['user']['username'],
        likes = json['likes'],
        createdAt = DateTime.parse(json['created_at']);
}