import 'dart:convert';

import 'package:buenro_technical_task/app_module.dart';
import 'package:buenro_technical_task/core/constants/constant_keys.dart';
import 'package:buenro_technical_task/core/errors/failures.dart';
import 'package:buenro_technical_task/core/localization/localization_controller.dart';
import 'package:buenro_technical_task/core/theme/app_dimensions.dart';
import 'package:buenro_technical_task/core/theme/providers/app_themes_provider.dart';
import 'package:buenro_technical_task/core/theme/themes.dart';
import 'package:buenro_technical_task/core/usecase/usecase.dart';
import 'package:buenro_technical_task/core/widgets/app_toast/app_toast.dart';
import 'package:buenro_technical_task/core/widgets/app_toast/app_toast_view.dart';
import 'package:buenro_technical_task/features/hotels/data/models/search_data_model.dart';
import 'package:buenro_technical_task/features/hotels/domain/usecases/fetch_latest_searches_info.dart';
import 'package:buenro_technical_task/features/hotels/presentation/blocs/latest_searches_bloc/latest_searches_bloc.dart';
import 'package:buenro_technical_task/features/hotels/presentation/pages/hotels_page.dart';
import 'package:buenro_technical_task/features/hotels/presentation/pages/search_hotels_page.dart';
import 'package:buenro_technical_task/features/hotels/presentation/widgets/latest_search_item_view.dart';
import 'package:buenro_technical_task/generated/l10n.dart';
import 'package:buenro_technical_task/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';

// Mocks
class MockFetchLatestSearchesInfo extends Mock
    implements FetchLatestSearchesInfo {}

// Fakes
class FakeNoParams extends Fake implements NoParams {}

void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();

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

  Provider.debugCheckInvalidValueType = null;

  // Setup
  late MockFetchLatestSearchesInfo mockFetchLatestSearchesInfo;
  late LatestSearchesBloc bloc;

  setUp(() {
    mockFetchLatestSearchesInfo = MockFetchLatestSearchesInfo();
    bloc = LatestSearchesBloc(
      fetchLatestSearchesInfo: mockFetchLatestSearchesInfo,
    );

    registerFallbackValue(FakeNoParams());
  });

  // Arrangements

  final tSearchesJson = [
    {
      "query": "Cairo",
      "checkInDate": "2025-07-12",
      "checkOutDate": "2025-07-19",
      "numberOfAdults": 1,
    },
  ];
  final tLatestSearches = tSearchesJson
      .map((e) => SearchDataModel.fromJson(e))
      .toList();

  void arrangeMockFetchLatestSearchesInfoToReturnEmptySuccessResponse() {
    when(
      () => mockFetchLatestSearchesInfo(any<NoParams>()),
    ).thenAnswer((_) async => Right([]));
  }

  void arrangeMockFetchLatestSearchesInfoToReturnResultSuccessResponse() {
    when(
      () => mockFetchLatestSearchesInfo(any<NoParams>()),
    ).thenAnswer((_) async => Right(tLatestSearches));
  }

  void arrangeMockFetchLatestSearchesInfoToReturnFailureResponse(
    Failure failure,
  ) {
    when(
      () => mockFetchLatestSearchesInfo(any<NoParams>()),
    ).thenAnswer((_) async => Left(failure));
  }

  /// CREATE createWidgetUnderTest() method to prepare the widget for test.
  Widget createWidgetUnderTest() {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) {
            bloc.add(FetchedLatestSearchesEvent());
            return bloc;
          },
        ),
      ],
      child: ChangeNotifierProvider.value(
        value: servLocator<LocalizationController>(),
        child: AppThemesProvider(
          scaffoldTheme: AppScaffoldTheme(
            backgroundGradientOpacity: 1,
            backgroundColor: AppModule.I.appColors.canvasColor,
          ),
          actionButtonTheme: AppModule.I.appStyles.defaultActionButtonTheme
              .copyWith(
                enableGradient: true,
                textStyle: AppModule.I.appStyles.text3(),
                borderRadius: BorderRadius.circular(
                  AppDimensions.defaultRadius,
                ),
                borderColor: AppModule.I.appColors.primaryColor,
                disabledColor: AppModule.I.appColors.primaryColor.withOpacity(
                  0.3,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: kIsWeb
                      ? AppDimensions.dimen_22
                      : AppDimensions.dimen_16,
                ),
              ),
          textFieldTheme: AppModule.I.appStyles.defaultFieldsTheme.copyWidth(
            fillColor: AppModule.I.appColors.darkCanvasColor,
          ),
          child: Consumer<LocalizationController>(
            builder: (ctx, provider, _) {
              return Directionality(
                textDirection: TextDirection.ltr,
                child: Stack(
                  children: [
                    MaterialApp(
                      title: 'Buenro Technical Task',
                      debugShowCheckedModeBanner: false,
                      theme: AppModule.I.defaultTheme,
                      localizationsDelegates: const [
                        S.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                        GlobalCupertinoLocalizations.delegate,
                      ],
                      supportedLocales: S.delegate.supportedLocales,
                      locale: const Locale('en', ''),
                      scaffoldMessengerKey: AppModule.I.scaffoldMessengerKey,
                      home: SearchHotelsPage(),
                    ),
                    StreamBuilder<AppToastData>(
                      stream: AppModule.I.toastController.stream,
                      builder: (context, snapshot) {
                        return snapshot.data?.message != null &&
                                snapshot.data!.message.trim().isNotEmpty
                            ? Positioned(
                                key: UniqueKey(),
                                bottom:
                                    defaultTargetPlatform == TargetPlatform.iOS
                                    ? 40
                                    : 20,
                                left: 0,
                                right: 0,
                                child: SafeArea(
                                  child: AppToastView(toast: snapshot.data!),
                                ),
                              )
                            : const SizedBox();
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // Test cases
  group('SearchHotelsPage', () {
    testWidgets(
      'initial state should be showing an the Search and other required fields',
      (WidgetTester tester) async {
        // arrrange
        arrangeMockFetchLatestSearchesInfoToReturnEmptySuccessResponse();
        await tester.pumpWidget(createWidgetUnderTest());

        // act
        await tester.pumpAndSettle();

        // assert
        expect(find.byKey(ConstantKeys.kQuerySearchFieldKey), findsOneWidget);
        expect(find.byKey(ConstantKeys.kCheckInDateKey), findsOneWidget);
        expect(find.byKey(ConstantKeys.kCheckOutDateKey), findsOneWidget);
        expect(
          find.byKey(ConstantKeys.kNumberOfAdultsFieldKey),
          findsOneWidget,
        );
        expect(find.byKey(ConstantKeys.kShowAdsSwitchKey), findsOneWidget);
        expect(find.byKey(ConstantKeys.kSearchBtnKey), findsOneWidget);
      },
    );
    testWidgets(
      'should show missing field error message when ant of the is fields is empty',
      (WidgetTester tester) async {
        // arrrange
        arrangeMockFetchLatestSearchesInfoToReturnEmptySuccessResponse();
        await tester.pumpWidget(createWidgetUnderTest());
        final searchBtn = find.byKey(ConstantKeys.kSearchBtnKey);

        // act
        await tester.pumpAndSettle();
        await tester.tap(searchBtn);
        await tester.pumpAndSettle();

        // assert
        expect(find.byType(AppToastView), findsOneWidget);
      },
    );
    testWidgets(
      'should show latest search result under the search form when there is previous search result',
      (WidgetTester tester) async {
        // arrange
        arrangeMockFetchLatestSearchesInfoToReturnResultSuccessResponse();
        await tester.pumpWidget(createWidgetUnderTest());

        final searchDataView = find.byType(LatestSearchItemView);

        await tester.runAsync(() async {
          // act
          await tester.pumpAndSettle();
          await tester.pump(Duration(seconds: 2));

          // assert
          expect(searchDataView, findsOneWidget);
        });
      },
    );

    testWidgets('should not AppToastView error when all fields are filled', (
      WidgetTester tester,
    ) async {
      // arrange
      arrangeMockFetchLatestSearchesInfoToReturnEmptySuccessResponse();
      await tester.pumpWidget(createWidgetUnderTest());
      final searchField = find.byKey(ConstantKeys.kQuerySearchFieldKey);
      final checkInDateField = find.byKey(ConstantKeys.kCheckInDateKey);
      final checkOutDateField = find.byKey(ConstantKeys.kCheckOutDateKey);
      final searchBtn = find.byKey(ConstantKeys.kSearchBtnKey);

      // act
      await tester.enterText(searchField, 'Cairo');
      await tester.tap(checkInDateField);
      await tester.pumpAndSettle();
      await tester.tap(find.text('12'));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();
      await tester.tap(checkOutDateField);
      await tester.pumpAndSettle();
      await tester.tap(find.text('19'));
      await tester.tap(find.text('OK'));
      await tester.pumpAndSettle();

      await tester.tap(searchBtn);

      await tester.pumpAndSettle();

      // assert
      expect(find.byType(AppToastView), findsNothing);
    });

    // testWidgets('should show absences list when data is available', (
    //   WidgetTester tester,
    // ) async {
    //   // arrange
    //   arrangeMockFetchLatestSearchesInfoToReturnResultSuccessResponse();
    //   await tester.pumpWidget(createWidgetUnderTest());

    //   await tester.runAsync(() async {
    //     // act
    //     bloc.add(FetchLatestSearchesInfoEvent());

    //     await Future.delayed(const Duration(milliseconds: 2));
    //     await tester.pump();
    //     await tester.pump(Duration(seconds: 2));

    //     // assert
    //     expect(find.byKey(ConstantKeys.kAbsencesListView), findsOneWidget);
    //   });
    // });
  });
}
