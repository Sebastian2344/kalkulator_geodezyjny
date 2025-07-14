import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/cubit/save_wcecie_katowe_cubit.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/cubit/wciecie_katowe_cubit.dart';

import '../../nav/go_router.dart';

class SaveAlertDialogWK extends StatelessWidget {
  const SaveAlertDialogWK({super.key, required this.controller7});
  final TextEditingController controller7;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WciecieKatoweCubit, WciecieKatoweState>(
      builder: (context, state) => IconButton(
        icon: const Icon(Icons.save),
        onPressed: () async {
          final save = context.read<HistoryWciecieKatoweCubit>();
          if (state is WciecieKatoweSuccesful) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Nazwij zapis'),
                  content: TextField(
                    controller: controller7,
                  ),
                  actions: [
                    Center(
                      child: ElevatedButton(
                          onPressed: () async {
                            if (controller7.text != '') {
                              await save.openDB();
                              await save.saveData(
                                  state.wciecieKatoweModel, controller7.text);
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
                                  .pushReplacement('/history_katowe');
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
                        }, child: const Text('Powrót')),
                    ElevatedButton(
                        onPressed: () async {
                          await save.openDB();
                          await save.getData();
                          Navigation.router.pushReplacement('/history_katowe');
                        },
                        child: const Text('Do zapisów'))
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
