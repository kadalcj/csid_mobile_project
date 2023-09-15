import 'package:csid_mobile_project/domain/repository/delivery_repository.dart';
import 'package:csid_mobile_project/page/stop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textController = TextEditingController();
  final DeliveryRepository _deliveryRepository = DeliveryRepository();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Delivery Number',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (_textController.text.isNotEmpty) {
                  await _deliveryRepository
                      .getSearchDelivery(
                        _textController.text,
                      )
                      .then(
                        (delivery) => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => StopPage(
                              delivery: delivery,
                            ),
                          ),
                        ),
                      );
                }
              },
              child: const Text('Search Delivery'),
            ),
          ],
        ),
      ),
    );
  }
}
