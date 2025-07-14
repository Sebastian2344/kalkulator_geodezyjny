import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/biegunowa/cubit/history_biegunowa_cubit.dart';
import '../../../nav/go_router.dart';
import '../../cubit/biegunowa_cubit.dart';
import '../widgets/initial_state_biegunowa_view.dart';
import '../widgets/succesful_state.dart';
import '../widgets/wonderful_textfield.dart';

class MetodaBiegunowa extends StatelessWidget {
   const MetodaBiegunowa({super.key});
                
  @override
  Widget build(BuildContext context) {
    final biegunowaState = context.read<BiegunowaCubit>();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.read<BiegunowaCubit>().resetState();
              Navigation.router.pushReplacement('/');
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green[900],
        title: const Text(
          'Metoda Biegunowa',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
        actions: [
          BlocBuilder<BiegunowaCubit, BiegunowaState>(
            builder: (context, state) => IconButton(
              icon: const Icon(
                Icons.save,
                color: Colors.white,
              ),
              onPressed: () async {
                final save = context.read<HistoryBiegunowaCubit>();

                if (state is BiegunowaSuccesful) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Nazwij zapis'),
                        content: TextField(
                          controller: biegunowaState.getController7(),
                        ),
                        actions: [
                          Center(
                            child: ElevatedButton(
                                onPressed: () async {
                                  if (biegunowaState.getController7().text != '') {
                                    await save.openDB();
                                    await save.saveToDb(
                                        biegunowaState.getController7().text,
                                        state.dane,
                                        state.azymut,
                                        state.przyrosty,
                                        state.wynik);
                                    await save.getData();
                                  }
                                },
                                child: const Text("Zapisz")),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Cofnij")),
                              ElevatedButton(
                                  onPressed: () async {
                                    Navigator.of(context).pop();
                                    await save.openDB();
                                    await save.getData();
                                    Navigation.router
                                        .pushReplacement('/history_biegunowa');
                                  },
                                  child: const Text("Do Zapisów")),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Wybór'),
                        content: const Text(
                            'Jeżeli chcesz przejść do zapisów kliknij przycisk "Do zapisów". Jeżeli chcesz zrobić zapis to kliknij "Powrót" następnie "oblicz" i na końcu wciśnij ikonę dyskietki.'),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Powrót')),
                          ElevatedButton(
                              onPressed: () async {
                                await save.openDB();
                                await save.getData();
                                Navigation.router
                                    .pushReplacement('/history_biegunowa');
                              },
                              child: const Text('Do zapisów'))
                        ],
                      );
                    },
                  );
                }
              },
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 115, 120, 115),
          height: height - kToolbarHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WonderfulTextField(
                    label: 'Współrzędna stanowiska X',
                    controller: biegunowaState.getController(),
                  ),
                  WonderfulTextField(
                    label: 'Współrzędna stanowiska Y',
                    controller: biegunowaState.getController2(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WonderfulTextField(
                    label: 'Współrzędna nawiązania X',
                    controller: biegunowaState.getController3(),
                  ),
                  WonderfulTextField(
                    label: 'Współrzędna nawiązania Y',
                    controller: biegunowaState.getController4(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  WonderfulTextField(
                    label: 'Kierunek od boku nawiązana',
                    controller: biegunowaState.getController5(),
                  ),
                  WonderfulTextField(
                    label: 'Odległość',
                    controller: biegunowaState.getController6(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [FilledButton(
                    style: FilledButton.styleFrom(
                        fixedSize: Size(width / 3, height / 12)),
                    onPressed: () {
                      context.read<BiegunowaCubit>().wynikbiegunowej(
                          biegunowaState.getController().text,
                          biegunowaState.getController2().text,
                          biegunowaState.getController3().text,
                          biegunowaState.getController4().text,
                          biegunowaState.getController5().text,
                          biegunowaState.getController6().text);
                    },
                    child: const Text('Oblicz')),
                  FilledButton(
                    style: FilledButton.styleFrom(
                        fixedSize: Size(width / 3, height / 12)),
                    onPressed: () {
                      context.read<BiegunowaCubit>().resetState();
                    },
                    child: const Text('Reset'))
                    ],
              ),
              SizedBox(
                height: height / 6,
                child: BlocBuilder<BiegunowaCubit, BiegunowaState>(
                  builder: (context, state) {
                    if (state is BiegunowaSuccesful) {
                      return SuccesfulStateBiegunowaView(
                        azymut: state.azymut,
                        wynik: state.wynik,
                        przyrosty: state.przyrosty,
                        width: width,
                      );
                    }
                    if (state is BiegunowaError) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: SizedBox(
                            width: width * 0.8,
                            child: Text('Wynik: ${state.error}',
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 255, 167, 3)))),
                      );
                    }
                    return InitialStateBiegunowaView(width: width);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}