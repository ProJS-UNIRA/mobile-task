import 'package:flutter/material.dart';

import '../shared/animal.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Animal> _list = [];

  @override
  void initState() {
    super.initState();

    setState(() {
      _list.add(Animal(id: 1, kode: 'dog', nama: 'Anjing', jenis: 'mamalia', jumlahKaki: 4));
      _list.add(Animal(id: 2, kode: 'cat', nama: 'Kucing', jenis: 'mamalia', jumlahKaki: 4));
      _list.add(Animal(id: 3, kode: 'lion', nama: 'Singa', jenis: 'mamalia', jumlahKaki: 4));
      _list.add(Animal(id: 4, kode: 'fish', nama: 'Ikan', jenis: 'ikan', jumlahKaki: 0));
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => {

        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Animal'),
      ),
      body: ListView.separated(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          var animal = _list[index];

          return GestureDetector(
            onTap: () => {
              Navigator.pushNamed(context, '/detail', arguments: animal)
            },
            child: ListTile(
              leading: CircleAvatar(backgroundColor: Colors.red,
              backgroundImage: NetworkImage('https://loremflickr.com/480/480/${animal.kode}'),),
              title: Text(animal.nama),
              subtitle: Text('Jenis: ${animal.jenis}'),
              trailing: Text('${animal.jumlahKaki}'),
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      )
    );
  }
}