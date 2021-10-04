import 'package:flutter/material.dart';

class CountryModel {
  final String id, code, name;

  CountryModel({this.id = '', this.code = '', this.name = ''});
}

List<CountryModel> countryModelList = <CountryModel>[
  CountryModel(name: 'Australia', code: 'AU'),
  CountryModel(name: 'Egypt', code: 'EG'),
  CountryModel(name: 'Germany', code: 'DE'),
  CountryModel(name: 'India', code: 'IN'),
  CountryModel(name: 'Singapore', code: 'SG'),
  CountryModel(name: 'United States of America', code: 'US')
];

class CustomDelegate extends SearchDelegate<CountryModel> {
  List<CountryModel> data = countryModelList;
CustomDelegate() : super(searchFieldLabel: "My own hint");
  @override
  List<Widget> buildActions(BuildContext context) =>
      [IconButton(icon: Icon(Icons.clear), onPressed: () => query = '')];

  @override
  Widget buildLeading(BuildContext context) => IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () => close(context, CountryModel()));

  @override
  Widget buildResults(BuildContext context) => Container();

  @override
  Widget buildSuggestions(BuildContext context) {
    var listToShow;
    if (query.isNotEmpty)
      listToShow = data
          .where((CountryModel e) =>
              e.name.toLowerCase().contains(query.toLowerCase()) ||
              e.name.toLowerCase().startsWith(query.toLowerCase()))
          .toList();
    else
      listToShow = data;

    return ListView.builder(
      itemCount: listToShow.length,
      itemBuilder: (_, i) {
        CountryModel item = listToShow[i];
        return ListTile(
          leading: Icon(Icons.search),
          trailing: Icon(Icons.arrow_forward_ios_rounded),
          title: Text(item.name),
          onTap: () => close(context, item),
        );
      },
    );
  }

  // @override
  // String get hintText => 'My hint text';
}
