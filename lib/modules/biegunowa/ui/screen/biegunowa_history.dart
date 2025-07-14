import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../nav/go_router.dart';
import '../../cubit/history_biegunowa_cubit.dart';

class BiegunowaHistory extends StatelessWidget {
  const BiegunowaHistory({super.key});

  @override
  Widget build(BuildContext context) {
    final saveHistory = context.watch<HistoryBiegunowaCubit>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 115, 120, 115),
      appBar: AppBar(
        title: const Text('Historia obliczeń',style:TextStyle(fontSize: 24)),
        centerTitle: true,
        backgroundColor: Colors.green[900],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
              onPressed: () async {
                await saveHistory.closeDB();
                Navigation.router.pushReplacement('/biegunowa');
              },
              icon: const Icon(Icons.arrow_back))
        ],
      ),
      body: BlocBuilder<HistoryBiegunowaCubit, HistoryBiegunowaState>(
          builder: (context, state) {
        if (state is HistoryBiegunowaInitial) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (state is IGotIt) {
          return ListView.builder(
            itemCount: state.lista.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.green[900],
                      borderRadius: BorderRadius.circular(10)),
                  child: Dismissible(
                    onDismissed: (_) async {
                      await saveHistory.deleteFromDB(state.lista[index].id);
                    },
                    key: UniqueKey(),
                    background: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.red,),
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    direction: DismissDirection.endToStart,
                    child: ListTile(
                      textColor: Colors.white,
                      contentPadding: const EdgeInsets.all(10),
                      titleTextStyle: const TextStyle(fontSize: 20),
                      subtitleTextStyle: const TextStyle(fontSize: 16),
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 12.0),
                        child: Text(
                          state.lista[index].nazwa,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      subtitle: Column(children: [
                        RowWidget(label: 'Stanowisko', data1: state.lista[index].dane[0], flex: 1, data2: state.lista[index].dane[1]),
                        RowWidget(label: 'Nawiązanie', data1: state.lista[index].dane[2], flex: 1, data2: state.lista[index].dane[3]),
                        RowWidget(label: 'Kierunek i odległość', data1: state.lista[index].dane[4], flex: 1, data2: state.lista[index].dane[5]),
                        RowWidget(label: 'Przyrosty', data1: state.lista[index].przyrosty[0], flex: 1, data2: state.lista[index].przyrosty[1]),
                        RowWidget(label: 'Wyniki', data1: state.lista[index].wyniki[0], flex: 1, data2: state.lista[index].wyniki[1]),
                        RowWidget(label: 'Azymut A-B', data1: state.lista[index].azymut, flex: 1, data2: ''),
                      ]),
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return const Text('Error');
        }
      }),
    );
  }
}

class RowWidget extends StatelessWidget {
  const RowWidget(
      {super.key, required this.label, required this.data1, required this.flex, required this.data2});
  final String label;
  final String data1;
  final String data2;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(flex: flex, child: Text(label)),
          Expanded(
              flex: flex, child: Text(data1)),
          Expanded(
              flex: flex, child: Text(data2))
        ],
      ),
    );
  }
}