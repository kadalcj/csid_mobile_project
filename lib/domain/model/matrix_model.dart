class Matrix {
  String? id;
  String? fromStop;
  String? toStop;
  int? length;
  int? duration;
  String? deliveryId;

  Matrix({
    this.id,
    this.fromStop,
    this.toStop,
    this.length,
    this.duration,
    this.deliveryId,
  });

  factory Matrix.fromJson(Map<String, dynamic> json) {
    return Matrix(
      id: json['id'],
      fromStop: json['fromStop'],
      toStop: json['toStop'],
      length: json['length'],
      duration: json['duration'],
      deliveryId: json['deliveryId'],
    );
  }
}
