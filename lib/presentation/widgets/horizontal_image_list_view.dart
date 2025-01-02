import 'package:flutter/material.dart';

// 수평 이미지 리스트 뷰 위젯 - 가로로 스크롤 가능한 이미지 리스트
class HorizontalImageListView extends StatelessWidget {
  final List<String> imageUrls;

  const HorizontalImageListView({super.key, required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(color: Colors.white.withOpacity(0.9)),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Image.network(imageUrls[index]),
          );
        },
      ),
    );
  }
}
