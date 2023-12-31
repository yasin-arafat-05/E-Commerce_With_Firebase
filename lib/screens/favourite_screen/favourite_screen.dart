import 'package:eapp/provider/app_provider.dart';
import 'package:eapp/widgets/single_favourite_item/single_favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of(context);
    return Scaffold(
      //-----------------------------App Bar Style ---------------------------
      appBar: AppBar(
        elevation: 10,
        title: const Text(
          "Favourite Screen",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      //-----------------------------App Bar Style ---------------------------
      body: appProvider.getFavouriteIconList.isEmpty
          ? const Center(
              child: Text(
                "Favourite List is Empty.",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12.0),
              itemCount: appProvider.getFavouriteIconList.length,
              itemBuilder: (context, index) {
                return SingleFavouriteItem(
                  singleProduct: appProvider.getFavouriteIconList[index],
                );
              },
            ),
    );
  }
}
