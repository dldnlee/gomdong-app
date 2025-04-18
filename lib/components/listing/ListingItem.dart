import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gomdong/components/modals/GomdongModal.dart';
import 'package:gomdong/constants/colors.dart';
import 'package:gomdong/models/listing_item_model.dart';
import 'package:gomdong/pages/detail/DetailPage.dart';

class ListingItem extends StatelessWidget {
  final ListingItemModel listingItem;

  const ListingItem({
    super.key,
    required this.listingItem,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailPage(itemListing: listingItem)),
        );
      },
      child: Container(
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
                      Text(listingItem.title, style: TextStyle(fontWeight: FontWeight.bold), maxLines: 1),
                      SizedBox(height: 4),
                      Text("개수: ${listingItem.totalCount.toString()}"),
                      Text("가격: ${listingItem.totalPrice.toString()}원 (인당: ${(listingItem.totalPrice / listingItem.maxParticipants).toInt().toString()})"),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => GomdongModal(
                        header: "공동구매 신청",
                        content: "${listingItem.title}에 신청하시겠습니까?",
                        onCancel: () {
                          Navigator.of(context).pop();
                        },
                        onConfirm: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    );
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: LinearProgressIndicator(
                      value: listingItem.currentParticipants / listingItem.maxParticipants,
                      backgroundColor: Colors.grey.shade200,
                      color: AppColors.secondary,
                      minHeight: 6,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  ),
                  SizedBox(width: 20),
                  Text("${listingItem.currentParticipants}/${listingItem.maxParticipants}", style: TextStyle(fontSize: 12)),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}