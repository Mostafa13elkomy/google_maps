import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps/constants/my_strings.dart';
import 'package:google_maps/data/repos/maps_repo.dart';
import 'package:google_maps/data/web_services/places_web_services.dart';
import 'package:google_maps/features/map_screen/manager/cubit/maps_cubit.dart';
import 'package:google_maps/features/map_screen/views/map_screen_view.dart';
import 'package:google_maps/features/otp_screen/manager/cubit/phone_auth_cubit.dart';
import 'package:google_maps/features/otp_screen/views/otp_screen_view.dart';
import '../features/login_screen/views/login_screen_view.dart';

class AppRouter {
  PhoneAuthCubit? phoneAuthCubit;
  AppRouter() {
    phoneAuthCubit = PhoneAuthCubit();
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case mapScreen:
        return MaterialPageRoute(
          builder: (_) =>  BlocProvider(
            create: (BuildContext context) =>
          MapsCubit(MapsRepos(PlacesWebServices(),),),
          child: MapScreen(),
            ),
        );

      case loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: LoginScreen(),
          ),
        );

          case otpScreen:
        final phoneNumber = settings.arguments;
        return MaterialPageRoute(
          builder: (_) => BlocProvider<PhoneAuthCubit>.value(
            value: phoneAuthCubit!,
            child: OtpScreen(phoneNumber: phoneNumber),
          ),
        );
    }
    return null;
  }
}
