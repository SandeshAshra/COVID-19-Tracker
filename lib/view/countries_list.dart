import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:untitled/Services/states_services.dart';
import 'package:untitled/view/detail_screen.dart';

class WorldStatesCountries extends StatefulWidget {
  const WorldStatesCountries({super.key});

  @override
  State<WorldStatesCountries> createState() => _WorldStatesCountriesState();
}

class _WorldStatesCountriesState extends State<WorldStatesCountries> {
  TextEditingController searchCOntroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: searchCOntroller,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'Search with country name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    )),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: statesServices.countriesListApi(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if (!snapshot.hasData) {
                      return ListView.builder(
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return Shimmer.fromColors(
                              baseColor: Colors.grey.shade700,
                              highlightColor: Colors.grey.shade100,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Container(
                                      height: 10,
                                      width: 89,
                                      color: Colors.white,
                                    ),
                                    subtitle: Container(
                                      height: 10,
                                      width: 89,
                                      color: Colors.white,
                                    ),
                                    leading: Container(
                                      height: 50,
                                      width: 50,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            String name = snapshot.data![index]['country'];
                            if (searchCOntroller.text.isEmpty) {
                              return Column(
                                children: [
                                  InkWell(
                                    child: ListTile(
                                      title: Text(
                                          snapshot.data![index]['country']),
                                      subtitle: Text(snapshot.data![index]
                                              ['cases']
                                          .toString()),
                                      leading: Image(
                                        height: 50,
                                        width: 50,
                                        image: NetworkImage(
                                            snapshot.data![index]['countryInfo']
                                                ['flag']),
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen(
                                                    name: snapshot.data![index]['country'],
                                                    image: snapshot.data![index]['countryInfo']['flag'],
                                                    todayRecovered: snapshot.data![index]['todayRecovered'],
                                                    totalCases: snapshot.data![index]['cases'],
                                                    critical: snapshot.data![index]['critical'],
                                                    active: snapshot.data![index]['active'],
                                                    test: snapshot.data![index]['tests'],
                                                    totalRecovered: snapshot.data![index]['recovered'],
                                                    totalDeaths: snapshot.data![index]['deaths'],
                                                  )));
                                    },
                                  )
                                ],
                              );
                            } else if (name.toLowerCase().contains(
                                searchCOntroller.text.toLowerCase())) {
                              return InkWell(
                                child: Column(
                                  children: [
                                    ListTile(
                                      title:
                                          Text(snapshot.data![index]['country']),
                                      subtitle: Text(snapshot.data![index]
                                              ['cases']
                                          .toString()),
                                      leading: Image(
                                        height: 50,
                                        width: 50,
                                        image: NetworkImage(snapshot.data![index]
                                            ['countryInfo']['flag']),
                                      ),
                                    )
                                  ],
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              DetailScreen(
                                                name: snapshot.data![index]['country'],
                                                image: snapshot.data![index]['countryInfo']['flag'],
                                                todayRecovered: snapshot.data![index]['todayRecovered'],
                                                totalCases: snapshot.data![index]['cases'],
                                                critical: snapshot.data![index]['critical'],
                                                active: snapshot.data![index]['active'],
                                                test: snapshot.data![index]['tests'],
                                                totalRecovered: snapshot.data![index]['recovered'],
                                                totalDeaths: snapshot.data![index]['deaths'],
                                              )));
                                },
                              );
                            } else {
                              return Container();
                            }
                          });
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
