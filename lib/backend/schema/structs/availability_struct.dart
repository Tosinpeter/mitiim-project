// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AvailabilityStruct extends FFFirebaseStruct {
  AvailabilityStruct({
    String? mounday,
    String? tuesday,
    String? wednesday,
    String? thursday,
    String? friday,
    String? saturday,
    String? sunday,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _mounday = mounday,
        _tuesday = tuesday,
        _wednesday = wednesday,
        _thursday = thursday,
        _friday = friday,
        _saturday = saturday,
        _sunday = sunday,
        super(firestoreUtilData);

  // "Mounday" field.
  String? _mounday;
  String get mounday => _mounday ?? '';
  set mounday(String? val) => _mounday = val;

  bool hasMounday() => _mounday != null;

  // "Tuesday" field.
  String? _tuesday;
  String get tuesday => _tuesday ?? '';
  set tuesday(String? val) => _tuesday = val;

  bool hasTuesday() => _tuesday != null;

  // "Wednesday" field.
  String? _wednesday;
  String get wednesday => _wednesday ?? '';
  set wednesday(String? val) => _wednesday = val;

  bool hasWednesday() => _wednesday != null;

  // "Thursday" field.
  String? _thursday;
  String get thursday => _thursday ?? '';
  set thursday(String? val) => _thursday = val;

  bool hasThursday() => _thursday != null;

  // "Friday" field.
  String? _friday;
  String get friday => _friday ?? '';
  set friday(String? val) => _friday = val;

  bool hasFriday() => _friday != null;

  // "Saturday" field.
  String? _saturday;
  String get saturday => _saturday ?? '';
  set saturday(String? val) => _saturday = val;

  bool hasSaturday() => _saturday != null;

  // "Sunday" field.
  String? _sunday;
  String get sunday => _sunday ?? '';
  set sunday(String? val) => _sunday = val;

  bool hasSunday() => _sunday != null;

  static AvailabilityStruct fromMap(Map<String, dynamic> data) =>
      AvailabilityStruct(
        mounday: data['Mounday'] as String?,
        tuesday: data['Tuesday'] as String?,
        wednesday: data['Wednesday'] as String?,
        thursday: data['Thursday'] as String?,
        friday: data['Friday'] as String?,
        saturday: data['Saturday'] as String?,
        sunday: data['Sunday'] as String?,
      );

  static AvailabilityStruct? maybeFromMap(dynamic data) => data is Map
      ? AvailabilityStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'Mounday': _mounday,
        'Tuesday': _tuesday,
        'Wednesday': _wednesday,
        'Thursday': _thursday,
        'Friday': _friday,
        'Saturday': _saturday,
        'Sunday': _sunday,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Mounday': serializeParam(
          _mounday,
          ParamType.String,
        ),
        'Tuesday': serializeParam(
          _tuesday,
          ParamType.String,
        ),
        'Wednesday': serializeParam(
          _wednesday,
          ParamType.String,
        ),
        'Thursday': serializeParam(
          _thursday,
          ParamType.String,
        ),
        'Friday': serializeParam(
          _friday,
          ParamType.String,
        ),
        'Saturday': serializeParam(
          _saturday,
          ParamType.String,
        ),
        'Sunday': serializeParam(
          _sunday,
          ParamType.String,
        ),
      }.withoutNulls;

  static AvailabilityStruct fromSerializableMap(Map<String, dynamic> data) =>
      AvailabilityStruct(
        mounday: deserializeParam(
          data['Mounday'],
          ParamType.String,
          false,
        ),
        tuesday: deserializeParam(
          data['Tuesday'],
          ParamType.String,
          false,
        ),
        wednesday: deserializeParam(
          data['Wednesday'],
          ParamType.String,
          false,
        ),
        thursday: deserializeParam(
          data['Thursday'],
          ParamType.String,
          false,
        ),
        friday: deserializeParam(
          data['Friday'],
          ParamType.String,
          false,
        ),
        saturday: deserializeParam(
          data['Saturday'],
          ParamType.String,
          false,
        ),
        sunday: deserializeParam(
          data['Sunday'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AvailabilityStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AvailabilityStruct &&
        mounday == other.mounday &&
        tuesday == other.tuesday &&
        wednesday == other.wednesday &&
        thursday == other.thursday &&
        friday == other.friday &&
        saturday == other.saturday &&
        sunday == other.sunday;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([mounday, tuesday, wednesday, thursday, friday, saturday, sunday]);
}

AvailabilityStruct createAvailabilityStruct({
  String? mounday,
  String? tuesday,
  String? wednesday,
  String? thursday,
  String? friday,
  String? saturday,
  String? sunday,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AvailabilityStruct(
      mounday: mounday,
      tuesday: tuesday,
      wednesday: wednesday,
      thursday: thursday,
      friday: friday,
      saturday: saturday,
      sunday: sunday,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AvailabilityStruct? updateAvailabilityStruct(
  AvailabilityStruct? availability, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    availability
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAvailabilityStructData(
  Map<String, dynamic> firestoreData,
  AvailabilityStruct? availability,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (availability == null) {
    return;
  }
  if (availability.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && availability.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final availabilityData =
      getAvailabilityFirestoreData(availability, forFieldValue);
  final nestedData =
      availabilityData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = availability.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAvailabilityFirestoreData(
  AvailabilityStruct? availability, [
  bool forFieldValue = false,
]) {
  if (availability == null) {
    return {};
  }
  final firestoreData = mapToFirestore(availability.toMap());

  // Add any Firestore field values
  availability.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAvailabilityListFirestoreData(
  List<AvailabilityStruct>? availabilitys,
) =>
    availabilitys?.map((e) => getAvailabilityFirestoreData(e, true)).toList() ??
    [];
