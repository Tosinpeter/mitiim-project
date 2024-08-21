import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PublishsRecord extends FirestoreRecord {
  PublishsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "otherspecify" field.
  String? _otherspecify;
  String get otherspecify => _otherspecify ?? '';
  bool hasOtherspecify() => _otherspecify != null;

  // "qualification" field.
  String? _qualification;
  String get qualification => _qualification ?? '';
  bool hasQualification() => _qualification != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "daliyrate" field.
  int? _daliyrate;
  int get daliyrate => _daliyrate ?? 0;
  bool hasDaliyrate() => _daliyrate != null;

  // "avilibity" field.
  AvailabilityStruct? _avilibity;
  AvailabilityStruct get avilibity => _avilibity ?? AvailabilityStruct();
  bool hasAvilibity() => _avilibity != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "skills" field.
  String? _skills;
  String get skills => _skills ?? '';
  bool hasSkills() => _skills != null;

  // "paymenttype" field.
  String? _paymenttype;
  String get paymenttype => _paymenttype ?? '';
  bool hasPaymenttype() => _paymenttype != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "users" field.
  DocumentReference? _users;
  DocumentReference? get users => _users;
  bool hasUsers() => _users != null;

  // "created_ta" field.
  DateTime? _createdTa;
  DateTime? get createdTa => _createdTa;
  bool hasCreatedTa() => _createdTa != null;

  // "userasa" field.
  String? _userasa;
  String get userasa => _userasa ?? '';
  bool hasUserasa() => _userasa != null;

  // "starttime" field.
  DateTime? _starttime;
  DateTime? get starttime => _starttime;
  bool hasStarttime() => _starttime != null;

  // "endtime" field.
  DateTime? _endtime;
  DateTime? get endtime => _endtime;
  bool hasEndtime() => _endtime != null;

  void _initializeFields() {
    _category = snapshotData['category'] as String?;
    _otherspecify = snapshotData['otherspecify'] as String?;
    _qualification = snapshotData['qualification'] as String?;
    _price = castToType<int>(snapshotData['price']);
    _daliyrate = castToType<int>(snapshotData['daliyrate']);
    _avilibity = AvailabilityStruct.maybeFromMap(snapshotData['avilibity']);
    _location = snapshotData['location'] as String?;
    _skills = snapshotData['skills'] as String?;
    _paymenttype = snapshotData['paymenttype'] as String?;
    _image = snapshotData['image'] as String?;
    _users = snapshotData['users'] as DocumentReference?;
    _createdTa = snapshotData['created_ta'] as DateTime?;
    _userasa = snapshotData['userasa'] as String?;
    _starttime = snapshotData['starttime'] as DateTime?;
    _endtime = snapshotData['endtime'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('publishs');

  static Stream<PublishsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PublishsRecord.fromSnapshot(s));

  static Future<PublishsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PublishsRecord.fromSnapshot(s));

  static PublishsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PublishsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PublishsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PublishsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PublishsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PublishsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPublishsRecordData({
  String? category,
  String? otherspecify,
  String? qualification,
  int? price,
  int? daliyrate,
  AvailabilityStruct? avilibity,
  String? location,
  String? skills,
  String? paymenttype,
  String? image,
  DocumentReference? users,
  DateTime? createdTa,
  String? userasa,
  DateTime? starttime,
  DateTime? endtime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'category': category,
      'otherspecify': otherspecify,
      'qualification': qualification,
      'price': price,
      'daliyrate': daliyrate,
      'avilibity': AvailabilityStruct().toMap(),
      'location': location,
      'skills': skills,
      'paymenttype': paymenttype,
      'image': image,
      'users': users,
      'created_ta': createdTa,
      'userasa': userasa,
      'starttime': starttime,
      'endtime': endtime,
    }.withoutNulls,
  );

  // Handle nested data for "avilibity" field.
  addAvailabilityStructData(firestoreData, avilibity, 'avilibity');

  return firestoreData;
}

class PublishsRecordDocumentEquality implements Equality<PublishsRecord> {
  const PublishsRecordDocumentEquality();

  @override
  bool equals(PublishsRecord? e1, PublishsRecord? e2) {
    return e1?.category == e2?.category &&
        e1?.otherspecify == e2?.otherspecify &&
        e1?.qualification == e2?.qualification &&
        e1?.price == e2?.price &&
        e1?.daliyrate == e2?.daliyrate &&
        e1?.avilibity == e2?.avilibity &&
        e1?.location == e2?.location &&
        e1?.skills == e2?.skills &&
        e1?.paymenttype == e2?.paymenttype &&
        e1?.image == e2?.image &&
        e1?.users == e2?.users &&
        e1?.createdTa == e2?.createdTa &&
        e1?.userasa == e2?.userasa &&
        e1?.starttime == e2?.starttime &&
        e1?.endtime == e2?.endtime;
  }

  @override
  int hash(PublishsRecord? e) => const ListEquality().hash([
        e?.category,
        e?.otherspecify,
        e?.qualification,
        e?.price,
        e?.daliyrate,
        e?.avilibity,
        e?.location,
        e?.skills,
        e?.paymenttype,
        e?.image,
        e?.users,
        e?.createdTa,
        e?.userasa,
        e?.starttime,
        e?.endtime
      ]);

  @override
  bool isValidKey(Object? o) => o is PublishsRecord;
}
