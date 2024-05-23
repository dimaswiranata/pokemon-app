import 'package:flutter/cupertino.dart';
import 'package:nexus_app/core/index.dart';

class DayItem extends StatelessWidget {
  const DayItem({super.key, this.forecast});
  final Forecast? forecast;

  @override
  Widget build(BuildContext context) {
    return AntiContainer(
      bgColor: backgroundLite,
      flexDir: FlexDirection.ROW,
      mainAxis: MainAxisAlignment.spaceBetween,
      crossAxis: CrossAxisAlignment.center,
      padding: space.md,
      marginBottom: space.reg,
      borderRadius: radius.reg,
      children: [
        AntiContainer(
          children: [
            Text(
              '${Format.dateTime(forecast?.date ?? '', EnumDateTime.dateLong5)}',
              style: bodyBody.copyWith(color: primaryWhite),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              'Max temp : ${forecast?.day?.maxtempC ?? ''}°',
              style: bodyCaption.copyWith(color: primaryWhite, fontWeight: FontWeight.w300),
            ),
            Text(
              'Min temp : ${forecast?.day?.mintempC ?? ''}°',
              style: bodyCaption.copyWith(color: primaryWhite, fontWeight: FontWeight.w300, height: 1.3),
            ),
          ],
        ),
        AntiImage(imageUrl: 'https:${forecast?.day?.condition?.icon}', width: 50, height: 50),
      ],
    );
  }
}
