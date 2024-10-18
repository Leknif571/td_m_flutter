import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:tp5_tintin/logic_metier/add_favourite_album.dart';
import 'package:tp5_tintin/models/album_model.dart';
import 'package:tp5_tintin/page/album_detail.dart';
import 'package:tp5_tintin/providers/reading_list_provider.dart';

class PreviwAlbum extends StatefulWidget {
  final Album? album;

  const PreviwAlbum({
    this.album,
    super.key,
  });

  @override
  State<PreviwAlbum> createState() => _PreviwAlbumState();
}

class _PreviwAlbumState extends State<PreviwAlbum> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Image(image: AssetImage('images/${widget.album?.image}')),
        trailing:
            Consumer<ReadingListProvider>(builder: (context, value, child) {
          return Icon(
            value.listFavourite.contains(widget.album!.numero)
                ? Icons.favorite
                : Icons.heart_broken_outlined,
            color: const Color.fromARGB(255, 249, 0, 0),
          );
        }),
        title: Text(
          widget.album?.title ?? "got null",
          style: const TextStyle(color: Colors.white),
        ),
        tileColor: Colors.black87,
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AlbumDetail(album: widget.album!))));
  }
}
