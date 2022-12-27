import 'package:flutter/material.dart';
import '../shared/animal.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Animal args = ModalRoute.of(context)!.settings.arguments as Animal;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.nama),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 30),
            child: Center(
              child: CircleAvatar(
                radius: 80,
                backgroundImage: NetworkImage('https://loremflickr.com/480/480/${args.kode}'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(args.nama, style: const TextStyle(
              fontSize: 35
            )),
          ),
          // Divider
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              child: Divider(),
            ),

            // List Keterangan
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: <Widget>[
                  ListTile(
                    subtitle: const Text('Jenis'),
                    title: Text(args.jenis.toUpperCase()),
                  ),
                  ListTile(
                    subtitle: const Text('Jumlah Kaki'),
                    title: Text(args.jumlahKaki.toString()),
                  )
                ],
              ),
            )
        ],
      )
    );
  }
}