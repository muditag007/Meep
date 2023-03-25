// ignore_for_file: non_constant_identifier_names

class Previous{
  String? id;
  String? title;
  String? host;
  List? participants;
  DateTime? date;
  String? time;
  int? duration;
  String? team_name;
  String? previous_meeting;
  String? join_url;
  List? agenda_ids;
  
  Previous({
    this.agenda_ids,
    this.date,
    this.duration,
    this.host,
    this.id,
    this.join_url,
    this.participants,
    this.previous_meeting,
    this.team_name,
    this.time,
    this.title,
  });

  factory Previous.fromMap(Map<String, dynamic> map) {
    return Previous(
      agenda_ids: map['agenda_ids'],
      date: map['date'],
      duration: map['duration'],
      host: map['host'],
      id: map['id'],
      join_url: map['join_url'],
      participants: map['participants'],
      previous_meeting: map['previous_meeting'],
      team_name: map['team_name'],
      time: map['time'],
      title: map['title'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "agenda_ids":agenda_ids,
      "date":date,
      "duration":duration,
      "host":host,
      "id":id,
      "join_url":join_url,
      "participants":participants,
      "previous_meeting":previous_meeting,
      "team_name":team_name,
      "time":time,
      "title":title,
    };
  }
}