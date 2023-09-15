import 'dart:convert';

import 'package:http/http.dart';

import 'package:csid_mobile_project/config.dart';
import 'package:csid_mobile_project/domain/model/delivery_model.dart';

class DeliveryRepository {
  String endpoint = '$baseUrl/delivery';

  Future<Delivery> getSearchDelivery(String deliveryName) async {
    Response response = await get(Uri.parse('$endpoint/$deliveryName'));

    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      var parsedJson = Delivery.fromJson(result['delivery']);

      return parsedJson;
    }

    return Delivery();
  }
}
