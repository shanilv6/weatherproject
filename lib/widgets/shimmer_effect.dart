import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Shimmer.fromColors(
          baseColor: Colors.white24,
          highlightColor: Colors.white60,
          child: Center(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 45,
                          height: 45,
                          color: Colors.purple,
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10)),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 8,
                                color: Colors.purple,
                              ),
                              const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 3)),
                              Container(
                                width: double.infinity,
                                height: 8,
                                color: Colors.purple,
                              ),
                              const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 3)),
                              Container(
                                width: size.width * 0.25,
                                height: 8,
                                color: Colors.purple,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          )),
    );
  }
}
