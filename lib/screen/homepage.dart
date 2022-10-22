import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx_api_integration/controller/product_controller.dart';
import 'package:shopx_api_integration/screen/product_tile.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'ShopX',
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'avenir',
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.view_list_rounded),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.grid_view),
                  ),
                ],
              ),
              Expanded(
                child: Obx(
                  () {
                    if(productController.isLoading.value){
                      return Center(child: CircularProgressIndicator());
                    }
                    return StaggeredGridView.countBuilder(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    itemCount: productController.productList.length,
                    itemBuilder: (context, index) {
                      return ProductTile(
                          product: productController.productList[index]);
                    },
                    staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
                  );
                  } 
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
