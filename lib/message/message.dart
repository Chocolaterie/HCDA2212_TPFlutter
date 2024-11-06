class Message {

  int id;
  String profile;
  int created_at;
  String author;
  String message;

  Message(this.id, this.profile, this.created_at, this.author, this.message);

  static Message fromJson(Map<String, dynamic> json) {
    return Message(json['id'], json['profile'], json['created_date'], json['author'], json['message']);
  }

  String formatDuration() {
    // Convert timestamp to DateTime
    DateTime dateTime =
    DateTime.fromMillisecondsSinceEpoch(created_at * 1000);

    // Diff from now and tweet created date
    Duration difference = DateTime.now().difference(dateTime);

    // Should'nt have negative timestamp
    if (difference.isNegative) {
      return '';
    }

    // Format displayed date
    if (difference.inDays > 0) {
      return '${difference.inDays}d';
    }
    if (difference.inHours > 0) {
      return '${difference.inHours}h';
    }
    if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m';
    }
    return '${difference.inSeconds}s';
  }

}