class Diary {
  int date;
  String title;
  String memo;
  String? image;
  int? status;

  Diary(
      {required this.date,
      required this.title,
      required this.memo,
      this.image,
      this.status});
}
