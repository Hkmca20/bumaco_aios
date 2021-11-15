enum Currency { CAD, USD, GBP }

final currencyValues = EnumValues({
  "CAD": Currency.CAD,
  "GBP": Currency.GBP,
  "USD": Currency.USD,
});
// ●	Egypt = Pound (EGP)
// ●	UK = Pound Sterling (GBP)
// ●	KSA (Kingdom of Saudi Arabia) = Saudi Riyal (SAR)
// ●	Qatar = Qatari riyal	(QAR)
// ●	UAE(United Arab Emirates) = United Arab Emirates Dirham (AED)
// ●	Bahrain=Bahraini dinar	(BHD)
// ●	Oman = Omani rial	(OMR)
// ●	Kuwait=Kuwaiti Dinar (KWD)
// ●	Germany = Euro	(EUR)
// ●	France = European euro (EUR)

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
