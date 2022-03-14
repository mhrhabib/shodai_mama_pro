import 'package:get/get.dart';
import 'package:shodai_mama_pro/services/api_service.dart';

import '../models/item.dart';

class HomePageController extends GetxController {
  final service = Get.put(ApiService());
  final list = <Item>[].obs;

  final pageNumber = 1.obs;
  Future fetchItems() async {
    final result = await service.fetchItems(pageNumber.value);
    list.addAll(result);
  }

  @override
  void onInit() async {
    await fetchItems();
    super.onInit();
  }
}
