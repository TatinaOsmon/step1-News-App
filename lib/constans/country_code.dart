// ignore: unused_import
import 'dart:developer';

class Country {
  const Country(this.name, this.domain);

  final String name;
  final String domain;
}

const Country unitedArabEmirates = Country('United Arab Emirates', 'ae');
const Country switzerland = Country('Switzerland', 'ch');
const Country russia = Country('Россия', 'ru');
const Country indonesia = Country('Indonesia', 'id');
const Country india = Country('India', 'in');
const Country usa = Country('USA', 'us');
const Country korea = Country('Korea', 'kr');
const Country turkey = Country('Turkey', 'tr');
const Country ukraine = Country('Ukraine', 'ua');

const Set<Country> countrySet = {
  unitedArabEmirates,
  switzerland,
  russia,
  indonesia,
  india,
  usa,
  korea,
  turkey,
  ukraine,
};
const List<Country> countryList = [
  unitedArabEmirates,
  switzerland,
  russia,
  indonesia,
  india,
  usa,
  korea,
  turkey,
  india,
  ukraine,
  korea,
];
