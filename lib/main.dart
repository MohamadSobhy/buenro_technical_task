import 'package:buenro_technical_task/app_module.dart';
import 'package:buenro_technical_task/app_widget.dart';
import 'package:buenro_technical_task/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'core/api/remote_api_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  /// initialize service locator
  await initServiceLocator();

  // To load the .env file contents into dotenv.
  // NOTE: fileName defaults to .env and can be omitted in this case.
  // Ensure that the filename corresponds to the path in step 1 and 2.
  await dotenv.load(fileName: "assets/.env");

  /// Init App Colors and Styles
  AppModule.I
    ..useMaterial3 = true
    // Set the default Font Family for the app
    ..defaultFontFamily = 'Poppins'
    // Set the secondary Font Family for the app
    ..secondaryFontFamily = 'Poppins';

  // TODO: In case you need to change the app colors and styles, Do it like that and then refresh the state
  // ..setAppColors(MobileAppColors.instance)
  // ..setAppStyles(MobileAppStyles.instance)
  // ..setAppShadows(MobileAppShadows.instance)
  // ..setAppBorders(MobileAppBorders.instance);

  Provider.debugCheckInvalidValueType = null;

  /// Setup Remote Data Service and add the API Key
  RemoteApiService.api.init();
  RemoteApiService.api.token = dotenv.get('API_KEY', fallback: '');

  runApp(const BuenroTechnicalTaskApp());
}
