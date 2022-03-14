import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shodai_mama_pro/controllers/home_page_controller.dart';

import 'details_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
  final controller = Get.put(HomePageController());
  @override
  void initState() {
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        controller.pageNumber.value += 1;
        controller.fetchItems();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Items"),
      ),
      body: Obx(
        () => ListView.builder(
            controller: _scrollController,
            itemCount: controller.list.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Text(controller.list[index].id),
                  title: Text(controller.list[index].author),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailsPage(
                        item: controller.list[index],
                      ),
                    ));
                  },
                ),
              );
            }),
      ),
    );
  }
}
