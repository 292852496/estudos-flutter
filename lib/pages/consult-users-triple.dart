import 'package:flutter/material.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:flutterando/triple/search_users_triple.dart';

class ConsultUsersTripleWidget extends StatefulWidget {
  const ConsultUsersTripleWidget({Key? key}) : super(key: key);

  @override
  _ConsultUsersTripleWidget createState() => _ConsultUsersTripleWidget();
}

class _ConsultUsersTripleWidget extends State<ConsultUsersTripleWidget> {
  SearchUsersTriple searchUsersTriple = SearchUsersTriple();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: ScopedBuilder(
          store: searchUsersTriple,
          onLoading: (_) {
            return const Center(child: CircularProgressIndicator());
          },
          onError: (_, e) {
            return const Text('Ocorreu um erro');
          },
          onState: (_, state) {
            return searchUsersTriple.state.data.isEmpty
                ? BTNSearchUsersList(searchUsersTriple: searchUsersTriple)
                : ListView.builder(
                    itemCount: searchUsersTriple.state.data.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        title: Text(searchUsersTriple.state.data[index].name
                            .toString()),
                      );
                    });
          },
        ));
  }
}

class BTNSearchUsersList extends StatefulWidget {
  const BTNSearchUsersList({Key? key, required this.searchUsersTriple})
      : super(key: key);

  final SearchUsersTriple searchUsersTriple;

  @override
  _BTNSearchUsersListState createState() => _BTNSearchUsersListState();
}

class _BTNSearchUsersListState extends State<BTNSearchUsersList> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            widget.searchUsersTriple.searchUsers();
          });
        },
        child: const Text('BUSCAR'),
      ),
    );
  }
}
