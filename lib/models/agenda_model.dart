class AgendaModel {
  String? sId;
  String? title;
  String? description;
  String? meetingId;
  int? agendaNum;
  String? summary;

  AgendaModel(
      {this.sId,
      this.title,
      this.description,
      this.meetingId,
      this.agendaNum,
      this.summary});

  AgendaModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    meetingId = json['meeting_id'];
    agendaNum = json['agenda_num'];
    summary = json['summary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['meeting_id'] = this.meetingId;
    data['agenda_num'] = this.agendaNum;
    data['summary'] = this.summary;
    return data;
  }
}