import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../nav/go_router.dart';
import '../cubit/crud_wciecie_liniowe_cubit.dart';
import '../cubit/wciecie_liniowe_cubit.dart';

class WciecieLinioweHistory extends StatelessWidget {
  const WciecieLinioweHistory({super.key});

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
                context.read<WciecieLinioweCubit>().resetState();
                await context.read<CrudWciecieLinioweCubit>().closeDB();
                Navigation.router.pushReplacement('/linia');
              },
              icon: const Icon(Icons.arrow_back))
        ],
      ),
      body: BlocBuilder<CrudWciecieLinioweCubit, CrudWciecieLinioweState>(
          builder: (context, state) {
        if (state is CrudWciecieLinioweGetSuccessful) {
          return ListView.builder(
            itemCount: state.wciecieLinioweSaveList.length,
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
                        .read<CrudWciecieLinioweCubit>()
                        .deleteData(state.wciecieLinioweSaveList[index].id);
                  },
                  direction: DismissDirection.endToStart,
                  child: ListTile(
                    subtitleTextStyle: const TextStyle(fontSize: 16),
                    textColor: Colors.white,
                    titleTextStyle: const TextStyle(fontSize: 20),
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        state.wciecieLinioweSaveList[index].name,
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
                                state.wciecieLinioweSaveList[index].wciecieLinioweModel.xA,
                                state.wciecieLinioweSaveList[index].wciecieLinioweModel.yA,
                                'X',
                                'Y'),
                            rowbuilder(
                                'Stanowisko B',
                                state.wciecieLinioweSaveList[index].wciecieLinioweModel.xB,
                                state.wciecieLinioweSaveList[index].wciecieLinioweModel.xB,
                                'X',
                                'Y'),
                            rowbuilder(
                                'odległoci AP i BP',
                                state.wciecieLinioweSaveList[index].wciecieLinioweModel
                                    .ap,
                                state.wciecieLinioweSaveList[index].wciecieLinioweModel
                                    .bp,
                                'g',
                                'g'),
                            rowbuilder(
                                'Wyniki',
                                state.wciecieLinioweSaveList[index].wciecieLinioweModel.xP,
                                state.wciecieLinioweSaveList[index].wciecieLinioweModel.yP,
                                'X',
                                'Y'),
                            rowbuilder(
                                '4P i  Ca',
                                state.wciecieLinioweSaveList[index].wciecieLinioweModel.px4,
                                state.wciecieLinioweSaveList[index].wciecieLinioweModel.cA,
                                ' ',
                                ' '),
                            rowbuilder(
                                'Cb i  Cc',
                                state.wciecieLinioweSaveList[index].wciecieLinioweModel.cB,
                                state.wciecieLinioweSaveList[index].wciecieLinioweModel.cC,
                                ' ',
                                ' '),
                          ]),
                    ),
                  ),
                ),
              );
            },
          );
        } else if (state is CrudWciecieLinioweGetError) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(state.error),
              ElevatedButton(
                  onPressed: () {
                    context.read<CrudWciecieLinioweCubit>().resetState();
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