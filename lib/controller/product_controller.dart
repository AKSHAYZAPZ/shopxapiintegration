import 'package:get/get.dart';
import 'package:shopx_api_integration/model/product.dart';
import 'package:shopx_api_integration/services/remote_service.dart';

class ProductController extends GetxController{

  var productList = <Product>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }


 Future <void> fetchProducts()async{
  try{
      isLoading(true);
    var products = await RemoteServices.fetchProducts();
  if(products != null){
    productList.assignAll(products) ;
  }
  
  }finally{
    isLoading(false);
  }

  }
}