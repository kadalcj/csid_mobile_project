class Stop {
  String? id;
  int? number;
  String? name;
  String? address;
  int? stopIndex;
  String? stopStartTime;
  String? stopEndTime;
  int? unloadingTime;
  String? deliveryId;

  Stop({
    this.id,
    this.number,
    this.name,
    this.address,
    this.stopIndex,
    this.stopStartTime,
    this.stopEndTime,
    this.unloadingTime,
    this.deliveryId,
  });

  factory Stop.fromJson(Map<String, dynamic> json) {
    return Stop(
      id: json['id'],
      number: json['number'],
      name: json['name'],
      address: json['address'],
      stopIndex: json['stopIndex'],
      stopStartTime: json['stopStartTime'],
      stopEndTime: json['stopEndTime'],
      unloadingTime: json['unloadingTime'],
      deliveryId: json['deliveryId'],
    );
  }
}
