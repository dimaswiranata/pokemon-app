import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nexus_app/core/index.dart';
import 'package:nexus_app/widget/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Forecast> _forecast = [];
  ForecastLocation? _location;
  CurrentForest? _current;
  late final SharedPreferences _prefs;
  final Dio _dio = Dio();
  bool _showErrorNetwork = false;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData({bool refresh = false}) async {
    if (refresh == false) {
      setState(() {
        _loading = true;
      });
      _prefs = await SharedPreferences.getInstance();
    }

    if (await _checkConnection() == false) {
      String location = _prefs.getString('location') ?? '';
      String forecast = _prefs.getString('forecast') ?? '';
      String current = _prefs.getString('current') ?? '';
      if (location.isEmpty) {
        setState(() {
          _showErrorNetwork = true;
          _loading = false;
        });
        return;
      } else {
        _setData(jsonDecode(forecast), jsonDecode(location), jsonDecode(current));
        return;
      }
    }

    Map<String, dynamic>? result =
        await ForecastRequest().getForecast(urlParams: {'key': 'ca3dfb5caee2420692f155935242005', 'q': 'Bandung', 'days': 7});
    if (!mounted) return;
    if (result != null) {
      _setData(result['forecast']['forecastday'], result['location'], result['current']);
    } else {
      setState(() {
        _showErrorNetwork = true;
        _loading = false;
      });
    }
  }

  void _setData(List<dynamic> forecast, Map<String, dynamic> location, Map<String, dynamic> current) {
    _prefs.setString('location', jsonEncode(location));
    _prefs.setString('forecast', jsonEncode(forecast));
    _prefs.setString('current', jsonEncode(current));
    setState(() {
      _location = ForecastLocation.fromJson(location);
      _current = CurrentForest.fromJson(current);
      _forecast.addAll(List<Forecast>.from(forecast.map((x) => Forecast.fromJson(x))));
      _loading = false;
    });
  }

  Future<bool> _checkConnection() async {
    try {
      final response = await _dio.get('https://www.google.com');
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Widget _buildWeek() {
    return AntiContainer(
      paddingHorizontal: space.reg,
      marginTop: space.xxl,
      children: [
        Text(
          '7 day forecast',
          style: bodyH3.copyWith(color: primaryWhite),
        ),
        SizedBox(height: space.reg),
        for (int i = 0; i < 7; i++) ...[
          DayItem(
            forecast: _forecast[i],
          )
        ],
      ],
    );
  }

  Widget _buildTime() {
    return AntiContainer(
      marginTop: space.xxl,
      height: 115,
      child: ListView.builder(
          padding: EdgeInsets.symmetric(horizontal: space.reg),
          scrollDirection: Axis.horizontal,
          itemCount: _forecast.isNotEmpty ? _forecast[0].hour?.length : 0,
          itemBuilder: (context, index) {
            return HourItem(
              index: index,
              hour: _forecast[0].hour ?? [],
            );
          }),
    );
  }

  Widget _buildCity() {
    return AntiContainer(
      paddingHorizontal: space.reg,
      width: double.infinity,
      mainAxisSize: MainAxisSize.min,
      crossAxis: CrossAxisAlignment.start,
      children: [
        Text(
          _location?.name ?? '',
          style: bodyH2.copyWith(fontWeight: FontWeight.w400, color: primaryWhite),
        ),
        SizedBox(
          height: space.sm,
        ),
        Text(
          _location?.region ?? '',
          style: bodyBody.copyWith(fontWeight: FontWeight.w300, color: primaryWhite),
        ),
        SizedBox(
          height: space.sm,
        ),
        Text(
          Format.dateTime(_current?.lastUpdated ?? '', EnumDateTime.dateTime2) ?? '',
          style: bodyBody.copyWith(fontWeight: FontWeight.w300, color: primaryWhite),
        ),
        AntiContainer(
          flexDir: FlexDirection.ROW,
          crossAxis: CrossAxisAlignment.center,
          mainAxis: MainAxisAlignment.spaceBetween,
          children: [
            AntiContainer(
              flexDir: FlexDirection.ROW,
              children: [
                Text(
                  _current?.tempC ?? '',
                  style: bodyH1.copyWith(color: primaryWhite, fontSize: 60),
                ),
                Text(
                  '°',
                  style: bodyH1.copyWith(color: primaryWhite, fontSize: 60),
                )
              ],
            ),
            AntiImage(imageUrl: 'https:${_current?.condition?.icon}', width: 140, height: 200),
          ],
        ),
        Text(
          _current?.condition?.text ?? '',
          style: bodyBody.copyWith(fontWeight: FontWeight.w300, color: primaryWhite),
        ),
        SizedBox(
          height: space.sm,
        ),
        Text(
          'Fells Like ${_current?.feelslikeC}°',
          style: bodyBody.copyWith(fontWeight: FontWeight.w300, color: primaryWhite),
        ),
      ],
    );
  }

  Widget _buildContent() {
    if (_loading == true) {
      return Center(
        child: AntiLoading(
          color: primaryWhite,
          height: 56,
          width: 56,
        ),
      );
    }
    if (_showErrorNetwork == true) {
      return AntiContainer(
        isScrollable: true,
        width: double.infinity,
        mainAxis: MainAxisAlignment.center,
        crossAxis: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: Common.getDinamicHeight(context) * 0.35,
          ),
          SvgPicture.asset('assets/svgs/ic_disconnected.svg', width: 150, height: 150),
          SizedBox(
            height: space.md,
          ),
          Text(
            'No internet connection',
            style: bodyH3.copyWith(color: primaryWhite),
          ),
          SizedBox(
            height: space.sm,
          ),
          Text(
            'Pull To Refresh',
            style: bodyH6.copyWith(color: primaryWhite, fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: Common.getDinamicHeight(context) * 0.7,
          ),
        ],
      );
    }
    return AntiContainer(
      isScrollable: true,
      children: [
        SizedBox(
          height: Common.getDinamicTopSize(context) + space.xxl,
        ),
        _buildCity(),
        _buildTime(),
        _buildWeek(),
        SizedBox(
          height: Common.getDinamicBottomSize(context) + space.reg,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundDark,
      body: RefreshIndicator(onRefresh: () => _getData(refresh: true), child: _buildContent()),
    );
  }
}
