import 'package:flutter_blueprint/app/modules/product/controller/product_controller.dart';
import 'package:get/get.dart';

class ProductBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
  }

}