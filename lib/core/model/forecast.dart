// ignore_for_file: unnecessary_this, prefer_collection_literals

class ForecastLocation {
  String? name, region, country, lat, lon, tz_id, localtime_epoch, localtime;

  ForecastLocation({this.name, this.region, this.country, this.lat, this.lon, this.tz_id, this.localtime_epoch, this.localtime});

  factory ForecastLocation.fromJson(Map<String, dynamic> json) {
    return ForecastLocation(
        name: json['name'].toString(),
        region: json['region'].toString(),
        country: json['country'].toString(),
        lat: json['lat'].toString(),
        lon: json['lon'].toString(),
        tz_id: json['tz_id'].toString(),
        localtime_epoch: json['localtime_epoch'].toString(),
        localtime: json['localtime'].toString());
  }

  ForecastLocation copyWith(
      {String? name,
      String? region,
      String? country,
      String? lat,
      String? lon,
      String? tz_id,
      String? localtime_epoch,
      String? localtime}) {
    return ForecastLocation(
      name: name ?? this.name,
      region: region ?? this.region,
      country: country ?? this.country,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      tz_id: tz_id ?? this.tz_id,
      localtime_epoch: localtime_epoch ?? this.localtime_epoch,
      localtime: localtime ?? this.localtime,
    );
  }
}

class CurrentForest {
  String? lastUpdatedEpoch;
  String? lastUpdated;
  String? tempC;
  String? tempF;
  String? isDay;
  Condition? condition;
  String? windMph;
  String? windKph;
  String? windDegree;
  String? windDir;
  String? pressureMb;
  String? pressureIn;
  String? precipMm;
  String? precipIn;
  String? humidity;
  String? cloud;
  String? feelslikeC;
  String? feelslikeF;
  String? visKm;
  String? visMiles;
  String? uv;
  String? gustMph;
  String? gustKph;

  CurrentForest(
      {this.lastUpdatedEpoch,
      this.lastUpdated,
      this.tempC,
      this.tempF,
      this.isDay,
      this.condition,
      this.windMph,
      this.windKph,
      this.windDegree,
      this.windDir,
      this.pressureMb,
      this.pressureIn,
      this.precipMm,
      this.precipIn,
      this.humidity,
      this.cloud,
      this.feelslikeC,
      this.feelslikeF,
      this.visKm,
      this.visMiles,
      this.uv,
      this.gustMph,
      this.gustKph});

  CurrentForest.fromJson(Map<String, dynamic> json) {
    lastUpdatedEpoch = json['last_updated_epoch'].toString();
    lastUpdated = json['last_updated'].toString();
    tempC = json['temp_c'].toString();
    tempF = json['temp_f'].toString();
    isDay = json['is_day'].toString();
    condition = json['condition'] != null ? Condition.fromJson(json['condition']) : null;
    windMph = json['wind_mph'].toString();
    windKph = json['wind_kph'].toString();
    windDegree = json['wind_degree'].toString();
    windDir = json['wind_dir'].toString();
    pressureMb = json['pressure_mb'].toString();
    pressureIn = json['pressure_in'].toString();
    precipMm = json['precip_mm'].toString();
    precipIn = json['precip_in'].toString();
    humidity = json['humidity'].toString();
    cloud = json['cloud'].toString();
    feelslikeC = json['feelslike_c'].toString();
    feelslikeF = json['feelslike_f'].toString();
    visKm = json['vis_km'].toString();
    visMiles = json['vis_miles'].toString();
    uv = json['uv'].toString();
    gustMph = json['gust_mph'].toString();
    gustKph = json['gust_kph'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['last_updated_epoch'] = this.lastUpdatedEpoch;
    data['last_updated'] = this.lastUpdated;
    data['temp_c'] = this.tempC;
    data['temp_f'] = this.tempF;
    data['is_day'] = this.isDay;
    if (this.condition != null) {
      data['condition'] = this.condition!.toJson();
    }
    data['wind_mph'] = this.windMph;
    data['wind_kph'] = this.windKph;
    data['wind_degree'] = this.windDegree;
    data['wind_dir'] = this.windDir;
    data['pressure_mb'] = this.pressureMb;
    data['pressure_in'] = this.pressureIn;
    data['precip_mm'] = this.precipMm;
    data['precip_in'] = this.precipIn;
    data['humidity'] = this.humidity;
    data['cloud'] = this.cloud;
    data['feelslike_c'] = this.feelslikeC;
    data['feelslike_f'] = this.feelslikeF;
    data['vis_km'] = this.visKm;
    data['vis_miles'] = this.visMiles;
    data['uv'] = this.uv;
    data['gust_mph'] = this.gustMph;
    data['gust_kph'] = this.gustKph;
    return data;
  }
}

class Forecast {
  String? date;
  String? dateEpoch;
  Day? day;
  Astro? astro;
  List<Hour>? hour;

  Forecast({this.date, this.dateEpoch, this.day, this.astro, this.hour});

  Forecast.fromJson(Map<String, dynamic> json) {
    date = json['date'].toString();
    dateEpoch = json['date_epoch'].toString();
    day = json['day'] != null ? Day.fromJson(json['day']) : null;
    astro = json['astro'] != null ? Astro.fromJson(json['astro']) : null;
    if (json['hour'] != null) {
      hour = <Hour>[];
      json['hour'].forEach((v) {
        hour!.add(Hour.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['date'] = this.date;
    data['date_epoch'] = this.dateEpoch;
    if (this.day != null) {
      data['day'] = this.day!.toJson();
    }
    if (this.astro != null) {
      data['astro'] = this.astro!.toJson();
    }
    if (this.hour != null) {
      data['hour'] = this.hour!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Day {
  String? maxtempC;
  String? maxtempF;
  String? mintempC;
  String? mintempF;
  String? avgtempC;
  String? avgtempF;
  String? maxwindMph;
  String? maxwindKph;
  String? totalprecipMm;
  String? totalprecipIn;
  String? totalsnowCm;
  String? avgvisKm;
  String? avgvisMiles;
  String? avghumidity;
  String? dailyWillItRain;
  String? dailyChanceOfRain;
  String? dailyWillItSnow;
  String? dailyChanceOfSnow;
  Condition? condition;
  String? uv;

  Day(
      {this.maxtempC,
      this.maxtempF,
      this.mintempC,
      this.mintempF,
      this.avgtempC,
      this.avgtempF,
      this.maxwindMph,
      this.maxwindKph,
      this.totalprecipMm,
      this.totalprecipIn,
      this.totalsnowCm,
      this.avgvisKm,
      this.avgvisMiles,
      this.avghumidity,
      this.dailyWillItRain,
      this.dailyChanceOfRain,
      this.dailyWillItSnow,
      this.dailyChanceOfSnow,
      this.condition,
      this.uv});

  Day.fromJson(Map<String, dynamic> json) {
    maxtempC = json['maxtemp_c'].toString();
    maxtempF = json['maxtemp_f'].toString();
    mintempC = json['mintemp_c'].toString();
    mintempF = json['mintemp_f'].toString();
    avgtempC = json['avgtemp_c'].toString();
    avgtempF = json['avgtemp_f'].toString();
    maxwindMph = json['maxwind_mph'].toString();
    maxwindKph = json['maxwind_kph'].toString();
    totalprecipMm = json['totalprecip_mm'].toString();
    totalprecipIn = json['totalprecip_in'].toString();
    totalsnowCm = json['totalsnow_cm'].toString();
    avgvisKm = json['avgvis_km'].toString();
    avgvisMiles = json['avgvis_miles'].toString();
    avghumidity = json['avghumidity'].toString();
    dailyWillItRain = json['daily_will_it_rain'].toString();
    dailyChanceOfRain = json['daily_chance_of_rain'].toString();
    dailyWillItSnow = json['daily_will_it_snow'].toString();
    dailyChanceOfSnow = json['daily_chance_of_snow'].toString();
    condition = json['condition'] != null ? Condition.fromJson(json['condition']) : null;
    uv = json['uv'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['maxtemp_c'] = this.maxtempC;
    data['maxtemp_f'] = this.maxtempF;
    data['mintemp_c'] = this.mintempC;
    data['mintemp_f'] = this.mintempF;
    data['avgtemp_c'] = this.avgtempC;
    data['avgtemp_f'] = this.avgtempF;
    data['maxwind_mph'] = this.maxwindMph;
    data['maxwind_kph'] = this.maxwindKph;
    data['totalprecip_mm'] = this.totalprecipMm;
    data['totalprecip_in'] = this.totalprecipIn;
    data['totalsnow_cm'] = this.totalsnowCm;
    data['avgvis_km'] = this.avgvisKm;
    data['avgvis_miles'] = this.avgvisMiles;
    data['avghumidity'] = this.avghumidity;
    data['daily_will_it_rain'] = this.dailyWillItRain;
    data['daily_chance_of_rain'] = this.dailyChanceOfRain;
    data['daily_will_it_snow'] = this.dailyWillItSnow;
    data['daily_chance_of_snow'] = this.dailyChanceOfSnow;
    if (this.condition != null) {
      data['condition'] = this.condition!.toJson();
    }
    data['uv'] = this.uv;
    return data;
  }
}

class Condition {
  String? text;
  String? icon;
  String? code;

  Condition({this.text, this.icon, this.code});

  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'].toString();
    icon = json['icon'].toString();
    code = json['code'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['text'] = this.text;
    data['icon'] = this.icon;
    data['code'] = this.code;
    return data;
  }
}

class Astro {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  String? moonIllumination;
  String? isMoonUp;
  String? isSunUp;

  Astro({this.sunrise, this.sunset, this.moonrise, this.moonset, this.moonPhase, this.moonIllumination, this.isMoonUp, this.isSunUp});

  Astro.fromJson(Map<String, dynamic> json) {
    sunrise = json['sunrise'].toString();
    sunset = json['sunset'].toString();
    moonrise = json['moonrise'].toString();
    moonset = json['moonset'].toString();
    moonPhase = json['moon_phase'].toString();
    moonIllumination = json['moon_illumination'].toString();
    isMoonUp = json['is_moon_up'].toString();
    isSunUp = json['is_sun_up'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['sunrise'] = this.sunrise;
    data['sunset'] = this.sunset;
    data['moonrise'] = this.moonrise;
    data['moonset'] = this.moonset;
    data['moon_phase'] = this.moonPhase;
    data['moon_illumination'] = this.moonIllumination;
    data['is_moon_up'] = this.isMoonUp;
    data['is_sun_up'] = this.isSunUp;
    return data;
  }
}

class Hour {
  String? timeEpoch;
  String? time;
  String? tempC;
  String? tempF;
  String? isDay;
  Condition? condition;
  String? windMph;
  String? windKph;
  String? windDegree;
  String? windDir;
  String? pressureMb;
  String? pressureIn;
  String? precipMm;
  String? precipIn;
  String? snowCm;
  String? humidity;
  String? cloud;
  String? feelslikeC;
  String? feelslikeF;
  String? windchillC;
  String? windchillF;
  String? heatindexC;
  String? heatindexF;
  String? dewpointC;
  String? dewpointF;
  String? willItRain;
  String? chanceOfRain;
  String? willItSnow;
  String? chanceOfSnow;
  String? visKm;
  String? visMiles;
  String? gustMph;
  String? gustKph;
  String? uv;

  Hour(
      {this.timeEpoch,
      this.time,
      this.tempC,
      this.tempF,
      this.isDay,
      this.condition,
      this.windMph,
      this.windKph,
      this.windDegree,
      this.windDir,
      this.pressureMb,
      this.pressureIn,
      this.precipMm,
      this.precipIn,
      this.snowCm,
      this.humidity,
      this.cloud,
      this.feelslikeC,
      this.feelslikeF,
      this.windchillC,
      this.windchillF,
      this.heatindexC,
      this.heatindexF,
      this.dewpointC,
      this.dewpointF,
      this.willItRain,
      this.chanceOfRain,
      this.willItSnow,
      this.chanceOfSnow,
      this.visKm,
      this.visMiles,
      this.gustMph,
      this.gustKph,
      this.uv});

  Hour.fromJson(Map<String, dynamic> json) {
    timeEpoch = json['time_epoch'].toString();
    time = json['time'].toString();
    tempC = json['temp_c'].toString();
    tempF = json['temp_f'].toString();
    isDay = json['is_day'].toString();
    condition = json['condition'] != null ? Condition.fromJson(json['condition']) : null;
    windMph = json['wind_mph'].toString();
    windKph = json['wind_kph'].toString();
    windDegree = json['wind_degree'].toString();
    windDir = json['wind_dir'].toString();
    pressureMb = json['pressure_mb'].toString();
    pressureIn = json['pressure_in'].toString();
    precipMm = json['precip_mm'].toString();
    precipIn = json['precip_in'].toString();
    snowCm = json['snow_cm'].toString();
    humidity = json['humidity'].toString();
    cloud = json['cloud'].toString();
    feelslikeC = json['feelslike_c'].toString();
    feelslikeF = json['feelslike_f'].toString();
    windchillC = json['windchill_c'].toString();
    windchillF = json['windchill_f'].toString();
    heatindexC = json['heatindex_c'].toString();
    heatindexF = json['heatindex_f'].toString();
    dewpointC = json['dewpoint_c'].toString();
    dewpointF = json['dewpoint_f'].toString();
    willItRain = json['will_it_rain'].toString();
    chanceOfRain = json['chance_of_rain'].toString();
    willItSnow = json['will_it_snow'].toString();
    chanceOfSnow = json['chance_of_snow'].toString();
    visKm = json['vis_km'].toString();
    visMiles = json['vis_miles'].toString();
    gustMph = json['gust_mph'].toString();
    gustKph = json['gust_kph'].toString();
    uv = json['uv'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['time_epoch'] = this.timeEpoch;
    data['time'] = this.time;
    data['temp_c'] = this.tempC;
    data['temp_f'] = this.tempF;
    data['is_day'] = this.isDay;
    if (this.condition != null) {
      data['condition'] = this.condition!.toJson();
    }
    data['wind_mph'] = this.windMph;
    data['wind_kph'] = this.windKph;
    data['wind_degree'] = this.windDegree;
    data['wind_dir'] = this.windDir;
    data['pressure_mb'] = this.pressureMb;
    data['pressure_in'] = this.pressureIn;
    data['precip_mm'] = this.precipMm;
    data['precip_in'] = this.precipIn;
    data['snow_cm'] = this.snowCm;
    data['humidity'] = this.humidity;
    data['cloud'] = this.cloud;
    data['feelslike_c'] = this.feelslikeC;
    data['feelslike_f'] = this.feelslikeF;
    data['windchill_c'] = this.windchillC;
    data['windchill_f'] = this.windchillF;
    data['heatindex_c'] = this.heatindexC;
    data['heatindex_f'] = this.heatindexF;
    data['dewpoint_c'] = this.dewpointC;
    data['dewpoint_f'] = this.dewpointF;
    data['will_it_rain'] = this.willItRain;
    data['chance_of_rain'] = this.chanceOfRain;
    data['will_it_snow'] = this.willItSnow;
    data['chance_of_snow'] = this.chanceOfSnow;
    data['vis_km'] = this.visKm;
    data['vis_miles'] = this.visMiles;
    data['gust_mph'] = this.gustMph;
    data['gust_kph'] = this.gustKph;
    data['uv'] = this.uv;
    return data;
  }
}
