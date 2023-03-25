// ignore_for_file: empty_constructor_bodies, unused_import

// import 'dart:ffi';

class HomePage {
  String? name;
  String? image;
  int? meetings;
  int? updates;
  int? tasks;
  bool? isHost;
  Map<String, dynamic> upcoming = {
    'id': '',
    'title': '',
    'host': '',
    'participants': [],
    'date': DateTime.now(),
    'time': '',
    'duration': 0,
    'team_name': '',
    'previous_meeting': '',
    'join_url': '',
    'agenda_ids': [],
  };
  Map<String, dynamic> previous = {
    'id': '',
    'title': '',
    'host': '',
    'participants': [],
    'date': DateTime.now(),
    'time': '',
    'duration': 0,
    'team_name': '',
    'previous_meeting': '',
    'join_url': '',
    'agenda_ids': [],
  };
  // Map<String, dynamic>? upcoming;
  // Map<String, dynamic>? previous;

  HomePage({
    required this.name,
    required this.image,
    required this.meetings,
    required this.updates,
    required this.tasks,
    required this.isHost,
    required this.upcoming,
    required this.previous,
  });

  factory HomePage.fromMap(Map<String, dynamic> map) {
    return HomePage(
      name: map['name'],
      image: map['image'],
      meetings: map['meetings'],
      updates: map['updates'],
      tasks: map['tasks'],
      isHost: map['isHost'],
      upcoming: map['upcoming'],
      previous: map['previous'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "image": image,
      "meetings": meetings,
      "updates": updates,
      "tasks": tasks,
      "isHost": isHost,
      "upcoming": upcoming,
      "previous": previous,
    };
  }
}


//   Map<String, dynamic> data = {
//   'name': '',
//   'image': '',
//   'meetings': 0,
//   'updates': 0,
//   'tasks': 0,
//   'upcoming': [
//     {
      // 'id': '',
      // 'title': '',
      // 'host': '',
      // 'participants': [],
      // 'date': DateTime.now(),
      // 'time': '',
      // 'duration': 0,
      // 'team_name': '',
      // 'previous_meeting': '',
      // 'join_url': '',
      // 'agenda_ids': []
//     }
//   ],
//   'previous': [
//     {
//       'id': '',
//       'title': '',
//       'host': '',
//       'participants': [],
//       'date': DateTime.now(),
//       'time': '',
//       'duration': 0,
//       'team_name': '',
//       'previous_meeting': '',
//       'join_url': '',
//       'agenda_ids': []
//     }
//   ],
//   'isHost': false
// };