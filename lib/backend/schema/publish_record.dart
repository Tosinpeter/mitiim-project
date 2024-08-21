import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PublishRecord extends FirestoreRecord {
  PublishRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  bool hasPrice() => _price != null;

  // "category" field.
  PublishCategory? _category;
  PublishCategory? get category => _category;
  bool hasCategory() => _category != null;

  // "publishedBy" field.
  PublishedBy? _publishedBy;
  PublishedBy? get publishedBy => _publishedBy;
  bool hasPublishedBy() => _publishedBy != null;

  // "other" field.
  String? _other;
  String get other => _other ?? '';
  bool hasOther() => _other != null;

  // "photo_url1" field.
  String? _photoUrl1;
  String get photoUrl1 => _photoUrl1 ?? '';
  bool hasPhotoUrl1() => _photoUrl1 != null;

  // "photo_url2" field.
  String? _photoUrl2;
  String get photoUrl2 => _photoUrl2 ?? '';
  bool hasPhotoUrl2() => _photoUrl2 != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "constructionHours" field.
  String? _constructionHours;
  String get constructionHours => _constructionHours ?? '';
  bool hasConstructionHours() => _constructionHours != null;

  // "constructionStartDate" field.
  DateTime? _constructionStartDate;
  DateTime? get constructionStartDate => _constructionStartDate;
  bool hasConstructionStartDate() => _constructionStartDate != null;

  // "constructionEndDate" field.
  DateTime? _constructionEndDate;
  DateTime? get constructionEndDate => _constructionEndDate;
  bool hasConstructionEndDate() => _constructionEndDate != null;

  // "hourly_rate" field.
  String? _hourlyRate;
  String get hourlyRate => _hourlyRate ?? '';
  bool hasHourlyRate() => _hourlyRate != null;

  // "respondedUsers" field.
  List<DocumentReference>? _respondedUsers;
  List<DocumentReference> get respondedUsers => _respondedUsers ?? const [];
  bool hasRespondedUsers() => _respondedUsers != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "acceptedUsers" field.
  List<DocumentReference>? _acceptedUsers;
  List<DocumentReference> get acceptedUsers => _acceptedUsers ?? const [];
  bool hasAcceptedUsers() => _acceptedUsers != null;

  // "refusedUsers" field.
  List<DocumentReference>? _refusedUsers;
  List<DocumentReference> get refusedUsers => _refusedUsers ?? const [];
  bool hasRefusedUsers() => _refusedUsers != null;

  // "Qualification" field.
  String? _qualification;
  String get qualification => _qualification ?? '';
  bool hasQualification() => _qualification != null;

  // "skills" field.
  String? _skills;
  String get skills => _skills ?? '';
  bool hasSkills() => _skills != null;

  // "locations" field.
  String? _locations;
  String get locations => _locations ?? '';
  bool hasLocations() => _locations != null;

  // "avilibility" field.
  AvailabilityStruct? _avilibility;
  AvailabilityStruct get avilibility => _avilibility ?? AvailabilityStruct();
  bool hasAvilibility() => _avilibility != null;

  // "dailyRated" field.
  int? _dailyRated;
  int get dailyRated => _dailyRated ?? 0;
  bool hasDailyRated() => _dailyRated != null;

  // "otherspecify" field.
  String? _otherspecify;
  String get otherspecify => _otherspecify ?? '';
  bool hasOtherspecify() => _otherspecify != null;

  // "categorys" field.
  String? _categorys;
  String get categorys => _categorys ?? '';
  bool hasCategorys() => _categorys != null;

  // "paymenttype" field.
  String? _paymenttype;
  String get paymenttype => _paymenttype ?? '';
  bool hasPaymenttype() => _paymenttype != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  bool hasIcon() => _icon != null;

  // "constructionAddress" field.
  String? _constructionAddress;
  String get constructionAddress => _constructionAddress ?? '';
  bool hasConstructionAddress() => _constructionAddress != null;

  // "dailyRate" field.
  String? _dailyRate;
  String get dailyRate => _dailyRate ?? '';
  bool hasDailyRate() => _dailyRate != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _price = castToType<int>(snapshotData['price']);
    _category = deserializeEnum<PublishCategory>(snapshotData['category']);
    _publishedBy = deserializeEnum<PublishedBy>(snapshotData['publishedBy']);
    _other = snapshotData['other'] as String?;
    _photoUrl1 = snapshotData['photo_url1'] as String?;
    _photoUrl2 = snapshotData['photo_url2'] as String?;
    _uid = snapshotData['uid'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _id = snapshotData['id'] as String?;
    _constructionHours = snapshotData['constructionHours'] as String?;
    _constructionStartDate = snapshotData['constructionStartDate'] as DateTime?;
    _constructionEndDate = snapshotData['constructionEndDate'] as DateTime?;
    _hourlyRate = snapshotData['hourly_rate'] as String?;
    _respondedUsers = getDataList(snapshotData['respondedUsers']);
    _country = snapshotData['country'] as String?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _acceptedUsers = getDataList(snapshotData['acceptedUsers']);
    _refusedUsers = getDataList(snapshotData['refusedUsers']);
    _qualification = snapshotData['Qualification'] as String?;
    _skills = snapshotData['skills'] as String?;
    _locations = snapshotData['locations'] as String?;
    _avilibility = AvailabilityStruct.maybeFromMap(snapshotData['avilibility']);
    _dailyRated = castToType<int>(snapshotData['dailyRated']);
    _otherspecify = snapshotData['otherspecify'] as String?;
    _categorys = snapshotData['categorys'] as String?;
    _paymenttype = snapshotData['paymenttype'] as String?;
    _icon = snapshotData['icon'] as String?;
    _constructionAddress = snapshotData['constructionAddress'] as String?;
    _dailyRate = snapshotData['dailyRate'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('publish');

  static Stream<PublishRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PublishRecord.fromSnapshot(s));

  static Future<PublishRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PublishRecord.fromSnapshot(s));

  static PublishRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PublishRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PublishRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PublishRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PublishRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PublishRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPublishRecordData({
  String? name,
  String? description,
  int? price,
  PublishCategory? category,
  PublishedBy? publishedBy,
  String? other,
  String? photoUrl1,
  String? photoUrl2,
  String? uid,
  DocumentReference? userRef,
  DateTime? createdAt,
  String? id,
  String? constructionHours,
  DateTime? constructionStartDate,
  DateTime? constructionEndDate,
  String? hourlyRate,
  String? country,
  DateTime? updatedAt,
  String? qualification,
  String? skills,
  String? locations,
  AvailabilityStruct? avilibility,
  int? dailyRated,
  String? otherspecify,
  String? categorys,
  String? paymenttype,
  String? icon,
  String? constructionAddress,
  String? dailyRate,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'price': price,
      'category': category,
      'publishedBy': publishedBy,
      'other': other,
      'photo_url1': photoUrl1,
      'photo_url2': photoUrl2,
      'uid': uid,
      'userRef': userRef,
      'created_at': createdAt,
      'id': id,
      'constructionHours': constructionHours,
      'constructionStartDate': constructionStartDate,
      'constructionEndDate': constructionEndDate,
      'hourly_rate': hourlyRate,
      'country': country,
      'updated_at': updatedAt,
      'Qualification': qualification,
      'skills': skills,
      'locations': locations,
      'avilibility': AvailabilityStruct().toMap(),
      'dailyRated': dailyRated,
      'otherspecify': otherspecify,
      'categorys': categorys,
      'paymenttype': paymenttype,
      'icon': icon,
      'constructionAddress': constructionAddress,
      'dailyRate': dailyRate,
    }.withoutNulls,
  );

  // Handle nested data for "avilibility" field.
  addAvailabilityStructData(firestoreData, avilibility, 'avilibility');

  return firestoreData;
}

class PublishRecordDocumentEquality implements Equality<PublishRecord> {
  const PublishRecordDocumentEquality();

  @override
  bool equals(PublishRecord? e1, PublishRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.price == e2?.price &&
        e1?.category == e2?.category &&
        e1?.publishedBy == e2?.publishedBy &&
        e1?.other == e2?.other &&
        e1?.photoUrl1 == e2?.photoUrl1 &&
        e1?.photoUrl2 == e2?.photoUrl2 &&
        e1?.uid == e2?.uid &&
        e1?.userRef == e2?.userRef &&
        e1?.createdAt == e2?.createdAt &&
        e1?.id == e2?.id &&
        e1?.constructionHours == e2?.constructionHours &&
        e1?.constructionStartDate == e2?.constructionStartDate &&
        e1?.constructionEndDate == e2?.constructionEndDate &&
        e1?.hourlyRate == e2?.hourlyRate &&
        listEquality.equals(e1?.respondedUsers, e2?.respondedUsers) &&
        e1?.country == e2?.country &&
        e1?.updatedAt == e2?.updatedAt &&
        listEquality.equals(e1?.acceptedUsers, e2?.acceptedUsers) &&
        listEquality.equals(e1?.refusedUsers, e2?.refusedUsers) &&
        e1?.qualification == e2?.qualification &&
        e1?.skills == e2?.skills &&
        e1?.locations == e2?.locations &&
        e1?.avilibility == e2?.avilibility &&
        e1?.dailyRated == e2?.dailyRated &&
        e1?.otherspecify == e2?.otherspecify &&
        e1?.categorys == e2?.categorys &&
        e1?.paymenttype == e2?.paymenttype &&
        e1?.icon == e2?.icon &&
        e1?.constructionAddress == e2?.constructionAddress &&
        e1?.dailyRate == e2?.dailyRate;
  }

  @override
  int hash(PublishRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.price,
        e?.category,
        e?.publishedBy,
        e?.other,
        e?.photoUrl1,
        e?.photoUrl2,
        e?.uid,
        e?.userRef,
        e?.createdAt,
        e?.id,
        e?.constructionHours,
        e?.constructionStartDate,
        e?.constructionEndDate,
        e?.hourlyRate,
        e?.respondedUsers,
        e?.country,
        e?.updatedAt,
        e?.acceptedUsers,
        e?.refusedUsers,
        e?.qualification,
        e?.skills,
        e?.locations,
        e?.avilibility,
        e?.dailyRated,
        e?.otherspecify,
        e?.categorys,
        e?.paymenttype,
        e?.icon,
        e?.constructionAddress,
        e?.dailyRate
      ]);

  @override
  bool isValidKey(Object? o) => o is PublishRecord;
}
