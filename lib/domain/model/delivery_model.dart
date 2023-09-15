import 'package:csid_mobile_project/domain/model/stop_model.dart';
import 'package:csid_mobile_project/domain/model/matrix_model.dart';

class Delivery {
  String? id;
  String? startTime;
  String? plannedStartTime;
  String? deliveryNumber;
  List<Stop>? stops;
  List<Matrix>? matrix;

  Delivery({
    this.id,
    this.startTime,
    this.plannedStartTime,
    this.deliveryNumber,
    this.stops,
    this.matrix,
  });

  factory Delivery.fromJson(Map<String, dynamic> json) {
    return Delivery(
      id: json['id'],
      startTime: json['startTime'],
      plannedStartTime: json['plannedStartTime'],
      deliveryNumber: json['deliveryNumber'],
      stops: ((json['stops'] ?? []) as List)
          .map(
            (e) => Stop.fromJson(e),
          )
          .toList(),
      matrix: ((json['matrix'] ?? []) as List)
          .map(
            (e) => Matrix.fromJson(e),
          )
          .toList(),
    );
  }
}
