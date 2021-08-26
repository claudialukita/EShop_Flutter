import 'package:eshop_flutter/core/providers/storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final cartServiceProvider =
    Provider((ref) => CartService(ref.read(storageProvider)));

class CartService {
  final FlutterSecureStorage _storageProvider;

  CartService(this._storageProvider);

  Future setShoeInCart(String listShoeInCart) async {
    await _storageProvider.write(key: 'shoeInCart', value: listShoeInCart);
  }

  Future removeShoeInCart(String listShoeInCart) async {
    // await _storageProvider.deleteAll();
    await _storageProvider.write(key: 'shoeInCart', value: listShoeInCart);
  }

  // Future setFavoritedMovie(var favoriteMovie) async {
  //   var addFavoriteMovie = favoriteMovie.toString();
  //   await _storageProvider.write(key: 'favoriteMovie', value: addFavoriteMovie);
  // }
  //
  // Future removeFavoritedMovie(var favoriteMovie) async {
  //   await _storageProvider.deleteAll();
  //   var addFavoriteMovie = favoriteMovie.toString();
  //   await _storageProvider.write(key: 'favoriteMovie', value: addFavoriteMovie);
  // }
  //
  // Future getAllFavoriteMovie() async {
  //   List<dynamic> allFavoriteMovie = [];
  //   Map<String, dynamic> temp = await _storageProvider.readAll();
  //   allFavoriteMovie = (json.decode(temp['favoriteMovie']) as List)
  //       .map((item) => item as dynamic)
  //       .toList();
  //   return allFavoriteMovie;
  // }

}
