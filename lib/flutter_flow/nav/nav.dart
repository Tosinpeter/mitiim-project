import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';

import '/auth/base_auth_user_provider.dart';

import '/backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;
import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? const NavBarPage() : const WelcomeWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? const NavBarPage() : const WelcomeWidget(),
        ),
        FFRoute(
          name: 'Account',
          path: '/Account',
          asyncParams: {
            'publishDoc': getDoc(['publish'], PublishRecord.fromSnapshot),
          },
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'Account')
              : AccountWidget(
                  publishDoc: params.getParam(
                    'publishDoc',
                    ParamType.Document,
                  ),
                ),
        ),
        FFRoute(
          name: 'Auth_forgotPassword',
          path: '/authForgotPassword',
          builder: (context, params) => const AuthForgotPasswordWidget(),
        ),
        FFRoute(
          name: 'Create_account',
          path: '/CreateAccount',
          builder: (context, params) => const CreateAccountWidget(),
        ),
        FFRoute(
          name: 'How_provider',
          path: '/How_provider',
          builder: (context, params) => const HowProviderWidget(),
        ),
        FFRoute(
          name: 'How_client',
          path: '/How_client',
          builder: (context, params) => const HowClientWidget(),
        ),
        FFRoute(
          name: 'Congrulations',
          path: '/Congrulations',
          builder: (context, params) => const CongrulationsWidget(),
        ),
        FFRoute(
          name: 'client_date_select',
          path: '/Publish_constructionDate',
          asyncParams: {
            'publishDoc': getDoc(['publish'], PublishRecord.fromSnapshot),
          },
          builder: (context, params) => ClientDateSelectWidget(
            publishDoc: params.getParam(
              'publishDoc',
              ParamType.Document,
            ),
            categoryName: params.getParam(
              'categoryName',
              ParamType.String,
            ),
            categoryImage: params.getParam(
              'categoryImage',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'client_catering',
          path: '/Publish_restauration',
          asyncParams: {
            'publishDoc': getDoc(['publish'], PublishRecord.fromSnapshot),
          },
          builder: (context, params) => ClientCateringWidget(
            publishDoc: params.getParam(
              'publishDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'client_beauty',
          path: '/Publish_Beauty',
          asyncParams: {
            'publishDoc': getDoc(['publish'], PublishRecord.fromSnapshot),
          },
          builder: (context, params) => ClientBeautyWidget(
            publishDoc: params.getParam(
              'publishDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'client_homehelp',
          path: '/Publish_homeHelp',
          asyncParams: {
            'publishDoc': getDoc(['publish'], PublishRecord.fromSnapshot),
          },
          builder: (context, params) => ClientHomehelpWidget(
            publishDoc: params.getParam(
              'publishDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'client_it_service',
          path: '/Publish_sav',
          asyncParams: {
            'publishDoc': getDoc(['publish'], PublishRecord.fromSnapshot),
          },
          builder: (context, params) => ClientItServiceWidget(
            publishDoc: params.getParam(
              'publishDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'client_lesson',
          path: '/Publish_lesson',
          asyncParams: {
            'publishDoc': getDoc(['publish'], PublishRecord.fromSnapshot),
          },
          builder: (context, params) => ClientLessonWidget(
            publishDoc: params.getParam(
              'publishDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'client_admin',
          path: '/Publish_admin',
          asyncParams: {
            'publishDoc': getDoc(['publish'], PublishRecord.fromSnapshot),
          },
          builder: (context, params) => ClientAdminWidget(
            publishDoc: params.getParam(
              'publishDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'client_demenagement',
          path: '/Publish_demenagement',
          asyncParams: {
            'publishDoc': getDoc(['publish'], PublishRecord.fromSnapshot),
          },
          builder: (context, params) => ClientDemenagementWidget(
            publishDoc: params.getParam(
              'publishDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'client_auto',
          path: '/Publish_auto',
          asyncParams: {
            'publishDoc': getDoc(['publish'], PublishRecord.fromSnapshot),
          },
          builder: (context, params) => ClientAutoWidget(
            publishDoc: params.getParam(
              'publishDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'client_construction',
          path: '/Publish_construction',
          asyncParams: {
            'publishDoc': getDoc(['publish'], PublishRecord.fromSnapshot),
          },
          builder: (context, params) => ClientConstructionWidget(
            publishDoc: params.getParam(
              'publishDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'client_address',
          path: '/Publish_constructionLieu',
          asyncParams: {
            'publishDoc': getDoc(['publish'], PublishRecord.fromSnapshot),
          },
          builder: (context, params) => ClientAddressWidget(
            publishDoc: params.getParam(
              'publishDoc',
              ParamType.Document,
            ),
            categoryName: params.getParam(
              'categoryName',
              ParamType.String,
            ),
            categoryImage: params.getParam(
              'categoryImage',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Paiement_client',
          path: '/Paiement_client',
          builder: (context, params) => const PaiementClientWidget(),
        ),
        FFRoute(
          name: 'RequestValid',
          path: '/RequestValid',
          builder: (context, params) => const RequestValidWidget(),
        ),
        FFRoute(
          name: 'Notifications',
          path: '/notifications',
          builder: (context, params) => const NotificationsWidget(),
        ),
        FFRoute(
          name: 'Favoris',
          path: '/Favoris',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'Favoris')
              : const FavorisWidget(),
        ),
        FFRoute(
          name: 'Create_photo',
          path: '/Create_photo',
          builder: (context, params) => const CreatePhotoWidget(),
        ),
        FFRoute(
          name: 'Chat',
          path: '/Messages_list',
          builder: (context, params) =>
              params.isEmpty ? const NavBarPage(initialPage: 'Chat') : const ChatWidget(),
        ),
        FFRoute(
          name: 'Filters',
          path: '/Filters',
          builder: (context, params) => const FiltersWidget(),
        ),
        FFRoute(
          name: 'PublishCategorie',
          path: '/PublisCategorie',
          builder: (context, params) => params.isEmpty
              ? const NavBarPage(initialPage: 'PublishCategorie')
              : const PublishCategorieWidget(),
        ),
        FFRoute(
          name: 'Payment_presta',
          path: '/Paiement_presta',
          builder: (context, params) => const PaymentPrestaWidget(),
        ),
        FFRoute(
          name: 'Profil_client',
          path: '/Profil_client',
          builder: (context, params) => const ProfilClientWidget(),
        ),
        FFRoute(
          name: 'conversation',
          path: '/MessageProfil',
          asyncParams: {
            'chatDoc': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => ConversationWidget(
            chatDoc: params.getParam(
              'chatDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'Help',
          path: '/Help',
          builder: (context, params) => const HelpWidget(),
        ),
        FFRoute(
          name: 'HelpYourAccount',
          path: '/HelpYourAccount',
          builder: (context, params) => const HelpYourAccountWidget(),
        ),
        FFRoute(
          name: 'TermsConditions',
          path: '/TermsConditions',
          builder: (context, params) => const TermsConditionsWidget(),
        ),
        FFRoute(
          name: 'Filters_avis_client',
          path: '/Filters_avis_client',
          builder: (context, params) => const FiltersAvisClientWidget(),
        ),
        FFRoute(
          name: 'Filters_categorie_Client',
          path: '/Filters_categorie_Client',
          builder: (context, params) => const FiltersCategorieClientWidget(),
        ),
        FFRoute(
          name: 'Filters_tarif_provider',
          path: '/Filters_tarif_provider',
          builder: (context, params) => const FiltersTarifProviderWidget(),
        ),
        FFRoute(
          name: 'Profil_presta',
          path: '/Profil_presta',
          builder: (context, params) => const ProfilPrestaWidget(),
        ),
        FFRoute(
          name: 'Home',
          path: '/SommaryMaps',
          builder: (context, params) =>
              params.isEmpty ? const NavBarPage(initialPage: 'Home') : const HomeWidget(),
        ),
        FFRoute(
          name: 'Filters_Distance_Client',
          path: '/Filters_Distance_Client',
          builder: (context, params) => const FiltersDistanceClientWidget(),
        ),
        FFRoute(
          name: 'Edit_Profile',
          path: '/EditProfile',
          builder: (context, params) => const EditProfileWidget(),
        ),
        FFRoute(
          name: 'HelpServices',
          path: '/HelpServices',
          builder: (context, params) => const HelpServicesWidget(),
        ),
        FFRoute(
          name: 'HelpAbsence',
          path: '/HelpAbsence',
          builder: (context, params) => const HelpAbsenceWidget(),
        ),
        FFRoute(
          name: 'HelpInformations',
          path: '/HelpInformations',
          builder: (context, params) => const HelpInformationsWidget(),
        ),
        FFRoute(
          name: 'reservationsClient',
          path: '/Publish_reservationsClient',
          asyncParams: {
            'publishDoc': getDoc(['publish'], PublishRecord.fromSnapshot),
          },
          builder: (context, params) => ReservationsClientWidget(
            publishDoc: params.getParam(
              'publishDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'provider_reservations',
          path: '/Publish_reservationsPresta',
          asyncParams: {
            'publishDoc': getDoc(['publish'], PublishRecord.fromSnapshot),
          },
          builder: (context, params) => ProviderReservationsWidget(
            publishDoc: params.getParam(
              'publishDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'provider_admin',
          path: '/Publish_adminPresta',
          asyncParams: {
            'publishDoc': getDoc(['publish'], PublishRecord.fromSnapshot),
          },
          builder: (context, params) => ProviderAdminWidget(
            publishDoc: params.getParam(
              'publishDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'Profil_DemandeAnnonce',
          path: '/Profil_DemandeAnnonce',
          asyncParams: {
            'publishDoc': getDoc(['publish'], PublishRecord.fromSnapshot),
            'userDoc': getDoc(['users'], UsersRecord.fromSnapshot),
          },
          builder: (context, params) => ProfilDemandeAnnonceWidget(
            publishDoc: params.getParam(
              'publishDoc',
              ParamType.Document,
            ),
            userDoc: params.getParam(
              'userDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'Profil_ReponseAnnonce',
          path: '/Profil_ReponseAnnonce',
          asyncParams: {
            'publishDoc': getDoc(['publish'], PublishRecord.fromSnapshot),
            'chatDoc': getDoc(['chats'], ChatsRecord.fromSnapshot),
          },
          builder: (context, params) => ProfilReponseAnnonceWidget(
            publishDoc: params.getParam(
              'publishDoc',
              ParamType.Document,
            ),
            chatDoc: params.getParam(
              'chatDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'provider_beauty',
          path: '/Publish_BeautyProvider',
          asyncParams: {
            'publishDoc': getDoc(['publish'], PublishRecord.fromSnapshot),
          },
          builder: (context, params) => ProviderBeautyWidget(
            publishDoc: params.getParam(
              'publishDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'selectQualification',
          path: '/Publish_constructionProvider',
          asyncParams: {
            'publishDoc': getDoc(['publish'], PublishRecord.fromSnapshot),
          },
          builder: (context, params) => SelectQualificationWidget(
            category: params.getParam(
              'category',
              ParamType.String,
            ),
            image: params.getParam(
              'image',
              ParamType.String,
            ),
            publishDoc: params.getParam(
              'publishDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'provider_auto',
          path: '/Publish_autoProvider',
          asyncParams: {
            'publishDoc': getDoc(['publish'], PublishRecord.fromSnapshot),
          },
          builder: (context, params) => ProviderAutoWidget(
            publishDoc: params.getParam(
              'publishDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'provider_demenagement',
          path: '/Publish_demenagementProvider',
          asyncParams: {
            'publishDoc': getDoc(['publish'], PublishRecord.fromSnapshot),
          },
          builder: (context, params) => ProviderDemenagementWidget(
            publishDoc: params.getParam(
              'publishDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'provider_homehelp',
          path: '/Publish_homeHelpProvider',
          asyncParams: {
            'publishDoc': getDoc(['publish'], PublishRecord.fromSnapshot),
          },
          builder: (context, params) => ProviderHomehelpWidget(
            publishDoc: params.getParam(
              'publishDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'provider_lesson',
          path: '/Publish_lessonProvider',
          asyncParams: {
            'publshDoc': getDoc(['publish'], PublishRecord.fromSnapshot),
          },
          builder: (context, params) => ProviderLessonWidget(
            publshDoc: params.getParam(
              'publshDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'provider_catering',
          path: '/Publish_restaurationProvider',
          builder: (context, params) => const ProviderCateringWidget(),
        ),
        FFRoute(
          name: 'provider_it_services',
          path: '/provider_it_services',
          asyncParams: {
            'publishDoc': getDoc(['publish'], PublishRecord.fromSnapshot),
          },
          builder: (context, params) => ProviderItServicesWidget(
            publishDoc: params.getParam(
              'publishDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'provider_address',
          path: '/Publish_constructionLieuProvider',
          asyncParams: {
            'publishDoc': getDoc(['publish'], PublishRecord.fromSnapshot),
          },
          builder: (context, params) => ProviderAddressWidget(
            category: params.getParam(
              'category',
              ParamType.String,
            ),
            qualification: params.getParam(
              'qualification',
              ParamType.String,
            ),
            otherspecify: params.getParam(
              'otherspecify',
              ParamType.String,
            ),
            skils: params.getParam(
              'skils',
              ParamType.String,
            ),
            dailyrate: params.getParam(
              'dailyrate',
              ParamType.int,
            ),
            image: params.getParam(
              'image',
              ParamType.String,
            ),
            publishDoc: params.getParam(
              'publishDoc',
              ParamType.Document,
            ),
            categoryName: params.getParam(
              'categoryName',
              ParamType.String,
            ),
            categoryImage: params.getParam(
              'categoryImage',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Filters_Distance_Provider',
          path: '/Filters_Distance_Provider',
          builder: (context, params) => const FiltersDistanceProviderWidget(),
        ),
        FFRoute(
          name: 'Filters_categorie_Provider',
          path: '/Filters_categorie_Provider',
          builder: (context, params) => const FiltersCategorieProviderWidget(),
        ),
        FFRoute(
          name: 'Filters_avis_provider',
          path: '/Filters_avis_provider',
          builder: (context, params) => const FiltersAvisProviderWidget(),
        ),
        FFRoute(
          name: 'Edit_languages',
          path: '/Edit_languages',
          builder: (context, params) => const EditLanguagesWidget(),
        ),
        FFRoute(
          name: 'Filters_Gender_Client',
          path: '/Filters_Gender_Client',
          builder: (context, params) => const FiltersGenderClientWidget(),
        ),
        FFRoute(
          name: 'Filters_Gender_Provider',
          path: '/Filters_Gender_Provider',
          builder: (context, params) => const FiltersGenderProviderWidget(),
        ),
        FFRoute(
          name: 'Filters_tarif_Client',
          path: '/Filters_tarif_Client',
          builder: (context, params) => const FiltersTarifClientWidget(),
        ),
        FFRoute(
          name: 'Filters_Ranking_Provider',
          path: '/Filters_Ranking_Provider',
          builder: (context, params) => FiltersRankingProviderWidget(
            filterRef: params.getParam(
              'filterRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['filters'],
            ),
          ),
        ),
        FFRoute(
          name: 'Filters_Ranking_Client',
          path: '/Filters_Ranking_Client',
          builder: (context, params) => FiltersRankingClientWidget(
            filterRef: params.getParam(
              'filterRef',
              ParamType.DocumentReference,
              isList: false,
              collectionNamePath: ['filters'],
            ),
          ),
        ),
        FFRoute(
          name: 'Filters_rating_Client',
          path: '/Filters_rating_Client',
          builder: (context, params) => const FiltersRatingClientWidget(),
        ),
        FFRoute(
          name: 'Filters_rating_Provider',
          path: '/Filters_rating_Provider',
          builder: (context, params) => const FiltersRatingProviderWidget(),
        ),
        FFRoute(
          name: 'provider_apply',
          path: '/providerApply',
          asyncParams: {
            'publishDoc': getDoc(['publish'], PublishRecord.fromSnapshot),
          },
          builder: (context, params) => ProviderApplyWidget(
            publishDoc: params.getParam(
              'publishDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'Welcome',
          path: '/welcome',
          builder: (context, params) => const WelcomeWidget(),
        ),
        FFRoute(
          name: 'select_payment',
          path: '/select_payment',
          asyncParams: {
            'publishDoc': getDoc(['publish'], PublishRecord.fromSnapshot),
          },
          builder: (context, params) => SelectPaymentWidget(
            publishDoc: params.getParam(
              'publishDoc',
              ParamType.Document,
            ),
            category: params.getParam(
              'category',
              ParamType.String,
            ),
            qualification: params.getParam(
              'qualification',
              ParamType.String,
            ),
            otherspecify: params.getParam(
              'otherspecify',
              ParamType.String,
            ),
            skils: params.getParam(
              'skils',
              ParamType.String,
            ),
            dailyrate: params.getParam(
              'dailyrate',
              ParamType.int,
            ),
            location: params.getParam(
              'location',
              ParamType.String,
            ),
            price: params.getParam(
              'price',
              ParamType.int,
            ),
            image: params.getParam(
              'image',
              ParamType.String,
            ),
            starttime: params.getParam(
              'starttime',
              ParamType.DateTime,
            ),
            endtime: params.getParam(
              'endtime',
              ParamType.DateTime,
            ),
          ),
        ),
        FFRoute(
          name: 'bookService',
          path: '/bookService',
          asyncParams: {
            'publishDoc': getDoc(['publish'], PublishRecord.fromSnapshot),
          },
          builder: (context, params) => BookServiceWidget(
            publishDoc: params.getParam(
              'publishDoc',
              ParamType.Document,
            ),
          ),
        ),
        FFRoute(
          name: 'notification',
          path: '/notification',
          builder: (context, params) => const NotificationWidget(),
        ),
        FFRoute(
          name: 'HelpCenter',
          path: '/HelpCenter',
          builder: (context, params) => const HelpCenterWidget(),
        ),
        FFRoute(
          name: 'publish_rate_Availability',
          path: '/Ppublish_rate_Availability',
          builder: (context, params) => PublishRateAvailabilityWidget(
            category: params.getParam(
              'category',
              ParamType.String,
            ),
            qualification: params.getParam(
              'qualification',
              ParamType.String,
            ),
            otherspecify: params.getParam(
              'otherspecify',
              ParamType.String,
            ),
            skils: params.getParam(
              'skils',
              ParamType.String,
            ),
            price: params.getParam(
              'price',
              ParamType.int,
            ),
            location: params.getParam(
              'location',
              ParamType.String,
            ),
            image: params.getParam(
              'image',
              ParamType.String,
            ),
          ),
        ),
        FFRoute(
          name: 'Requestconfirm',
          path: '/Requestconfirm',
          builder: (context, params) => const RequestconfirmWidget(),
        )
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/welcome';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? isWeb
                  ? Container()
                  : Container(
                      color: Colors.transparent,
                      child: Center(
                        child: Image.asset(
                          'assets/images/Mitiim_logo_seul.png',
                          width: 150.0,
                          height: 150.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => const TransitionInfo(hasTransition: false);
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
