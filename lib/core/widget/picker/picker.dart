import 'package:flutter/material.dart';

import 'package:nexus_app/core/index.dart';

class AntiPicker extends StatelessWidget {
  const AntiPicker({
    Key? key,
    this.title,
    this.data,
    this.onSelect,
  }) : super(key: key);
  final String? title;
  final List<ItemPicker>? data;
  final void Function(ItemPicker)? onSelect;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(bottom: 32),
      decoration: BoxDecoration(
        color: primaryWhite,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 55, bottom: 0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: data == null
                    ? []
                    : data!.map((item) {
                        return Container(
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey,
                                width: 0.3,
                              ),
                            ),
                          ),
                          child: ListTile(
                            enableFeedback: true,
                            title: Text(item.title ?? '', style: bodyBody.copyWith(fontWeight: FontWeight.w300)),
                            onTap: () {
                              Navigator.of(context).pop();
                              onSelect!(item);
                            },
                          ),
                        );
                      }).toList(),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            padding: EdgeInsets.all(16),
            width: width,
            child: Text(
              title ?? 'Select Ones',
              style: bodyH4.copyWith(color: primaryGrey, fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }
}
