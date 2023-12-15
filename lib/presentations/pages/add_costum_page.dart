import 'package:flutter/material.dart';
import 'package:yorzkha_cos/logic/costum.dart';

class AddCostumPage extends StatefulWidget {
  const AddCostumPage({Key? key});

  @override
  _AddCostumPageState createState() => _AddCostumPageState();
}

class _AddCostumPageState extends State<AddCostumPage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController ukuranController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  final TextEditingController availabilityController = TextEditingController();
  String availability = 'Tersedia'; // Default value
  final List<String> availabilityOptions = ['Tersedia', 'Tidak Tersedia'];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Costum'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: namaController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: ukuranController,
              decoration: const InputDecoration(labelText: 'Size'),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: hargaController,
              keyboardType: TextInputType.number, // Keyboard untuk angka
              decoration: const InputDecoration(labelText: 'Price'),
            ),
            const SizedBox(height: 16),
            DropdownButton<String>(
              value: availability,
              onChanged: (String? newValue) {
                setState(() {
                  availability = newValue!;
                });
              },
              items: availabilityOptions.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Text(option),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Costum.create(
                  namaController,
                  ukuranController,
                  hargaController,
                  availability,
                  context,
                );
              },
              child: const Text('Add Costum'),
            ),
          ],
        ),
      ),
    );
  }
}
