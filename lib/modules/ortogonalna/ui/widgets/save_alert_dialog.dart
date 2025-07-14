import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../nav/go_router.dart';
import '../../cubit/history_ortogonalna_cubit.dart';
import '../../cubit/ortogonalna_cubit.dart';

class SaveAlertDialogO extends StatelessWidget {
  const SaveAlertDialogO({super.key, required this.controller7});
  final TextEditingController controller7;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrtogonalnaCubit, OrtogonalnaState>(
      builder: (context, state) => IconButton(
        icon: const Icon(Icons.save),
        onPressed: () async {
          final save = context.read<HistoryOrtogonalnaCubit>();
          if (state is OrtogonalnaSuccesful) {
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
                              await save.saveToDb(controller7.text, state.dane,
                                  state.azymut, state.przyrosty, state.wynik);
                              await save.getFromDb();
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
                              await save.getFromDb();
                              Navigation.router
                                  .pushReplacement('/history_ortogonalna');
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
                          await save.getFromDb();
                          Navigation.router
                              .pushReplacement('/history_ortogonalna');
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