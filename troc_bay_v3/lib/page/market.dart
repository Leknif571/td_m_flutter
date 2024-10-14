import 'package:flutter/material.dart';
import 'package:troc_bay_v3/crud/trocCrud/addtroc.dart';
import '../crud/trocCrud/allTrocs.dart';

class Market extends StatefulWidget {
  const Market({Key? key}) : super(key: key);
  @override
  State<Market> createState() => _MarketState();
}

class _MarketState extends State<Market> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Votre compte'),
        backgroundColor: Colors.black,
        toolbarHeight: 63,
      ),
      body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover, image: AssetImage('images/bg.jpg'))),
          padding: const EdgeInsets.all(15.0),
          child: Center(
              child: FutureBuilder<List<dynamic>>(
            future: allTrocs.allTrocsf(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) => ListTile(
                          title: Text(snapshot.data![index]["label"]),
                          subtitle: Text(snapshot.data![index]["description"]),
                          contentPadding: EdgeInsets.only(bottom: 20.0),
                        ));
                // Text(snapshot.data!.email);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ))),
    );
  }
}
