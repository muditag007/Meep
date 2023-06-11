class HomePage {
  int? meetings;
  int? tasks;
  int? updates;
  String? image;
  String? name;
  bool? isHost;
  List<Upcoming>? upcoming;
  List<Upcoming>? previous;

  HomePage(
      {this.meetings,
      this.tasks,
      this.updates,
      this.image,
      this.name,
      this.isHost,
      this.upcoming,
      this.previous});

  HomePage.fromJson(Map<String, dynamic> json) {
    meetings = json['meetings'];
    tasks = json['tasks'];
    updates = json['updates'];
    image = json['image'];
    name = json['name'];
    isHost = json['isHost'];
    if (json['upcoming'] != null) {
      upcoming = <Upcoming>[];
      json['upcoming'].forEach((v) {
        upcoming!.add(new Upcoming.fromJson(v));
      });
    }
    if (json['previous'] != null) {
      previous = <Upcoming>[];
      json['previous'].forEach((v) {
        previous!.add(new Upcoming.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['meetings'] = this.meetings;
    data['tasks'] = this.tasks;
    data['updates'] = this.updates;
    data['image'] = this.image;
    data['name'] = this.name;
    data['isHost'] = this.isHost;
    if (this.upcoming != null) {
      data['upcoming'] = this.upcoming!.map((v) => v.toJson()).toList();
    }
    if (this.previous != null) {
      data['previous'] = this.previous!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Upcoming {
  String? sId;
  String? title;
  String? host;
  List<String>? participants;
  String? venue;
  String? date;
  String? time;
  int? duration;
  String? teamName;
  String? previousMeeting;
  int? iV;

  Upcoming(
      {this.sId,
      this.title,
      this.host,
      this.participants,
      this.venue,
      this.date,
      this.time,
      this.duration,
      this.teamName,
      this.previousMeeting,
      this.iV});

  Upcoming.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    host = json['host'];
    participants = json['participants'].cast<String>();
    venue = json['venue'];
    date = json['date'];
    time = json['time'];
    duration = json['duration'];
    teamName = json['team_name'];
    previousMeeting = json['previous_meeting'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['host'] = this.host;
    data['participants'] = this.participants;
    data['venue'] = this.venue;
    data['date'] = this.date;
    data['time'] = this.time;
    data['duration'] = this.duration;
    data['team_name'] = this.teamName;
    data['previous_meeting'] = this.previousMeeting;
    data['__v'] = this.iV;
    return data;
  }
}