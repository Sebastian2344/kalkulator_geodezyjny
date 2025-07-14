import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/ortogonalna/ui/widgets/save_alert_dialog.dart';

import '../../../nav/go_router.dart';
import '../../cubit/ortogonalna_cubit.dart';
import '../widgets/beauty_textfield.dart';
import '../widgets/initial_state_ortogonalna_view.dart';
import '../widgets/succesful_state.dart';

class MetodaOrtogonalna extends StatefulWidget {
  const MetodaOrtogonalna({super.key});

  @override
  State<MetodaOrtogonalna> createState() => _MetodaOrtogonalnaState();
}

class _MetodaOrtogonalnaState extends State<MetodaOrtogonalna> {
  TextEditingController controller = TextEditingController(); //s
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController(); //n
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController(); //az
  TextEditingController controller6 = TextEditingController(); //odl
  TextEditingController controller7 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.read<OrtogonalnaCubit>().resetState();
              Navigation.router.pushReplacement('/');
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.brown[900],
        title: const Text(
          'Metoda Ortogonalna',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
        actions: [
          SaveAlertDialogO(controller7: controller7)
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color.fromARGB(255, 45, 46, 45),
          height: height - kToolbarHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BeautyTextField(
                    label: 'Współrzędna stanowiska X',
                    controller: controller,
                  ),
                  BeautyTextField(
                    label: 'Współrzędna stanowiska Y',
                    controller: controller2,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BeautyTextField(
                    label: 'Współrzędna nawiązania X',
                    controller: controller3,
                  ),
                  BeautyTextField(
                    label: 'Współrzędna nawiązania Y',
                    controller: controller4,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BeautyTextField(
                    label: 'Bierząca',
                    controller: controller5,
                  ),
                  BeautyTextField(
                    label: 'Domiar',
                    controller: controller6,
                  ),
                ],
              ),
              FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.brown[900],
                    fixedSize: Size(width / 3, height / 12),
                  ),
                  onPressed: () {
                    context.read<OrtogonalnaCubit>().wynikOrtogonalnej(
                        controller.text,
                        controller2.text,
                        controller3.text,
                        controller4.text,
                        controller5.text,
                        controller6.text);
                  },
                  child: const Text('Oblicz')),
              SizedBox(
                height: height / 6,
                child: BlocBuilder<OrtogonalnaCubit, OrtogonalnaState>(
                  builder: (context, state) {
                    if (state is OrtogonalnaSuccesful) {
                      return SuccesfulStateOrtogonalnaView(
                        wynik: state.wynik,
                        przyrosty: state.przyrosty,
                        width: width,
                      );
                    }
                    if (state is OrtogonalnaError) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20, top: 20),
                        child: SizedBox(
                          width: width * 0.8,
                          child: Text(
                            'Wynik: ${state.error}',
                            style: TextStyle(
                                fontSize: 16, color: Colors.orange[900]),
                          ),
                        ),
                      );
                    }
                    return InitialStateOrtogonalnaView(width: width);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    controller6.dispose();
    controller7.dispose();
    super.dispose();
  }
}