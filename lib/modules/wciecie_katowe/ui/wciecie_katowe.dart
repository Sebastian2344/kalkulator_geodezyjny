import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../nav/go_router.dart';
import '../cubit/wciecie_katowe_cubit.dart';
import 'save_alert_dailog_wk.dart';

class WciecieKatowe extends StatefulWidget {
  const WciecieKatowe({super.key});

  @override
  State<WciecieKatowe> createState() => _WciecieKatoweState();
}

class _WciecieKatoweState extends State<WciecieKatowe> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();
  TextEditingController controller6 = TextEditingController();
  TextEditingController controller7 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 4, 127, 242),
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 35, 49, 62),
        leading: IconButton(
          onPressed: () {
            context.read<WciecieKatoweCubit>().resetState();
            Navigation.router.pushReplacement('/');
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Wcięcie Kątowe'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          SaveAlertDialogWK(controller7: controller7)
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - kToolbarHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildColumnForData(controller, "Stanowisko A X"),
                  _buildColumnForData(controller2, "Stanowisko A Y")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildColumnForData(controller3, "Stanowisko B X"),
                  _buildColumnForData(controller4, "Stanowisko B Y")
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildColumnForData(controller5, "Kąt alfa"),
                  _buildColumnForData(controller6, "Kąt beta")
                ],
              ),
              FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 35, 49, 62),
                    foregroundColor: Colors.white,
                    fixedSize: Size(MediaQuery.of(context).size.width / 3,
                        MediaQuery.of(context).size.height / 12),
                  ),
                  onPressed: () {
                    context.read<WciecieKatoweCubit>().oblicz(
                        controller.text,
                        controller2.text,
                        controller3.text,
                        controller4.text,
                        controller5.text,
                        controller6.text);
                  },
                  child: const Text('Oblicz')),
              BlocBuilder<WciecieKatoweCubit, WciecieKatoweState>(
                builder: (context, state) {
                  if (state is WciecieKatoweError) {
                    return  const Center(child:Text('Podałeś złe dane w polach. Upewnij się że to są liczby następnie kliknij oblicz.',style: TextStyle(fontSize: 16,color: Colors.white),));
                  } else if (state is WciecieKatoweSuccesful) {
                    return Table(
                      columnWidths: const {
                        0: FlexColumnWidth(4),
                        1: FlexColumnWidth(5),
                        2: FlexColumnWidth(5), 
                      },
                      children: [
                        _buildTableRow([
                          "Współżędne:",
                          state.wciecieKatoweModel.xp,
                          state.wciecieKatoweModel.yp
                        ]),
                        _buildTableRow([
                          "Kąt i kontrola:",
                          state.wciecieKatoweModel.gammaAngle,
                          state.wciecieKatoweModel.controlGammaAngle
                        ])
                      ],
                    );
                  } else {
                    return Table( columnWidths: const {
                        0: FlexColumnWidth(4),
                        1: FlexColumnWidth(5),
                        2: FlexColumnWidth(5), 
                      },children: [
                      _buildTableRow(["Współżędne:", "", ""]),
                      _buildTableRow(["Kąt i kontrola:", "", ""])
                    ]);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  TableRow _buildTableRow(List values) {
    Color backgroundColor = const Color.fromARGB(255, 35, 49, 62);
    Color textColor = Colors.white; 
    return TableRow(
      children: values
          .map((value) => TableCell(
                child: Container(
                  height: MediaQuery.of(context).size.height / 12,
                  decoration: BoxDecoration(
                      border: Border.all(width: 2), color: backgroundColor),
                  alignment: Alignment.center,
                  child: Text(
                    '$value',
                    style: TextStyle(color: textColor, fontSize: 16),
                  ),
                ),
              ))
          .toList(),
    );
  }

  Column _buildColumnForData(TextEditingController controller, String label) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.only(bottom: 8),
            height: MediaQuery.of(context).size.height / 12,
            width: MediaQuery.of(context).size.width / 3,
            alignment: Alignment.bottomCenter,
            child: Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            )),
        Container(
            height: MediaQuery.of(context).size.height / 12,
            width: MediaQuery.of(context).size.width / 3,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 35, 49, 62),
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(12)),
            child: TextField(
                style: const TextStyle(color: Colors.white),
                cursorColor: Colors.black,
                controller: controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: 'Podaj dane',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(130, 255, 255, 255)),
                  border: InputBorder.none,
                )))
      ],
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
