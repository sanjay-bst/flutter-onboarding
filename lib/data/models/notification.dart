class Notification {
  final DateTime date;
  final String title;
  final String imageUrl;

  Notification.fromJson(Map json)
      : date = json['timestamp'].toDate(),
        title = json['title'],
        imageUrl = json['image_url'];
}
