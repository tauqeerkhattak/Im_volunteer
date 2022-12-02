class EventModel {
  String? adminImage;
  String? adminName;
  int? date;
  String? description;
  String? eventId;
  String? image;
  bool? openEvent;
  String? title;

  EventModel({
    this.adminImage,
    this.adminName,
    this.date,
    this.description,
    this.eventId,
    this.image,
    this.openEvent,
    this.title,
  });

  EventModel.fromJson(Map<String, dynamic> json) {
    adminImage = json['adminImage'];
    adminName = json['adminName'];
    date = json['date'];
    description = json['description'];
    eventId = json['eventId'];
    image = json['image'];
    openEvent = json['openEvent'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['adminImage'] = adminImage;
    data['adminName'] = adminName;
    data['date'] = date;
    data['description'] = description;
    data['eventId'] = eventId;
    data['image'] = image;
    data['openEvent'] = openEvent;
    data['title'] = title;
    return data;
  }
}
