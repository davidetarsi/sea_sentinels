import 'package:flutter/material.dart';
import 'package:sea_sentinels/providers/fish_list_provider.dart';
import 'package:sea_sentinels/view/widget/my_scaffold.dart';
import 'package:sea_sentinels/view/widget/grid_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




class CollectionScreen extends ConsumerWidget {
  // La tua lista di pesci

  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fishListAsync = ref.watch(getFishCollectionProvider);


    return MyScaffold(
      backButton: false,
      title: "My fish collection",
      body: fishListAsync.when(
        data: (fishList) {
          return GridView.count(
            crossAxisCount: 3, // Numero di elementi per riga
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            children: List.generate(fishList.length, (index) {
              return GridItem(item: fishList[index]);
            }),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text("Error: $error")),
      ),
    );
  }
}
