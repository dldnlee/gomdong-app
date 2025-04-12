import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gomdong/constants/colors.dart';

class ListingItem extends StatelessWidget {
  final String title;
  final String description;
  final String timeLeft;
  final int maxParticipants;
  final int currentParticipants;

  const ListingItem({
    super.key,
    required this.title,
    required this.description,
    required this.timeLeft,
    required this.maxParticipants,
    required this.currentParticipants,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(width: 1, color: Colors.grey)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        Text(
                          timeLeft,
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(fontSize: 13, color: Colors.black87),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Material(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(10),
                      child: InkWell(
                        onTap: () {
                          print("Hello");
                        },
                        splashColor: AppColors.secondary,
                        highlightColor: AppColors.secondary,
                        borderRadius: BorderRadius.circular(10),
                        // borderRadius: BorderRadius.circular(8),
                        child: SizedBox(
                          height: 35,
                          width: double.infinity,
                          child: Center(
                            child: const Text(
                              '신청하기', style: TextStyle(color: Colors.white),

                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: LinearProgressIndicator(
                  value: currentParticipants / maxParticipants,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.secondary),
                  minHeight: 6,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '$currentParticipants/$maxParticipants',
                style: TextStyle(fontSize: 12),
              ),
            ],
          )
        ],
      ),
    );
  }
}