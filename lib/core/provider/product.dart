import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nexus_app/core/index.dart';

class ProductListNotifier extends StateNotifier<List<Product>> {
  ProductListNotifier() : super([]);

  void setProductList(List<Product> products) {
    state = products;
  }

  void setProductLike(int? id) {
    if (id != null) {
      state = [
        for (final product in state)
          if (product.id == id) product.copyWith(isLike: !product.isLike) else product,
      ];
    }
  }
}

final ProductListProvider = StateNotifierProvider<ProductListNotifier, List<Product>>((ref) => ProductListNotifier());
