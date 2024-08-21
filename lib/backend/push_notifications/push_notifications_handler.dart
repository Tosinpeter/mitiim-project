import 'dart:async';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({super.key, required this.child});

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
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
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => const ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'Account': (data) async => ParameterData(
        allParams: {
          'publishDoc': await getDocumentParameter<PublishRecord>(
              data, 'publishDoc', PublishRecord.fromSnapshot),
        },
      ),
  'Auth_forgotPassword': ParameterData.none(),
  'Create_account': ParameterData.none(),
  'How_provider': ParameterData.none(),
  'How_client': ParameterData.none(),
  'Congrulations': ParameterData.none(),
  'client_date_select': (data) async => ParameterData(
        allParams: {
          'publishDoc': await getDocumentParameter<PublishRecord>(
              data, 'publishDoc', PublishRecord.fromSnapshot),
          'categoryName': getParameter<String>(data, 'categoryName'),
          'categoryImage': getParameter<String>(data, 'categoryImage'),
        },
      ),
  'client_catering': (data) async => ParameterData(
        allParams: {
          'publishDoc': await getDocumentParameter<PublishRecord>(
              data, 'publishDoc', PublishRecord.fromSnapshot),
        },
      ),
  'client_beauty': (data) async => ParameterData(
        allParams: {
          'publishDoc': await getDocumentParameter<PublishRecord>(
              data, 'publishDoc', PublishRecord.fromSnapshot),
        },
      ),
  'client_homehelp': (data) async => ParameterData(
        allParams: {
          'publishDoc': await getDocumentParameter<PublishRecord>(
              data, 'publishDoc', PublishRecord.fromSnapshot),
        },
      ),
  'client_it_service': (data) async => ParameterData(
        allParams: {
          'publishDoc': await getDocumentParameter<PublishRecord>(
              data, 'publishDoc', PublishRecord.fromSnapshot),
        },
      ),
  'client_lesson': (data) async => ParameterData(
        allParams: {
          'publishDoc': await getDocumentParameter<PublishRecord>(
              data, 'publishDoc', PublishRecord.fromSnapshot),
        },
      ),
  'client_admin': (data) async => ParameterData(
        allParams: {
          'publishDoc': await getDocumentParameter<PublishRecord>(
              data, 'publishDoc', PublishRecord.fromSnapshot),
        },
      ),
  'client_demenagement': (data) async => ParameterData(
        allParams: {
          'publishDoc': await getDocumentParameter<PublishRecord>(
              data, 'publishDoc', PublishRecord.fromSnapshot),
        },
      ),
  'client_auto': (data) async => ParameterData(
        allParams: {
          'publishDoc': await getDocumentParameter<PublishRecord>(
              data, 'publishDoc', PublishRecord.fromSnapshot),
        },
      ),
  'client_construction': (data) async => ParameterData(
        allParams: {
          'publishDoc': await getDocumentParameter<PublishRecord>(
              data, 'publishDoc', PublishRecord.fromSnapshot),
        },
      ),
  'client_address': (data) async => ParameterData(
        allParams: {
          'publishDoc': await getDocumentParameter<PublishRecord>(
              data, 'publishDoc', PublishRecord.fromSnapshot),
          'categoryName': getParameter<String>(data, 'categoryName'),
          'categoryImage': getParameter<String>(data, 'categoryImage'),
        },
      ),
  'Paiement_client': ParameterData.none(),
  'RequestValid': ParameterData.none(),
  'Notifications': ParameterData.none(),
  'Favoris': ParameterData.none(),
  'Create_photo': ParameterData.none(),
  'Chat': ParameterData.none(),
  'Filters': ParameterData.none(),
  'PublishCategorie': ParameterData.none(),
  'Payment_presta': ParameterData.none(),
  'Profil_client': ParameterData.none(),
  'conversation': (data) async => ParameterData(
        allParams: {
          'chatDoc': await getDocumentParameter<ChatsRecord>(
              data, 'chatDoc', ChatsRecord.fromSnapshot),
        },
      ),
  'Help': ParameterData.none(),
  'HelpYourAccount': ParameterData.none(),
  'TermsConditions': ParameterData.none(),
  'Filters_avis_client': ParameterData.none(),
  'Filters_categorie_Client': ParameterData.none(),
  'Filters_tarif_provider': ParameterData.none(),
  'Profil_presta': ParameterData.none(),
  'Home': ParameterData.none(),
  'Filters_Distance_Client': ParameterData.none(),
  'Edit_Profile': ParameterData.none(),
  'HelpServices': ParameterData.none(),
  'HelpAbsence': ParameterData.none(),
  'HelpInformations': ParameterData.none(),
  'reservationsClient': (data) async => ParameterData(
        allParams: {
          'publishDoc': await getDocumentParameter<PublishRecord>(
              data, 'publishDoc', PublishRecord.fromSnapshot),
        },
      ),
  'provider_reservations': (data) async => ParameterData(
        allParams: {
          'publishDoc': await getDocumentParameter<PublishRecord>(
              data, 'publishDoc', PublishRecord.fromSnapshot),
        },
      ),
  'provider_admin': (data) async => ParameterData(
        allParams: {
          'publishDoc': await getDocumentParameter<PublishRecord>(
              data, 'publishDoc', PublishRecord.fromSnapshot),
        },
      ),
  'Profil_DemandeAnnonce': (data) async => ParameterData(
        allParams: {
          'publishDoc': await getDocumentParameter<PublishRecord>(
              data, 'publishDoc', PublishRecord.fromSnapshot),
          'userDoc': await getDocumentParameter<UsersRecord>(
              data, 'userDoc', UsersRecord.fromSnapshot),
        },
      ),
  'Profil_ReponseAnnonce': (data) async => ParameterData(
        allParams: {
          'publishDoc': await getDocumentParameter<PublishRecord>(
              data, 'publishDoc', PublishRecord.fromSnapshot),
          'chatDoc': await getDocumentParameter<ChatsRecord>(
              data, 'chatDoc', ChatsRecord.fromSnapshot),
        },
      ),
  'provider_beauty': (data) async => ParameterData(
        allParams: {
          'publishDoc': await getDocumentParameter<PublishRecord>(
              data, 'publishDoc', PublishRecord.fromSnapshot),
        },
      ),
  'selectQualification': (data) async => ParameterData(
        allParams: {
          'category': getParameter<String>(data, 'category'),
          'image': getParameter<String>(data, 'image'),
          'publishDoc': await getDocumentParameter<PublishRecord>(
              data, 'publishDoc', PublishRecord.fromSnapshot),
        },
      ),
  'provider_auto': (data) async => ParameterData(
        allParams: {
          'publishDoc': await getDocumentParameter<PublishRecord>(
              data, 'publishDoc', PublishRecord.fromSnapshot),
        },
      ),
  'provider_demenagement': (data) async => ParameterData(
        allParams: {
          'publishDoc': await getDocumentParameter<PublishRecord>(
              data, 'publishDoc', PublishRecord.fromSnapshot),
        },
      ),
  'provider_homehelp': (data) async => ParameterData(
        allParams: {
          'publishDoc': await getDocumentParameter<PublishRecord>(
              data, 'publishDoc', PublishRecord.fromSnapshot),
        },
      ),
  'provider_lesson': (data) async => ParameterData(
        allParams: {
          'publshDoc': await getDocumentParameter<PublishRecord>(
              data, 'publshDoc', PublishRecord.fromSnapshot),
        },
      ),
  'provider_catering': ParameterData.none(),
  'provider_it_services': (data) async => ParameterData(
        allParams: {
          'publishDoc': await getDocumentParameter<PublishRecord>(
              data, 'publishDoc', PublishRecord.fromSnapshot),
        },
      ),
  'provider_address': (data) async => ParameterData(
        allParams: {
          'category': getParameter<String>(data, 'category'),
          'qualification': getParameter<String>(data, 'qualification'),
          'otherspecify': getParameter<String>(data, 'otherspecify'),
          'skils': getParameter<String>(data, 'skils'),
          'dailyrate': getParameter<int>(data, 'dailyrate'),
          'image': getParameter<String>(data, 'image'),
          'publishDoc': await getDocumentParameter<PublishRecord>(
              data, 'publishDoc', PublishRecord.fromSnapshot),
          'categoryName': getParameter<String>(data, 'categoryName'),
          'categoryImage': getParameter<String>(data, 'categoryImage'),
        },
      ),
  'Filters_Distance_Provider': ParameterData.none(),
  'Filters_categorie_Provider': ParameterData.none(),
  'Filters_avis_provider': ParameterData.none(),
  'Edit_languages': ParameterData.none(),
  'Filters_Gender_Client': ParameterData.none(),
  'Filters_Gender_Provider': ParameterData.none(),
  'Filters_tarif_Client': ParameterData.none(),
  'Filters_Ranking_Provider': (data) async => ParameterData(
        allParams: {
          'filterRef': getParameter<DocumentReference>(data, 'filterRef'),
        },
      ),
  'Filters_Ranking_Client': (data) async => ParameterData(
        allParams: {
          'filterRef': getParameter<DocumentReference>(data, 'filterRef'),
        },
      ),
  'Filters_rating_Client': ParameterData.none(),
  'Filters_rating_Provider': ParameterData.none(),
  'provider_apply': (data) async => ParameterData(
        allParams: {
          'publishDoc': await getDocumentParameter<PublishRecord>(
              data, 'publishDoc', PublishRecord.fromSnapshot),
        },
      ),
  'Welcome': ParameterData.none(),
  'select_payment': (data) async => ParameterData(
        allParams: {
          'publishDoc': await getDocumentParameter<PublishRecord>(
              data, 'publishDoc', PublishRecord.fromSnapshot),
          'category': getParameter<String>(data, 'category'),
          'qualification': getParameter<String>(data, 'qualification'),
          'otherspecify': getParameter<String>(data, 'otherspecify'),
          'skils': getParameter<String>(data, 'skils'),
          'dailyrate': getParameter<int>(data, 'dailyrate'),
          'location': getParameter<String>(data, 'location'),
          'price': getParameter<int>(data, 'price'),
          'image': getParameter<String>(data, 'image'),
          'starttime': getParameter<DateTime>(data, 'starttime'),
          'endtime': getParameter<DateTime>(data, 'endtime'),
        },
      ),
  'bookService': (data) async => ParameterData(
        allParams: {
          'publishDoc': await getDocumentParameter<PublishRecord>(
              data, 'publishDoc', PublishRecord.fromSnapshot),
        },
      ),
  'notification': ParameterData.none(),
  'HelpCenter': ParameterData.none(),
  'publish_rate_Availability': (data) async => ParameterData(
        allParams: {
          'category': getParameter<String>(data, 'category'),
          'qualification': getParameter<String>(data, 'qualification'),
          'otherspecify': getParameter<String>(data, 'otherspecify'),
          'skils': getParameter<String>(data, 'skils'),
          'price': getParameter<int>(data, 'price'),
          'location': getParameter<String>(data, 'location'),
          'image': getParameter<String>(data, 'image'),
        },
      ),
  'Requestconfirm': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
