class Launch {
  final String missionName;
  String? missionId;
  List<String>? payloadIds;  
  final String wikipedia;
  final String website;
  final String description;

  Launch({
    required this.missionName,
    required this.missionId,
    required this.payloadIds,
    required this.wikipedia,
    required this.website,
    required this.description,
  });

  factory Launch.fromJson(Map<String, dynamic> json) {
    return Launch(
      missionName: json['mission_name'],
      missionId: json['mission_id'],
      payloadIds: (json['payload_ids'] as List<dynamic>).cast<String>(),  
      wikipedia: json['wikipedia'],
      website: json['website'],
      description: json['description'],
    );
  }

}