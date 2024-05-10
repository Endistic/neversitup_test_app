import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:neversitup_app/common/common_popup.dart';
import 'package:neversitup_app/common/image_url.dart';
import 'package:neversitup_app/provider/home_provider.dart';
import 'package:neversitup_app/provider/service/department_service.dart';

class HomeScreen extends ConsumerWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      const HomeScreen();
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carousel = ref.watch(streamRepositoryProvider);

    final selectedDepartmentId =
        ref.watch(selectedDepartmentId_provider.notifier).state;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Department Item",
            style: TextStyle(
                fontFamily: "Prompt",
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue[100],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 10,
        ),
        body: RefreshIndicator(
          onRefresh: () async =>
              ref.refresh(streamRepositoryProvider.future).then((value) {
            ref
                .refresh(selectedDepartmentId_provider.notifier)
                .update((state) => state = "");
          }),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Department Carousel",
                  style: TextStyle(
                      fontSize: 14,
                      fontFamily: "Prompt",
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              Container(
                // decoration: BoxDecoration(
                //     border: Border.all(width: 2, color: Colors.black)),
                child: carousel.when(
                  skipLoadingOnRefresh: false,
                  skipLoadingOnReload: true,
                  data: (data) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: data.length,
                          shrinkWrap: true,
                          itemExtent: 200,
                          itemBuilder: (context, index) {
                            return SizedBox(
                              child: Stack(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      // ref.invalidate(selectedDepartmentId_provider);
                                      ref
                                          .refresh(selectedDepartmentId_provider
                                              .notifier)
                                          .state = data[index].id;

                                      // ref.refresh(futureRepositoryProvider(
                                      //         selectedDepartmentId)
                                      //     .future);

                                      // ref
                                      //     .read(
                                      //         selectedDepartmentId_provider
                                      //             .notifier)
                                      //     .update((_) => data[index].id);

                                      print("OnTap ${data[index].id}");
                                    },
                                    child: Card(
                                      elevation: 3,
                                      color: Colors.green,
                                      child: Image.network(
                                        data[index].imageUrl,
                                        fit: BoxFit.cover,
                                      ),
                                      // ImageUrlCarouselCustom(
                                      //     urlImage: data[index].imageUrl,
                                      //     index: index),
                                      // child: Center(
                                      //   child: Text(
                                      //     data[index].name,
                                      //     style: TextStyle(
                                      //         fontSize: 14,
                                      //         fontFamily: "Prompt",
                                      //         fontWeight: FontWeight.bold,
                                      //         color: Colors.white),
                                      //   ),
                                      // ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 10,
                                    right: 15,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.green[100],
                                      ),
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        data[index].name,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: "Prompt",
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                  error: (error, stackTrace) {
                    return Container(
                      child: Center(
                        child: Text('Error'),
                      ),
                    );
                  },
                  loading: () => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    "Product List: ${selectedDepartmentId}",
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Prompt",
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
              ),
              Container(
                  // decoration: BoxDecoration(
                  //     border: Border.all(width: 2, color: Colors.black)),

                  child: ref
                      .watch(futureRepositoryProvider(selectedDepartmentId))
                      .when(
                          skipLoadingOnReload: true,
                          skipLoadingOnRefresh: false,
                          skipError: true,
                          data: (data) {
                            print("Data ${data}");
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                // height: 200,
                                child: GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  // scrollDirection: Axis.vertical,
                                  itemCount: data.length,
                                  shrinkWrap: true,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10.0,
                                    mainAxisSpacing: 10.0,
                                    // childAspectRatio: 0.65,
                                  ),
                                  cacheExtent: 200,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        ShowPopUpCommonDialog().showAlertDialog(
                                          context,
                                          data[index].desc,
                                        );
                                      },
                                      child: Card(
                                        elevation: 3,
                                        color: Colors.green,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: Container(
                                                height: 75,
                                                child: ImageUrlCarouselCustom(
                                                    urlImage:
                                                        data[index].imageUrl,
                                                    index: index),
                                              ),
                                            ),
                                            Divider(
                                              color: Colors.black,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      'Name : ${data[index].name}',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: "Prompt",
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.black)),
                                                  Text(
                                                      'Desc : ${data[index].desc}',
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: "Prompt",
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.black)),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                      'Prices : ${data[index].price}',
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: "Prompt",
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: Colors.black)),
                                                  SizedBox(),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        // child: Center(
                                        //   child: Text(
                                        //     data[index].name,
                                        //     style: TextStyle(
                                        //         fontSize: 14,
                                        //         fontFamily: "Prompt",
                                        //         fontWeight: FontWeight.bold,
                                        //         color: Colors.white),
                                        //   ),
                                        // ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                          error: (error, stackTrace) {
                            return Container(
                              child: Center(
                                child: Text('Error'),
                              ),
                            );
                          },
                          loading: () => const Center(
                                child: CircularProgressIndicator(),
                              ))),
            ],
          ),
        ),
      ),
    );
  }
}
