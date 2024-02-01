
class MessageModel{
  final String user;
  final DateTime dataTime;
  final String sms;
  final String? rasm;

  MessageModel({ required this.user, required this.dataTime, required this.sms,this.rasm});

  factory MessageModel.fromJson(Map<String,dynamic>map){
    return MessageModel(user:map['user'],dataTime: map['dataTime'], sms:map['sms'],rasm:map['rasm']);
  }
  Map<String,dynamic> toJson(){
    return{
      'user':user,
      'dataTime':dataTime,
      'sms':sms,
      'rasm':rasm
    };
  }
}