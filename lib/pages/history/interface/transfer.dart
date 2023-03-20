class Transfer {
  int receiverId, senderId;
  String senderName;
  String receiverName;
  num value;
  String role;

  Transfer(
      {required this.senderId,
      required this.receiverId,
      required this.value,
      required this.role,
      required this.senderName,
      required this.receiverName});

  factory Transfer.fromJson(Map<String, dynamic> json) {
    return Transfer(
      senderId: json['SenderId'] as int,
      receiverId: json['ReceiverId'] as int,
      senderName: json['SenderName'] as String,
      receiverName: json['ReceiverName'] as String,
      value: json['Value'] as num,
      role: json['UserIdRole'] as String,
    );
  }
}
