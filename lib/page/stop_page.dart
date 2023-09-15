import 'package:flutter/material.dart';

import 'package:csid_mobile_project/domain/model/delivery_model.dart';
import 'package:csid_mobile_project/domain/model/stop_model.dart';

class StopPage extends StatefulWidget {
  const StopPage({super.key, required this.delivery});

  final Delivery delivery;

  @override
  State<StopPage> createState() => _StopPageState();
}

class _StopPageState extends State<StopPage> {
  late Delivery searchedDelivery;

  @override
  void initState() {
    searchedDelivery = widget.delivery;
    super.initState();
  }

  void reorderItems(oldIndex, newIndex) {
    setState(() {
      if (newIndex > oldIndex) newIndex -= 1;

      final Stop stop = searchedDelivery.stops!.removeAt(oldIndex);
      searchedDelivery.stops!.insert(newIndex, stop);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(searchedDelivery.deliveryNumber.toString()),
                const SizedBox(
                  width: 20.0,
                ),
                Text(DateTime.parse(
                  searchedDelivery.plannedStartTime.toString(),
                ).toString())
              ]),
            ),
          ),
          Expanded(
            child: ReorderableListView(
              onReorder: reorderItems,
              children: searchedDelivery.stops!.map((Stop stop) {
                return ListTile(
                    key: Key(stop.name!),
                    title: Text(
                      stop.name!,
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      stop.address!,
                      style: const TextStyle(fontSize: 18.0),
                    ),
                    trailing: const Text('Time Window'),
                    tileColor:
                        stop.stopIndex!.isOdd ? Colors.grey : Colors.blueGrey);
              }).toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        child: const Text('Start Delivery / Submit Stop Order'),
      ),
    );
  }
}
