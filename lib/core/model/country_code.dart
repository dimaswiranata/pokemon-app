// To parse this JSON data, do
//
//     final countryCode = countryCodeFromJson(jsonString);

import 'dart:convert';

CountryCode countryCodeFromJson(String str) => CountryCode.fromJson(json.decode(str));

String countryCodeToJson(CountryCode data) => json.encode(data.toJson());

class CountryCode {
  String name;
  String dial_code;
  String code;

  CountryCode({
    required this.name,
    required this.dial_code,
    required this.code,
  });

  factory CountryCode.fromJson(Map<String, dynamic> json) => CountryCode(
        name: json["name"],
        dial_code: json["dial_code"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "dial_code": dial_code,
        "code": code,
      };
}

List<CountryCode> topCountries = [
  CountryCode(name: 'Indonesia', dial_code: '62', code: 'ID'),
  CountryCode(name: 'Singapore', dial_code: '65', code: 'SG'),
  CountryCode(name: 'Malaysia', dial_code: '60', code: 'MY'),
];

List<CountryCode> listCountries = [
  CountryCode(
    name: 'Afghanistan',
    dial_code: '93',
    code: 'AF',
  ),
  CountryCode(
    name: 'Albania',
    dial_code: '355',
    code: 'AL',
  ),
  CountryCode(
    name: 'Algeria',
    dial_code: '213',
    code: 'DZ',
  ),
  // CountryCode(
  //   name: 'American Samoa',
  //   dial_code: '1684',
  //   code: 'AS',
  // ),
  // CountryCode(
  //   name: 'Andorra',
  //   dial_code: '376',
  //   code: 'AD',
  // ),
  // CountryCode(
  //   name: 'Angola',
  //   dial_code: '244',
  //   code: 'AO',
  // ),
  // CountryCode(
  //   name: 'Anguilla',
  //   dial_code: '1264',
  //   code: 'AI',
  // ),
  // CountryCode(
  //   name: 'Antigua and Barbuda',
  //   dial_code: '1268',
  //   code: 'AG',
  // ),
  CountryCode(
    name: 'Argentina',
    dial_code: '54',
    code: 'AR',
  ),
  // CountryCode(
  //   name: 'Armenia',
  //   dial_code: '374',
  //   code: 'AM',
  // ),
  // CountryCode(
  //   name: 'Aruba',
  //   dial_code: '297',
  //   code: 'AW',
  // ),
  CountryCode(
    name: 'Australia',
    dial_code: '61',
    code: 'AU',
  ),
  CountryCode(
    name: 'Austria',
    dial_code: '43',
    code: 'AT',
  ),
  CountryCode(
    name: 'Azerbaijan',
    dial_code: '994',
    code: 'AZ',
  ),
  // CountryCode(
  //   name: 'Bahamas',
  //   dial_code: '1242',
  //   code: 'BS',
  // ),
  CountryCode(
    name: 'Bahrain',
    dial_code: '973',
    code: 'BH',
  ),
  CountryCode(
    name: 'Bangladesh',
    dial_code: '880',
    code: 'BD',
  ),
  // CountryCode(
  //   name: 'Barbados',
  //   dial_code: '1246',
  //   code: 'BB',
  // ),
  CountryCode(
    name: 'Belarus',
    dial_code: '375',
    code: 'BY',
  ),
  CountryCode(
    name: 'Belgium',
    dial_code: '32',
    code: 'BE',
  ),
  // CountryCode(
  //   name: 'Belize',
  //   dial_code: '501',
  //   code: 'BZ',
  // ),
  // CountryCode(
  //   name: 'Benin',
  //   dial_code: '229',
  //   code: 'BJ',
  // ),
  // CountryCode(
  //   name: 'Bermuda',
  //   dial_code: '1441',
  //   code: 'BM',
  // ),
  // CountryCode(
  //   name: 'Bhutan',
  //   dial_code: '975',
  //   code: 'BT',
  // ),
  // CountryCode(
  //   name: 'Bosnia and Herzegovina',
  //   dial_code: '387',
  //   code: 'BA',
  // ),
  // CountryCode(
  //   name: 'Botswana',
  //   dial_code: '267',
  //   code: 'BW',
  // ),
  CountryCode(
    name: 'Brazil',
    dial_code: '55',
    code: 'BR',
  ),
  CountryCode(
    name: 'British Indian Ocean Territory',
    dial_code: '246',
    code: 'IO',
  ),
  CountryCode(
    name: 'Bulgaria',
    dial_code: '359',
    code: 'BG',
  ),
  // CountryCode(
  //   name: 'Burkina Faso',
  //   dial_code: '226',
  //   code: 'BF',
  // ),
  // CountryCode(
  //   name: 'Burundi',
  //   dial_code: '257',
  //   code: 'BI',
  // ),
  CountryCode(
    name: 'Cambodia',
    dial_code: '855',
    code: 'KH',
  ),
  CountryCode(
    name: 'Cameroon',
    dial_code: '237',
    code: 'CM',
  ),
  CountryCode(
    name: 'Canada',
    dial_code: '1',
    code: 'CA',
  ),
  // CountryCode(
  //   name: 'Cape Verde',
  //   dial_code: '238',
  //   code: 'CV',
  // ),
  // CountryCode(
  //   name: 'Cayman Islands',
  //   dial_code: ' 345',
  //   code: 'KY',
  // ),
  CountryCode(
    name: 'Central African Republic',
    dial_code: '236',
    code: 'CF',
  ),
  // CountryCode(
  //   name: 'Chad',
  //   dial_code: '235',
  //   code: 'TD',
  // ),
  CountryCode(
    name: 'Chile',
    dial_code: '56',
    code: 'CL',
  ),
  CountryCode(
    name: 'China',
    dial_code: '86',
    code: 'CN',
  ),
  CountryCode(
    name: 'Christmas Island',
    dial_code: '61',
    code: 'CX',
  ),
  CountryCode(
    name: 'Colombia',
    dial_code: '57',
    code: 'CO',
  ),
  // CountryCode(
  //   name: 'Comoros',
  //   dial_code: '269',
  //   code: 'KM',
  // ),
  // CountryCode(
  //   name: 'Congo',
  //   dial_code: '242',
  //   code: 'CG',
  // ),
  // CountryCode(
  //   name: 'Cook Islands',
  //   dial_code: '682',
  //   code: 'CK',
  // ),
  // CountryCode(
  //   name: 'Costa Rica',
  //   dial_code: '506',
  //   code: 'CR',
  // ),
  CountryCode(
    name: 'Croatia',
    dial_code: '385',
    code: 'HR',
  ),
  // CountryCode(
  //   name: 'Cuba',
  //   dial_code: '53',
  //   code: 'CU',
  // ),
  // CountryCode(
  //   name: 'Cyprus',
  //   dial_code: '537',
  //   code: 'CY',
  // ),
  CountryCode(
    name: 'Czech Republic',
    dial_code: '420',
    code: 'CZ',
  ),
  CountryCode(
    name: 'Denmark',
    dial_code: '45',
    code: 'DK',
  ),
  // CountryCode(
  //   name: 'Djibouti',
  //   dial_code: '253',
  //   code: 'DJ',
  // ),
  // CountryCode(
  //   name: 'Dominica',
  //   dial_code: '1767',
  //   code: 'DM',
  // ),
  // CountryCode(
  //   name: 'Dominican Republic',
  //   dial_code: '1849',
  //   code: 'DO',
  // ),
  CountryCode(
    name: 'Ecuador',
    dial_code: '593',
    code: 'EC',
  ),
  CountryCode(
    name: 'Egypt',
    dial_code: '20',
    code: 'EG',
  ),
  // CountryCode(
  //   name: 'El Salvador',
  //   dial_code: '503',
  //   code: 'SV',
  // ),
  // CountryCode(
  //   name: 'Equatorial Guinea',
  //   dial_code: '240',
  //   code: 'GQ',
  // ),
  // CountryCode(
  //   name: 'Eritrea',
  //   dial_code: '291',
  //   code: 'ER',
  // ),
  // CountryCode(
  //   name: 'Estonia',
  //   dial_code: '372',
  //   code: 'EE',
  // ),
  // CountryCode(
  //   name: 'Ethiopia',
  //   dial_code: '251',
  //   code: 'ET',
  // ),
  // CountryCode(
  //   name: 'Faroe Islands',
  //   dial_code: '298',
  //   code: 'FO',
  // ),
  // CountryCode(
  //   name: 'Fiji',
  //   dial_code: '679',
  //   code: 'FJ',
  // ),
  CountryCode(
    name: 'Finland',
    dial_code: '358',
    code: 'FI',
  ),
  CountryCode(
    name: 'France',
    dial_code: '33',
    code: 'FR',
  ),
  // CountryCode(
  //   name: 'French Guiana',
  //   dial_code: '594',
  //   code: 'GF',
  // ),
  // CountryCode(
  //   name: 'French Polynesia',
  //   dial_code: '689',
  //   code: 'PF',
  // ),
  // CountryCode(
  //   name: 'Gabon',
  //   dial_code: '241',
  //   code: 'GA',
  // ),
  // CountryCode(
  //   name: 'Gambia',
  //   dial_code: '220',
  //   code: 'GM',
  // ),
  // CountryCode(
  //   name: 'Georgia',
  //   dial_code: '995',
  //   code: 'GE',
  // ),
  CountryCode(
    name: 'Germany',
    dial_code: '49',
    code: 'DE',
  ),
  CountryCode(
    name: 'Ghana',
    dial_code: '233',
    code: 'GH',
  ),
  // CountryCode(
  //   name: 'Gibraltar',
  //   dial_code: '350',
  //   code: 'GI',
  // ),
  CountryCode(
    name: 'Greece',
    dial_code: '30',
    code: 'GR',
  ),
  // CountryCode(
  //   name: 'Greenland',
  //   dial_code: '299',
  //   code: 'GL',
  // ),
  // CountryCode(
  //   name: 'Grenada',
  //   dial_code: '1473',
  //   code: 'GD',
  // ),
  // CountryCode(
  //   name: 'Guadeloupe',
  //   dial_code: '590',
  //   code: 'GP',
  // ),
  // CountryCode(
  //   name: 'Guam',
  //   dial_code: '1671',
  //   code: 'GU',
  // ),
  // CountryCode(
  //   name: 'Guatemala',
  //   dial_code: '502',
  //   code: 'GT',
  // ),
  // CountryCode(
  //   name: 'Guinea',
  //   dial_code: '224',
  //   code: 'GN',
  // ),
  // CountryCode(
  //   name: 'Guinea-Bissau',
  //   dial_code: '245',
  //   code: 'GW',
  // ),
  // CountryCode(
  //   name: 'Guyana',
  //   dial_code: '595',
  //   code: 'GY',
  // ),
  // CountryCode(
  //   name: 'Haiti',
  //   dial_code: '509',
  //   code: 'HT',
  // ),
  // CountryCode(
  //   name: 'Honduras',
  //   dial_code: '504',
  //   code: 'HN',
  // ),
  CountryCode(
    name: 'Hungary',
    dial_code: '36',
    code: 'HU',
  ),
  CountryCode(
    name: 'Iceland',
    dial_code: '354',
    code: 'IS',
  ),
  CountryCode(
    name: 'India',
    dial_code: '91',
    code: 'IN',
  ),
  CountryCode(
    name: 'Indonesia',
    dial_code: '62',
    code: 'ID',
  ),
  CountryCode(
    name: 'Iraq',
    dial_code: '964',
    code: 'IQ',
  ),
  CountryCode(
    name: 'Ireland',
    dial_code: '353',
    code: 'IE',
  ),
  // CountryCode(
  //   name: 'Israel',
  //   dial_code: '972',
  //   code: 'IL',
  // ),
  CountryCode(
    name: 'Italy',
    dial_code: '39',
    code: 'IT',
  ),
  CountryCode(
    name: 'Jamaica',
    dial_code: '1876',
    code: 'JM',
  ),
  CountryCode(
    name: 'Japan',
    dial_code: '81',
    code: 'JP',
  ),
  CountryCode(
    name: 'Jordan',
    dial_code: '962',
    code: 'JO',
  ),
  CountryCode(
    name: 'Kazakhstan',
    dial_code: '77',
    code: 'KZ',
  ),
  // CountryCode(
  //   name: 'Kenya',
  //   dial_code: '254',
  //   code: 'KE',
  // ),
  // CountryCode(
  //   name: 'Kiribati',
  //   dial_code: '686',
  //   code: 'KI',
  // ),
  CountryCode(
    name: 'Kuwait',
    dial_code: '965',
    code: 'KW',
  ),
  CountryCode(
    name: 'Kyrgyzstan',
    dial_code: '996',
    code: 'KG',
  ),
  CountryCode(
    name: 'Latvia',
    dial_code: '371',
    code: 'LV',
  ),
  CountryCode(
    name: 'Lebanon',
    dial_code: '961',
    code: 'LB',
  ),
  // CountryCode(
  //   name: 'Lesotho',
  //   dial_code: '266',
  //   code: 'LS',
  // ),
  // CountryCode(
  //   name: 'Liberia',
  //   dial_code: '231',
  //   code: 'LR',
  // ),
  // CountryCode(
  //   name: 'Liechtenstein',
  //   dial_code: '423',
  //   code: 'LI',
  // ),
  // CountryCode(
  //   name: 'Lithuania',
  //   dial_code: '370',
  //   code: 'LT',
  // ),
  // CountryCode(
  //   name: 'Luxembourg',
  //   dial_code: '352',
  //   code: 'LU',
  // ),
  // CountryCode(
  //   name: 'Madagascar',
  //   dial_code: '261',
  //   code: 'MG',
  // ),
  // CountryCode(
  //   name: 'Malawi',
  //   dial_code: '265',
  //   code: 'MW',
  // ),
  CountryCode(
    name: 'Malaysia',
    dial_code: '60',
    code: 'MY',
  ),
  CountryCode(
    name: 'Maldives',
    dial_code: '960',
    code: 'MV',
  ),
  // CountryCode(
  //   name: 'Mali',
  //   dial_code: '223',
  //   code: 'ML',
  // ),
  // CountryCode(
  //   name: 'Malta',
  //   dial_code: '356',
  //   code: 'MT',
  // ),
  // CountryCode(
  //   name: 'Marshall Islands',
  //   dial_code: '692',
  //   code: 'MH',
  // ),
  // CountryCode(
  //   name: 'Martinique',
  //   dial_code: '596',
  //   code: 'MQ',
  // ),
  // CountryCode(
  //   name: 'Mauritania',
  //   dial_code: '222',
  //   code: 'MR',
  // ),
  // CountryCode(
  //   name: 'Mauritius',
  //   dial_code: '230',
  //   code: 'MU',
  // ),
  // CountryCode(
  //   name: 'Mayotte',
  //   dial_code: '262',
  //   code: 'YT',
  // ),
  CountryCode(
    name: 'Mexico',
    dial_code: '52',
    code: 'MX',
  ),
  CountryCode(
    name: 'Monaco',
    dial_code: '377',
    code: 'MC',
  ),
  // CountryCode(
  //   name: 'Mongolia',
  //   dial_code: '976',
  //   code: 'MN',
  // ),
  // CountryCode(
  //   name: 'Montenegro',
  //   dial_code: '382',
  //   code: 'ME',
  // ),
  // CountryCode(
  //   name: 'Montserrat',
  //   dial_code: '1664',
  //   code: 'MS',
  // ),
  CountryCode(
    name: 'Morocco',
    dial_code: '212',
    code: 'MA',
  ),
  CountryCode(
    name: 'Myanmar',
    dial_code: '95',
    code: 'MM',
  ),
  // CountryCode(
  //   name: 'Namibia',
  //   dial_code: '264',
  //   code: 'NA',
  // ),
  // CountryCode(
  //   name: 'Nauru',
  //   dial_code: '674',
  //   code: 'NR',
  // ),
  CountryCode(
    name: 'Nepal',
    dial_code: '977',
    code: 'NP',
  ),
  CountryCode(
    name: 'Netherlands',
    dial_code: '31',
    code: 'NL',
  ),
  // CountryCode(
  //   name: 'Netherlands Antilles',
  //   dial_code: '599',
  //   code: 'AN',
  // ),
  // CountryCode(
  //   name: 'New Caledonia',
  //   dial_code: '687',
  //   code: 'NC',
  // ),
  CountryCode(
    name: 'New Zealand',
    dial_code: '64',
    code: 'NZ',
  ),
  // CountryCode(
  //   name: 'Nicaragua',
  //   dial_code: '505',
  //   code: 'NI',
  // ),
  // CountryCode(
  //   name: 'Niger',
  //   dial_code: '227',
  //   code: 'NE',
  // ),
  // CountryCode(
  //   name: 'Nigeria',
  //   dial_code: '234',
  //   code: 'NG',
  // ),
  // CountryCode(
  //   name: 'Niue',
  //   dial_code: '683',
  //   code: 'NU',
  // ),
  // CountryCode(
  //   name: 'Norfolk Island',
  //   dial_code: '672',
  //   code: 'NF',
  // ),
  // CountryCode(
  //   name: 'Northern Mariana Islands',
  //   dial_code: '1670',
  //   code: 'MP',
  // ),
  CountryCode(
    name: 'Norway',
    dial_code: '47',
    code: 'NO',
  ),
  // CountryCode(
  //   name: 'Oman',
  //   dial_code: '968',
  //   code: 'OM',
  // ),
  // CountryCode(
  //   name: 'Pakistan',
  //   dial_code: '92',
  //   code: 'PK',
  // ),
  // CountryCode(
  //   name: 'Palau',
  //   dial_code: '680',
  //   code: 'PW',
  // ),
  // CountryCode(
  //   name: 'Panama',
  //   dial_code: '507',
  //   code: 'PA',
  // ),
  CountryCode(
    name: 'Papua New Guinea',
    dial_code: '675',
    code: 'PG',
  ),
  // CountryCode(
  //   name: 'Paraguay',
  //   dial_code: '595',
  //   code: 'PY',
  // ),
  // CountryCode(
  //   name: 'Peru',
  //   dial_code: '51',
  //   code: 'PE',
  // ),
  CountryCode(
    name: 'Philippines',
    dial_code: '63',
    code: 'PH',
  ),
  CountryCode(
    name: 'Poland',
    dial_code: '48',
    code: 'PL',
  ),
  CountryCode(
    name: 'Portugal',
    dial_code: '351',
    code: 'PT',
  ),
  // CountryCode(
  //   name: 'Puerto Rico',
  //   dial_code: '1939',
  //   code: 'PR',
  // ),
  CountryCode(
    name: 'Qatar',
    dial_code: '974',
    code: 'QA',
  ),
  CountryCode(
    name: 'Romania',
    dial_code: '40',
    code: 'RO',
  ),
  CountryCode(
    name: 'Rwanda',
    dial_code: '250',
    code: 'RW',
  ),
  // CountryCode(
  //   name: 'Samoa',
  //   dial_code: '685',
  //   code: 'WS',
  // ),
  // CountryCode(
  //   name: 'San Marino',
  //   dial_code: '378',
  //   code: 'SM',
  // ),
  CountryCode(
    name: 'Saudi Arabia',
    dial_code: '966',
    code: 'SA',
  ),
  CountryCode(
    name: 'Senegal',
    dial_code: '221',
    code: 'SN',
  ),
  CountryCode(
    name: 'Serbia',
    dial_code: '381',
    code: 'RS',
  ),
  // CountryCode(
  //   name: 'Seychelles',
  //   dial_code: '248',
  //   code: 'SC',
  // ),
  // CountryCode(
  //   name: 'Sierra Leone',
  //   dial_code: '232',
  //   code: 'SL',
  // ),
  CountryCode(
    name: 'Singapore',
    dial_code: '65',
    code: 'SG',
  ),
  // CountryCode(
  //   name: 'Slovakia',
  //   dial_code: '421',
  //   code: 'SK',
  // ),
  // CountryCode(
  //   name: 'Slovenia',
  //   dial_code: '386',
  //   code: 'SI',
  // ),
  // CountryCode(
  //   name: 'Solomon Islands',
  //   dial_code: '677',
  //   code: 'SB',
  // ),
  CountryCode(
    name: 'South Africa',
    dial_code: '27',
    code: 'ZA',
  ),
  // CountryCode(
  //   name: 'South Georgia and the South Sandwich Islands',
  //   dial_code: '500',
  //   code: 'GS',
  // ),
  CountryCode(
    name: 'Spain',
    dial_code: '34',
    code: 'ES',
  ),
  // CountryCode(
  //   name: 'Sri Lanka',
  //   dial_code: '94',
  //   code: 'LK',
  // ),
  // CountryCode(
  //   name: 'Sudan',
  //   dial_code: '249',
  //   code: 'SD',
  // ),
  // CountryCode(
  //   name: 'Suriname',
  //   dial_code: '597',
  //   code: 'SR',
  // ),
  // CountryCode(
  //   name: 'Swaziland',
  //   dial_code: '268',
  //   code: 'SZ',
  // ),
  CountryCode(
    name: 'Sweden',
    dial_code: '46',
    code: 'SE',
  ),
  CountryCode(
    name: 'Switzerland',
    dial_code: '41',
    code: 'CH',
  ),
  // CountryCode(
  //   name: 'Tajikistan',
  //   dial_code: '992',
  //   code: 'TJ',
  // ),
  CountryCode(
    name: 'Thailand',
    dial_code: '66',
    code: 'TH',
  ),
  // CountryCode(
  //   name: 'Togo',
  //   dial_code: '228',
  //   code: 'TG',
  // ),
  // CountryCode(
  //   name: 'Tokelau',
  //   dial_code: '690',
  //   code: 'TK',
  // ),
  // CountryCode(
  //   name: 'Tonga',
  //   dial_code: '676',
  //   code: 'TO',
  // ),
  // CountryCode(
  //   name: 'Trinidad and Tobago',
  //   dial_code: '1868',
  //   code: 'TT',
  // ),
  // CountryCode(
  //   name: 'Tunisia',
  //   dial_code: '216',
  //   code: 'TN',
  // ),
  CountryCode(
    name: 'Turkey',
    dial_code: '90',
    code: 'TR',
  ),
  // CountryCode(
  //   name: 'Turkmenistan',
  //   dial_code: '993',
  //   code: 'TM',
  // ),
  // CountryCode(
  //   name: 'Turks and Caicos Islands',
  //   dial_code: '1649',
  //   code: 'TC',
  // ),
  // CountryCode(
  //   name: 'Tuvalu',
  //   dial_code: '688',
  //   code: 'TV',
  // ),
  // CountryCode(
  //   name: 'Uganda',
  //   dial_code: '256',
  //   code: 'UG',
  // ),
  CountryCode(
    name: 'Ukraine',
    dial_code: '380',
    code: 'UA',
  ),
  CountryCode(
    name: 'United Arab Emirates',
    dial_code: '971',
    code: 'AE',
  ),
  CountryCode(
    name: 'United Kingdom',
    dial_code: '44',
    code: 'GB',
  ),
  CountryCode(
    name: 'United States',
    dial_code: '1',
    code: 'US',
  ),
  // CountryCode(
  //   name: 'Uruguay',
  //   dial_code: '598',
  //   code: 'UY',
  // ),
  // CountryCode(
  //   name: 'Uzbekistan',
  //   dial_code: '998',
  //   code: 'UZ',
  // ),
  // CountryCode(
  //   name: 'Vanuatu',
  //   dial_code: '678',
  //   code: 'VU',
  // ),
  // CountryCode(
  //   name: 'Wallis and Futuna',
  //   dial_code: '681',
  //   code: 'WF',
  // ),
  // CountryCode(
  //   name: 'Yemen',
  //   dial_code: '967',
  //   code: 'YE',
  // ),
  // CountryCode(
  //   name: 'Zambia',
  //   dial_code: '260',
  //   code: 'ZM',
  // ),
  // CountryCode(
  //   name: 'Zimbabwe',
  //   dial_code: '263',
  //   code: 'ZW',
  // ),
  CountryCode(
    name: 'Bolivia, Plurinational State of',
    dial_code: '591',
    code: 'BO',
  ),
  CountryCode(
    name: 'Brunei Darussalam',
    dial_code: '673',
    code: 'BN',
  ),
  // CountryCode(
  //   name: 'Cocos (Keeling) Islands',
  //   dial_code: '61',
  //   code: 'CC',
  // ),
  // CountryCode(
  //   name: 'Congo, The Democratic Republic of the',
  //   dial_code: '243',
  //   code: 'CD',
  // ),
  // CountryCode(
  //   name: "Cote d'Ivoire",
  //   dial_code: '225',
  //   code: 'CI',
  // ),
  // CountryCode(
  //   name: 'Falkland Islands (Malvinas)',
  //   dial_code: '500',
  //   code: 'FK',
  // ),
  // CountryCode(
  //   name: 'Guernsey',
  //   dial_code: '44',
  //   code: 'GG',
  // ),
  CountryCode(
    name: 'Holy See (Vatican City State)',
    dial_code: '379',
    code: 'VA',
  ),
  CountryCode(
    name: 'Hong Kong',
    dial_code: '852',
    code: 'HK',
  ),
  CountryCode(
    name: 'Iran, Islamic Republic of',
    dial_code: '98',
    code: 'IR',
  ),
  // CountryCode(
  //   name: 'Isle of Man',
  //   dial_code: '44',
  //   code: 'IM',
  // ),
  // CountryCode(
  //   name: 'Jersey',
  //   dial_code: '44',
  //   code: 'JE',
  // ),
  CountryCode(
    name: "Korea, Democratic People's Republic of",
    dial_code: '850',
    code: 'KP',
  ),
  CountryCode(
    name: 'Korea, Republic of',
    dial_code: '82',
    code: 'KR',
  ),
  CountryCode(
    name: "Lao People's Democratic Republic",
    dial_code: '856',
    code: 'LA',
  ),
  CountryCode(
    name: 'Libyan Arab Jamahiriya',
    dial_code: '218',
    code: 'LY',
  ),
  CountryCode(
    name: 'Macao',
    dial_code: '853',
    code: 'MO',
  ),
  // CountryCode(
  //   name: 'Macedonia, The Former Yugoslav Republic of',
  //   dial_code: '389',
  //   code: 'MK',
  // ),
  // CountryCode(
  //   name: 'Micronesia, Federated States of',
  //   dial_code: '691',
  //   code: 'FM',
  // ),
  // CountryCode(
  //   name: 'Moldova, Republic of',
  //   dial_code: '373',
  //   code: 'MD',
  // ),
  // CountryCode(
  //   name: 'Mozambique',
  //   dial_code: '258',
  //   code: 'MZ',
  // ),
  CountryCode(
    name: 'Palestinian Territory, Occupied',
    dial_code: '970',
    code: 'PS',
  ),
  // CountryCode(
  //   name: 'Pitcairn',
  //   dial_code: '872',
  //   code: 'PN',
  // ),
  // CountryCode(
  //   name: 'Réunion',
  //   dial_code: '262',
  //   code: 'RE',
  // ),
  CountryCode(
    name: 'Russia',
    dial_code: '7',
    code: 'RU',
  ),
  // CountryCode(
  //   name: 'Saint Barthélemy',
  //   dial_code: '590',
  //   code: 'BL',
  // ),
  // CountryCode(
  //   name: 'Saint Helena, Ascension and Tristan Da Cunha',
  //   dial_code: '290',
  //   code: 'SH',
  // ),
  // CountryCode(
  //   name: 'Saint Kitts and Nevis',
  //   dial_code: '1869',
  //   code: 'KN',
  // ),
  // CountryCode(
  //   name: 'Saint Lucia',
  //   dial_code: '1758',
  //   code: 'LC',
  // ),
  // CountryCode(
  //   name: 'Saint Martin',
  //   dial_code: '590',
  //   code: 'MF',
  // ),
  // CountryCode(
  //   name: 'Saint Pierre and Miquelon',
  //   dial_code: '508',
  //   code: 'PM',
  // ),
  // CountryCode(
  //   name: 'Saint Vincent and the Grenadines',
  //   dial_code: '1784',
  //   code: 'VC',
  // ),
  // CountryCode(
  //   name: 'Sao Tome and Principe',
  //   dial_code: '239',
  //   code: 'ST',
  // ),
  // CountryCode(
  //   name: 'Somalia',
  //   dial_code: '252',
  //   code: 'SO',
  // ),
  // CountryCode(
  //   name: 'Svalbard and Jan Mayen',
  //   dial_code: '47',
  //   code: 'SJ',
  // ),
  // CountryCode(
  //   name: 'Syrian Arab Republic',
  //   dial_code: '963',
  //   code: 'SY',
  // ),
  CountryCode(
    name: 'Taiwan, Province of China',
    dial_code: '886',
    code: 'TW',
  ),
  // CountryCode(
  //   name: 'Tanzania, United Republic of',
  //   dial_code: '255',
  //   code: 'TZ',
  // ),
  CountryCode(
    name: 'Timor-Leste',
    dial_code: '670',
    code: 'TL',
  ),
  // CountryCode(
  //   name: 'Venezuela, Bolivarian Republic of',
  //   dial_code: '58',
  //   code: 'VE',
  // ),
  CountryCode(
    name: 'Viet Nam',
    dial_code: '84',
    code: 'VN',
  ),
  // CountryCode(
  //   name: 'Virgin Islands, British',
  //   dial_code: '1284',
  //   code: 'VG',
  // ),
  // CountryCode(
  //   name: 'Virgin Islands, U.S.',
  //   dial_code: '1340',
  //   code: 'VI',
  // ),
];
