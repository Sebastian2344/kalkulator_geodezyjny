import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/biegunowa/ui/screen/biegunowa_history.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_katowe/ui/wciecie_katowe_save_screen.dart';
import 'package:kalkulator_geodezyjny_new_version/modules/wciecie_liniowe/ui/wciecie_liniowe_history.dart';

import '../biegunowa/ui/screen/biegunowa_ui.dart';
import '../ortogonalna/ui/screen/ortogonalna.dart';
import '../ortogonalna/ui/screen/ortogonalna_history.dart';
import '../wciecie_katowe/ui/wciecie_katowe.dart';
import '../wciecie_liniowe/ui/wciecie_liniowe.dart';
import '../menu/menu.dart';

class Navigation{
  static final GoRouter router = GoRouter(
   routes:<RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MainMenu();}),
    GoRoute(path: '/biegunowa',builder: (context, state) {
      return const MetodaBiegunowa();}),
    GoRoute(path: '/ortogonalna',builder: (context, state) {
      return const MetodaOrtogonalna();}),
    GoRoute(path: '/kat',builder: (context, state) {
      return const WciecieKatowe();}),
    GoRoute(path: '/linia',builder: (context, state) {
      return const WciecieLiniowe();}),
    GoRoute(path: '/history_biegunowa',builder: (context, state) {
      return const BiegunowaHistory();}),
    GoRoute(path: '/history_ortogonalna',builder: (context, state) {
      return const OrtogonalnaHistory();}),
    GoRoute(path: '/history_katowe',builder: (context, state) {
      return const WciecieKatoweHistory();}),
      GoRoute(path: '/history_liniowe',builder: (context, state) {
        return const WciecieLinioweHistory();
      },)
   ],
  );
}