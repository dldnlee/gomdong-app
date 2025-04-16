import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gomdong/models/list_item_model.dart';

class ListingItem extends StatelessWidget {
  final ListingItemModel listingItem;

  const ListingItem({
    super.key,
    required this.listingItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.image, color: Colors.white),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(listingItem.title, style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text(listingItem.totalCount.toString()),
                    Text(listingItem.totalPrice.toString()),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  // 신청하기 액션
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )
                ),
                child: Text("신청하기"),
              )
            ],
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  value: listingItem.currentParticipants / listingItem.maxParticipants,
                  backgroundColor: Colors.grey.shade200,
                  color: Colors.green.shade700,
                  minHeight: 6,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              SizedBox(width: 8),
              Text("$listingItem.currentParticipants/$listingItem.maxParticipants", style: TextStyle(fontSize: 12)),
            ],
          )
        ],
      ),
    );
  }
}