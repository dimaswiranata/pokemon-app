import 'package:flutter/cupertino.dart';
import 'package:nexus_app/core/index.dart';

class HourItem extends StatelessWidget {
  const HourItem({super.key, this.index = 0, this.hour});
  final int index;
  final List<Hour>? hour;

  @override
  Widget build(BuildContext context) {
    return AntiContainer(
      bgColor: backgroundLite,
      width: 96,
      crossAxis: CrossAxisAlignment.center,
      mainAxis: MainAxisAlignment.spaceBetween,
      paddingVertical: space.sm,
      borderBottomLeftRadius: index == 0 ? radius.xl : radius.none,
      borderTopLeftRadius: index == 0 ? radius.xl : radius.none,
      borderBottomRightRadius: index == (hour?.length ?? 1) - 1 ? radius.xl : radius.none,
      borderTopRightRadius: index == (hour?.length ?? 1) - 1 ? radius.xl : radius.none,
      children: [
        Text(
          Format.dateTime(hour?[index].time ?? '', EnumDateTime.time2) ?? '',
          style: bodyCaption.copyWith(fontWeight: FontWeight.w300, color: primaryWhite),
        ),
        AntiImage(
          imageUrl: 'https:${hour?[index].condition?.icon}',
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        AntiContainer(
          crossAxis: CrossAxisAlignment.center,
          children: [
            AntiContainer(
              mainAxis: MainAxisAlignment.center,
              flexDir: FlexDirection.ROW,
              children: [
                Text(
                  hour?[index].tempC ?? '',
                  style: bodyBody.copyWith(fontWeight: FontWeight.w400, color: primaryWhite),
                ),
                Text(
                  '°',
                  style: bodyCaption.copyWith(fontWeight: FontWeight.w300, color: primaryWhite),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
