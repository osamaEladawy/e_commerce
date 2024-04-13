import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/assetsImages.dart';

class CustomCardCart extends StatelessWidget {
  final String count;
  final String price;
  final String name;
  final String url;
  final void Function()? onAdd;
  final void Function()? onRemove;

  const CustomCardCart(
      {super.key,
      required this.count,
      required this.price,
      required this.name,
      required this.url,
      required this.onAdd,
     required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: CachedNetworkImage(
              imageUrl: '${AssetsImages.imageItems}/$url',
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          Expanded(
              flex: 3,
              child: ListTile(
                title: Text(
                  name,
                  overflow: TextOverflow.clip,
                ),
                subtitle: Text("$price \$"),
              )),
          Expanded(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  child: IconButton(
                    onPressed: onAdd,
                    icon: const Icon(
                      Icons.add,
                      size: 25,
                    ),
                    highlightColor: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  alignment: Alignment.center,
                  height: 20,
                  child: Text(
                    "$count",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                ),
                const SizedBox(height: 24),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  child: IconButton(
                    onPressed: onRemove,
                    icon: const Icon(
                      Icons.remove,
                      size: 25,
                    ),
                    highlightColor: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
