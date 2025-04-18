import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gomdong/constants/colors.dart';
import 'package:gomdong/models/listing_item_model.dart';

class DetailPage extends StatelessWidget {
  final ListingItemModel itemListing;

  const DetailPage({
    Key? key,
    required this.itemListing
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("공동구매 상세보기"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              itemListing.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              itemListing.desc,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            Text(
              "마감일: ${itemListing.deadline}",
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: LinearProgressIndicator(
                    value: itemListing.currentParticipants / itemListing.maxParticipants,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Color.fromRGBO(164, 180, 101, 1),
                    ),
                    minHeight: 6,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '${itemListing.currentParticipants} / ${itemListing.maxParticipants} 명',
                  style: const TextStyle(fontSize: 12),
                )
              ],
            ),
            const Spacer(),
            Material(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                onTap: () {
                  // TODO: Handle join action
                },
                borderRadius: BorderRadius.circular(20),
                splashColor: AppColors.secondary,
                highlightColor: AppColors.secondary,
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Center(child: const Text("신청하기", style: TextStyle(color: Colors.white, fontSize: 16),))
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
