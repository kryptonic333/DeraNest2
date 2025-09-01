enum CallType { voice, video }

class Call {
  
  final String id;
  
  final String initiatorId;
  
  final List<String> participantIds;
  
  final CallType type;
 
  final DateTime startTime;
  
  final DateTime? endTime;
 
  final String status;
 
  final Duration? duration;
 
  final String? conversationId;

  Call({
    required this.id,
    required this.initiatorId,
    required this.participantIds,
    required this.type,
    required this.startTime,
    this.endTime,
    required this.status,
    this.duration,
    this.conversationId,
  });

  Call copyWith({
    String? id,
    String? initiatorId,
    List<String>? participantIds,
    CallType? type,
    DateTime? startTime,
    DateTime? endTime,
    String? status,
    Duration? duration,
    String? conversationId,
  }) {
    return Call(
      id: id ?? this.id,
      initiatorId: initiatorId ?? this.initiatorId,
      participantIds: participantIds ?? this.participantIds,
      type: type ?? this.type,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      status: status ?? this.status,
      duration: duration ?? this.duration,
      conversationId: conversationId ?? this.conversationId,
    );
  }

    Map<String, dynamic> toJson() {
    return {
      'id': id,
      'initiatorId': initiatorId,
      'participantIds': participantIds,
      'type': type.toString().split('.').last, 
      'startTime': startTime.toIso8601String(),
      'endTime': endTime?.toIso8601String(),
      'status': status,
      'duration': duration?.inSeconds, 
      'conversationId': conversationId,
    };
  }

}