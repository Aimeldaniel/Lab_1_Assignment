import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COUNTRY2U',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Country2U'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> _allCountries = [
    {"code": "AF", "name": "Afghanistan"},
    {"code": "AX", "name": "\u00c5land Islands"},
    {"code": "AL", "name": "Albania"},
    {"code": "DZ", "name": "Algeria"},
    {"code": "AS", "name": "American Samoa"},
    {"code": "AD", "name": "Andorra"},
    {"code": "AO", "name": "Angola"},
    {"code": "AI", "name": "Anguilla"},
    {"code": "AQ", "name": "Antarctica"},
    {"code": "AG", "name": "Antigua and Barbuda"},
    {"code": "AR", "name": "Argentina"},
    {"code": "AM", "name": "Armenia"},
    {"code": "AW", "name": "Aruba"},
    {"code": "AU", "name": "Australia"},
    {"code": "AT", "name": "Austria"},
    {"code": "AZ", "name": "Azerbaijan"},
    {"code": "BS", "name": "Bahamas"},
    {"code": "BH", "name": "Bahrain"},
    {"code": "BD", "name": "Bangladesh"},
    {"code": "BB", "name": "Barbados"},
    {"code": "BY", "name": "Belarus"},
    {"code": "BE", "name": "Belgium"},
    {"code": "BZ", "name": "Belize"},
    {"code": "BJ", "name": "Benin"},
    {"code": "BM", "name": "Bermuda"},
    {"code": "BT", "name": "Bhutan"},
    {"code": "BO", "name": "Bolivia, Plurinational State of"},
    {"code": "BQ", "name": "Bonaire, Sint Eustatius and Saba"},
    {"code": "BA", "name": "Bosnia and Herzegovina"},
    {"code": "BW", "name": "Botswana"},
    {"code": "BV", "name": "Bouvet Island"},
    {"code": "BR", "name": "Brazil"},
    {"code": "IO", "name": "British Indian Ocean Territory"},
    {"code": "BN", "name": "Brunei Darussalam"},
    {"code": "BG", "name": "Bulgaria"},
    {"code": "BF", "name": "Burkina Faso"},
    {"code": "BI", "name": "Burundi"},
    {"code": "KH", "name": "Cambodia"},
    {"code": "CM", "name": "Cameroon"},
    {"code": "CA", "name": "Canada"},
    {"code": "CV", "name": "Cape Verde"},
    {"code": "KY", "name": "Cayman Islands"},
    {"code": "CF", "name": "Central African Republic"},
    {"code": "TD", "name": "Chad"},
    {"code": "CL", "name": "Chile"},
    {"code": "CN", "name": "China"},
    {"code": "CX", "name": "Christmas Island"},
    {"code": "CC", "name": "Cocos (Keeling) Islands"},
    {"code": "CO", "name": "Colombia"},
    {"code": "KM", "name": "Comoros"},
    {"code": "CG", "name": "Congo"},
    {"code": "CD", "name": "Congo, the Democratic Republic of the"},
    {"code": "CK", "name": "Cook Islands"},
    {"code": "CR", "name": "Costa Rica"},
    {"code": "CI", "name": "C\u00f4te d'Ivoire"},
    {"code": "HR", "name": "Croatia"},
    {"code": "CU", "name": "Cuba"},
    {"code": "CW", "name": "Cura\u00e7ao"},
    {"code": "CY", "name": "Cyprus"},
    {"code": "CZ", "name": "Czech Republic"},
    {"code": "DK", "name": "Denmark"},
    {"code": "DJ", "name": "Djibouti"},
    {"code": "DM", "name": "Dominica"},
    {"code": "DO", "name": "Dominican Republic"},
    {"code": "EC", "name": "Ecuador"},
    {"code": "EG", "name": "Egypt"},
    {"code": "SV", "name": "El Salvador"},
    {"code": "GQ", "name": "Equatorial Guinea"},
    {"code": "ER", "name": "Eritrea"},
    {"code": "EE", "name": "Estonia"},
    {"code": "ET", "name": "Ethiopia"},
    {"code": "FK", "name": "Falkland Islands (Malvinas)"},
    {"code": "FO", "name": "Faroe Islands"},
    {"code": "FJ", "name": "Fiji"},
    {"code": "FI", "name": "Finland"},
    {"code": "FR", "name": "France"},
    {"code": "GF", "name": "French Guiana"},
    {"code": "PF", "name": "French Polynesia"},
    {"code": "TF", "name": "French Southern Territories"},
    {"code": "GA", "name": "Gabon"},
    {"code": "GM", "name": "Gambia"},
    {"code": "GE", "name": "Georgia"},
    {"code": "DE", "name": "Germany"},
    {"code": "GH", "name": "Ghana"},
    {"code": "GI", "name": "Gibraltar"},
    {"code": "GR", "name": "Greece"},
    {"code": "GL", "name": "Greenland"},
    {"code": "GD", "name": "Grenada"},
    {"code": "GP", "name": "Guadeloupe"},
    {"code": "GU", "name": "Guam"},
    {"code": "GT", "name": "Guatemala"},
    {"code": "GG", "name": "Guernsey"},
    {"code": "GN", "name": "Guinea"},
    {"code": "GW", "name": "Guinea-Bissau"},
    {"code": "GY", "name": "Guyana"},
    {"code": "HT", "name": "Haiti"},
    {"code": "HM", "name": "Heard Island and McDonald Islands"},
    {"code": "VA", "name": "Holy See (Vatican City State)"},
    {"code": "HN", "name": "Honduras"},
    {"code": "HK", "name": "Hong Kong"},
    {"code": "HU", "name": "Hungary"},
    {"code": "IS", "name": "Iceland"},
    {"code": "IN", "name": "India"},
    {"code": "ID", "name": "Indonesia"},
    {"code": "IR", "name": "Iran, Islamic Republic of"},
    {"code": "IQ", "name": "Iraq"},
    {"code": "IE", "name": "Ireland"},
    {"code": "IM", "name": "Isle of Man"},
    {"code": "IL", "name": "Israel"},
    {"code": "IT", "name": "Italy"},
    {"code": "JM", "name": "Jamaica"},
    {"code": "JP", "name": "Japan"},
    {"code": "JE", "name": "Jersey"},
    {"code": "JO", "name": "Jordan"},
    {"code": "KZ", "name": "Kazakhstan"},
    {"code": "KE", "name": "Kenya"},
    {"code": "KI", "name": "Kiribati"},
    {"code": "KP", "name": "Korea, Democratic People's Republic of"},
    {"code": "KR", "name": "Korea, Republic of"},
    {"code": "KW", "name": "Kuwait"},
    {"code": "KG", "name": "Kyrgyzstan"},
    {"code": "LA", "name": "Lao People's Democratic Republic"},
    {"code": "LV", "name": "Latvia"},
    {"code": "LB", "name": "Lebanon"},
    {"code": "LS", "name": "Lesotho"},
    {"code": "LR", "name": "Liberia"},
    {"code": "LY", "name": "Libya"},
    {"code": "LI", "name": "Liechtenstein"},
    {"code": "LT", "name": "Lithuania"},
    {"code": "LU", "name": "Luxembourg"},
    {"code": "MO", "name": "Macao"},
    {"code": "MK", "name": "Macedonia, the Former Yugoslav Republic of"},
    {"code": "MG", "name": "Madagascar"},
    {"code": "MW", "name": "Malawi"},
    {"code": "MY", "name": "Malaysia"},
    {"code": "MV", "name": "Maldives"},
    {"code": "ML", "name": "Mali"},
    {"code": "MT", "name": "Malta"},
    {"code": "MH", "name": "Marshall Islands"},
    {"code": "MQ", "name": "Martinique"},
    {"code": "MR", "name": "Mauritania"},
    {"code": "MU", "name": "Mauritius"},
    {"code": "YT", "name": "Mayotte"},
    {"code": "MX", "name": "Mexico"},
    {"code": "FM", "name": "Micronesia, Federated States of"},
    {"code": "MD", "name": "Moldova, Republic of"},
    {"code": "MC", "name": "Monaco"},
    {"code": "MN", "name": "Mongolia"},
    {"code": "ME", "name": "Montenegro"},
    {"code": "MS", "name": "Montserrat"},
    {"code": "MA", "name": "Morocco"},
    {"code": "MZ", "name": "Mozambique"},
    {"code": "MM", "name": "Myanmar"},
    {"code": "NA", "name": "Namibia"},
    {"code": "NR", "name": "Nauru"},
    {"code": "NP", "name": "Nepal"},
    {"code": "NL", "name": "Netherlands"},
    {"code": "NC", "name": "New Caledonia"},
    {"code": "NZ", "name": "New Zealand"},
    {"code": "NI", "name": "Nicaragua"},
    {"code": "NE", "name": "Niger"},
    {"code": "NG", "name": "Nigeria"},
    {"code": "NU", "name": "Niue"},
    {"code": "NF", "name": "Norfolk Island"},
    {"code": "MP", "name": "Northern Mariana Islands"},
    {"code": "NO", "name": "Norway"},
    {"code": "OM", "name": "Oman"},
    {"code": "PK", "name": "Pakistan"},
    {"code": "PW", "name": "Palau"},
    {"code": "PS", "name": "Palestine, State of"},
    {"code": "PA", "name": "Panama"},
    {"code": "PG", "name": "Papua New Guinea"},
    {"code": "PY", "name": "Paraguay"},
    {"code": "PE", "name": "Peru"},
    {"code": "PH", "name": "Philippines"},
    {"code": "PN", "name": "Pitcairn"},
    {"code": "PL", "name": "Poland"},
    {"code": "PT", "name": "Portugal"},
    {"code": "PR", "name": "Puerto Rico"},
    {"code": "QA", "name": "Qatar"},
    {"code": "RE", "name": "R\u00e9union"},
    {"code": "RO", "name": "Romania"},
    {"code": "RU", "name": "Russian Federation"},
    {"code": "RW", "name": "Rwanda"},
    {"code": "BL", "name": "Saint Barth\u00e9lemy"},
    {"code": "SH", "name": "Saint Helena, Ascension and Tristan da Cunha"},
    {"code": "KN", "name": "Saint Kitts and Nevis"},
    {"code": "LC", "name": "Saint Lucia"},
    {"code": "MF", "name": "Saint Martin (French part)"},
    {"code": "PM", "name": "Saint Pierre and Miquelon"},
    {"code": "VC", "name": "Saint Vincent and the Grenadines"},
    {"code": "WS", "name": "Samoa"},
    {"code": "SM", "name": "San Marino"},
    {"code": "ST", "name": "Sao Tome and Principe"},
    {"code": "SA", "name": "Saudi Arabia"},
    {"code": "SN", "name": "Senegal"},
    {"code": "RS", "name": "Serbia"},
    {"code": "SC", "name": "Seychelles"},
    {"code": "SL", "name": "Sierra Leone"},
    {"code": "SG", "name": "Singapore"},
    {"code": "SX", "name": "Sint Maarten (Dutch part)"},
    {"code": "SK", "name": "Slovakia"},
    {"code": "SI", "name": "Slovenia"},
    {"code": "SB", "name": "Solomon Islands"},
    {"code": "SO", "name": "Somalia"},
    {"code": "ZA", "name": "South Africa"},
    {"code": "GS", "name": "South Georgia and the South Sandwich Islands"},
    {"code": "SS", "name": "South Sudan"},
    {"code": "ES", "name": "Spain"},
    {"code": "LK", "name": "Sri Lanka"},
    {"code": "SD", "name": "Sudan"},
    {"code": "SR", "name": "Suriname"},
    {"code": "SJ", "name": "Svalbard and Jan Mayen"},
    {"code": "SZ", "name": "Swaziland"},
    {"code": "SE", "name": "Sweden"},
    {"code": "CH", "name": "Switzerland"},
    {"code": "SY", "name": "Syrian Arab Republic"},
    {"code": "TW", "name": "Taiwan, Province of China"},
    {"code": "TJ", "name": "Tajikistan"},
    {"code": "TZ", "name": "Tanzania, United Republic of"},
    {"code": "TH", "name": "Thailand"},
    {"code": "TL", "name": "Timor-Leste"},
    {"code": "TG", "name": "Togo"},
    {"code": "TK", "name": "Tokelau"},
    {"code": "TO", "name": "Tonga"},
    {"code": "TT", "name": "Trinidad and Tobago"},
    {"code": "TN", "name": "Tunisia"},
    {"code": "TR", "name": "Turkey"},
    {"code": "TM", "name": "Turkmenistan"},
    {"code": "TC", "name": "Turks and Caicos Islands"},
    {"code": "TV", "name": "Tuvalu"},
    {"code": "UG", "name": "Uganda"},
    {"code": "UA", "name": "Ukraine"},
    {"code": "AE", "name": "United Arab Emirates"},
    {"code": "GB", "name": "United Kingdom"},
    {"code": "US", "name": "United States"},
    {"code": "UM", "name": "United States Minor Outlying Islands"},
    {"code": "UY", "name": "Uruguay"},
    {"code": "UZ", "name": "Uzbekistan"},
    {"code": "VU", "name": "Vanuatu"},
    {"code": "VE", "name": "Venezuela, Bolivarian Republic of"},
    {"code": "VN", "name": "Viet Nam"},
    {"code": "VG", "name": "Virgin Islands, British"},
    {"code": "VI", "name": "Virgin Islands, U.S."},
    {"code": "WF", "name": "Wallis and Futuna"},
    {"code": "EH", "name": "Western Sahara"},
    {"code": "YE", "name": "Yemen"},
    {"code": "ZM", "name": "Zambia"},
    {"code": "ZW", "name": "Zimbabwe"}
  ];

  List<Map<String, dynamic>> _foundCountries = [];

  @override
  initState() {
    _foundCountries = _allCountries;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title)
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: TextField(
              onChanged: (string) => _runFilter(string),
              decoration: const InputDecoration(
              labelText: 'Search',
              suffixIcon: Icon(Icons.search),
            )),
          ),
        Expanded(
            child: _foundCountries.isNotEmpty
                ? ListView.builder(
                  itemCount: _foundCountries.length,
                  itemBuilder: (context, index) => InkWell(
                    child: ListTile(
                    leading: Image.network(
                     'https://flagsapi.com/${_foundCountries[index]['code']}/flat/24.png',
                    ),
                    title: Text(_foundCountries[index]['name']),
                  ),
                    onTap: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context)=> CountryPage(
                            country: _foundCountries[index]['name'],
                          ),
                        )
                      )
                    },
            ),
          )
          : const Text('No countries are found')),
        ],
    ),
    );  
  }

  void _runFilter(String string) {
    List<Map<String, dynamic>> results = [];

    if (string.isEmpty){
      results = _allCountries;
    } else {
      results = _allCountries.where((country) {
        return country['name'].toLowerCase().contains(string.toLowerCase());
      }).toList();
    }
  
  setState(() {
    _foundCountries = results;
   });
 }
}




class  Country {
  final String capital;
  final String region;
  final double gdp;
  final double gdpGrowth;
  final double population;

  const Country({
    required this.capital,
    required this.gdp,
    required this.gdpGrowth,
    required this.population,
    required this.region,
  });

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      capital: json['capital'],
      gdp: json['gdp'],
      gdpGrowth: json['gdp_growth'], 
      population: json['population'],
      region: json['region']); 
  }
}

class CountryPage extends StatefulWidget {
  const CountryPage({super.key, required this.country});

  final String country;

  @override
  State<CountryPage> createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
  Future<Country?> _fetchCountry(String country) async {
    final response = await http.get(
    Uri.parse('https://api.api-ninjas.com/v1/country?name=$country'),
    headers: {"X-Api-Key": "5wdyY0fqNbAHvziK8l/hag==mB0YMUsNyq1VCeZg"},
    );

    if (response.statusCode == 200) {
      return Country.fromJson(jsonDecode(response.body)[0]);
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.country)) ,
      body: FutureBuilder<Country?>(
        future: _fetchCountry(widget.country),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                ListTile(
                  title: const Text('Capital'),
                  subtitle: Text(snapshot.data?.capital ?? ''),
                ),
                ListTile(
                  title: const Text('Population'),
                  subtitle: Text('${snapshot.data?.population ?? '0'}'),
                ),
                ListTile(
                  title: const Text('Region'),
                  subtitle: Text(snapshot.data?.region ?? ''),
                ),
                ListTile(
                  title: const Text('GDP'),
                  subtitle: Text('${snapshot.data?.gdp ?? '0'}'),
                ),
                ListTile(
                  title: const Text('GDP growth'),
                  subtitle: Text('${snapshot.data?.gdpGrowth ?? '0'}%'),
                ),
              ],
            );
          } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const Center(child: CircularProgressIndicator());
       },
     ),
   );
  }
}


     