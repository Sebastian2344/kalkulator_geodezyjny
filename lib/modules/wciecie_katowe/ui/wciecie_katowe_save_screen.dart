import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../nav/go_router.dart';
import '../cubit/save_wcecie_katowe_cubit.dart';
import '../cubit/wciecie_katowe_cubit.dart';

class WciecieKatoweHistory extends StatelessWidget {
  const WciecieKatoweHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 127, 242),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 35, 49, 62),
        foregroundColor: Colors.white,
        title: const Text('Historia obliczeń', style: TextStyle(fontSize: 24)),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                context.read<WciecieKatoweCubit>().resetState();
                await context.read<HistoryWciecieKatoweCubit>().closeDB();
                Navigation.router.pushReplacement('/kat');
              },
              icon: const Icon(Icons.arrow_back))
        ],
      ),
      body: BlocBuilder<HistoryWciecieKatoweCubit, HistoryWciecieKatoweState>(
          builder: (context, state) {
        if (state is HistoryWciecieKatoweGetSuccesful) {
          return ListView.builder(
            itemCount: state.saveList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 35, 49, 62)),
                child: Dismissible(
                  key: Key(index.toString()),
                  background: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  onDismissed: (_) async {
                    await context
                        .read<HistoryWciecieKatoweCubit>()
                        .deleteData(state.saveList[index].id);
                  },
                  direction: DismissDirection.endToStart,
                  child: ListTile(
                    subtitleTextStyle: const TextStyle(fontSize: 16),
                    textColor: Colors.white,
                    titleTextStyle: const TextStyle(fontSize: 20),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        state.saveList[index].nazwa,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            rowbuilder(
                                'Stanowisko A',
                                state.saveList[index].wciecieKatoweModel.xA,
                                state.saveList[index].wciecieKatoweModel.yA,
                                'X',
                                'Y'),
                            rowbuilder(
                                'Stanowisko B',
                                state.saveList[index].wciecieKatoweModel.xB,
                                state.saveList[index].wciecieKatoweModel.xB,
                                'X',
                                'Y'),
                            rowbuilder(
                                'Kąty alfa i beta',
                                state.saveList[index].wciecieKatoweModel
                                    .alfaAngle,
                                state.saveList[index].wciecieKatoweModel
                                    .betaAngle,
                                'g',
                                'g'),
                            rowbuilder(
                                'Wyniki',
                                state.saveList[index].wciecieKatoweModel.xp,
                                state.saveList[index].wciecieKatoweModel.yp,
                                'X',
                                'Y'),
                            rowbuilder(
                                'Kąt gamma i kontrola',
                                state.saveList[index].wciecieKatoweModel
                                    .gammaAngle,
                                state.saveList[index].wciecieKatoweModel
                                    .controlGammaAngle,
                                'g',
                                'g'),
                          ]),
                    ),
                  ),
                ),
              );
            },
          );
        } else if (state is HistoryWciecieKatoweGetError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(state.error),
              ElevatedButton(
                  onPressed: () {
                    context.read<HistoryWciecieKatoweCubit>().resetState();
                  },
                  child: const Text('Spróbuj ponownie'))
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
      }),
    );
  }

  Row rowbuilder(
      String name, double? item1, double? item2, String item3, String item4) {
    return Row(
      children: [
        Expanded(flex: 4, child: Text(name)),
        Expanded(flex: 3, child: Text("$item1 $item3")),
        Expanded(flex: 3, child: Text("$item2 $item4")),
      ],
    );
  }
}
