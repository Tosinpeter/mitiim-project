import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "photo_id" field.
  String? _photoId;
  String get photoId => _photoId ?? '';
  bool hasPhotoId() => _photoId != null;

  // "photo_id2" field.
  String? _photoId2;
  String get photoId2 => _photoId2 ?? '';
  bool hasPhotoId2() => _photoId2 != null;

  // "photo_id3" field.
  String? _photoId3;
  String get photoId3 => _photoId3 ?? '';
  bool hasPhotoId3() => _photoId3 != null;

  // "photo_id4" field.
  String? _photoId4;
  String get photoId4 => _photoId4 ?? '';
  bool hasPhotoId4() => _photoId4 != null;

  // "display_fname" field.
  String? _displayFname;
  String get displayFname => _displayFname ?? '';
  bool hasDisplayFname() => _displayFname != null;

  // "birthday" field.
  DateTime? _birthday;
  DateTime? get birthday => _birthday;
  bool hasBirthday() => _birthday != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "zip_code" field.
  int? _zipCode;
  int get zipCode => _zipCode ?? 0;
  bool hasZipCode() => _zipCode != null;

  // "picture_annonce" field.
  String? _pictureAnnonce;
  String get pictureAnnonce => _pictureAnnonce ?? '';
  bool hasPictureAnnonce() => _pictureAnnonce != null;

  // "picture_annonce2" field.
  String? _pictureAnnonce2;
  String get pictureAnnonce2 => _pictureAnnonce2 ?? '';
  bool hasPictureAnnonce2() => _pictureAnnonce2 != null;

  // "picture_annonce3" field.
  String? _pictureAnnonce3;
  String get pictureAnnonce3 => _pictureAnnonce3 ?? '';
  bool hasPictureAnnonce3() => _pictureAnnonce3 != null;

  // "minibio" field.
  String? _minibio;
  String get minibio => _minibio ?? '';
  bool hasMinibio() => _minibio != null;

  // "favouritePubs" field.
  List<DocumentReference>? _favouritePubs;
  List<DocumentReference> get favouritePubs => _favouritePubs ?? const [];
  bool hasFavouritePubs() => _favouritePubs != null;

  // "last_active" field.
  DateTime? _lastActive;
  DateTime? get lastActive => _lastActive;
  bool hasLastActive() => _lastActive != null;

  // "googleDone" field.
  bool? _googleDone;
  bool get googleDone => _googleDone ?? false;
  bool hasGoogleDone() => _googleDone != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "country" field.
  String? _country;
  String get country => _country ?? '';
  bool hasCountry() => _country != null;

  // "countryCode" field.
  String? _countryCode;
  String get countryCode => _countryCode ?? '';
  bool hasCountryCode() => _countryCode != null;

  // "myChats" field.
  List<DocumentReference>? _myChats;
  List<DocumentReference> get myChats => _myChats ?? const [];
  bool hasMyChats() => _myChats != null;

  // "chatsWith" field.
  List<DocumentReference>? _chatsWith;
  List<DocumentReference> get chatsWith => _chatsWith ?? const [];
  bool hasChatsWith() => _chatsWith != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _photoId = snapshotData['photo_id'] as String?;
    _photoId2 = snapshotData['photo_id2'] as String?;
    _photoId3 = snapshotData['photo_id3'] as String?;
    _photoId4 = snapshotData['photo_id4'] as String?;
    _displayFname = snapshotData['display_fname'] as String?;
    _birthday = snapshotData['birthday'] as DateTime?;
    _address = snapshotData['address'] as String?;
    _zipCode = castToType<int>(snapshotData['zip_code']);
    _pictureAnnonce = snapshotData['picture_annonce'] as String?;
    _pictureAnnonce2 = snapshotData['picture_annonce2'] as String?;
    _pictureAnnonce3 = snapshotData['picture_annonce3'] as String?;
    _minibio = snapshotData['minibio'] as String?;
    _favouritePubs = getDataList(snapshotData['favouritePubs']);
    _lastActive = snapshotData['last_active'] as DateTime?;
    _googleDone = snapshotData['googleDone'] as bool?;
    _state = snapshotData['state'] as String?;
    _country = snapshotData['country'] as String?;
    _countryCode = snapshotData['countryCode'] as String?;
    _myChats = getDataList(snapshotData['myChats']);
    _chatsWith = getDataList(snapshotData['chatsWith']);
    _location = snapshotData['location'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? photoId,
  String? photoId2,
  String? photoId3,
  String? photoId4,
  String? displayFname,
  DateTime? birthday,
  String? address,
  int? zipCode,
  String? pictureAnnonce,
  String? pictureAnnonce2,
  String? pictureAnnonce3,
  String? minibio,
  DateTime? lastActive,
  bool? googleDone,
  String? state,
  String? country,
  String? countryCode,
  LatLng? location,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'photo_id': photoId,
      'photo_id2': photoId2,
      'photo_id3': photoId3,
      'photo_id4': photoId4,
      'display_fname': displayFname,
      'birthday': birthday,
      'address': address,
      'zip_code': zipCode,
      'picture_annonce': pictureAnnonce,
      'picture_annonce2': pictureAnnonce2,
      'picture_annonce3': pictureAnnonce3,
      'minibio': minibio,
      'last_active': lastActive,
      'googleDone': googleDone,
      'state': state,
      'country': country,
      'countryCode': countryCode,
      'location': location,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.photoId == e2?.photoId &&
        e1?.photoId2 == e2?.photoId2 &&
        e1?.photoId3 == e2?.photoId3 &&
        e1?.photoId4 == e2?.photoId4 &&
        e1?.displayFname == e2?.displayFname &&
        e1?.birthday == e2?.birthday &&
        e1?.address == e2?.address &&
        e1?.zipCode == e2?.zipCode &&
        e1?.pictureAnnonce == e2?.pictureAnnonce &&
        e1?.pictureAnnonce2 == e2?.pictureAnnonce2 &&
        e1?.pictureAnnonce3 == e2?.pictureAnnonce3 &&
        e1?.minibio == e2?.minibio &&
        listEquality.equals(e1?.favouritePubs, e2?.favouritePubs) &&
        e1?.lastActive == e2?.lastActive &&
        e1?.googleDone == e2?.googleDone &&
        e1?.state == e2?.state &&
        e1?.country == e2?.country &&
        e1?.countryCode == e2?.countryCode &&
        listEquality.equals(e1?.myChats, e2?.myChats) &&
        listEquality.equals(e1?.chatsWith, e2?.chatsWith) &&
        e1?.location == e2?.location;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.photoId,
        e?.photoId2,
        e?.photoId3,
        e?.photoId4,
        e?.displayFname,
        e?.birthday,
        e?.address,
        e?.zipCode,
        e?.pictureAnnonce,
        e?.pictureAnnonce2,
        e?.pictureAnnonce3,
        e?.minibio,
        e?.favouritePubs,
        e?.lastActive,
        e?.googleDone,
        e?.state,
        e?.country,
        e?.countryCode,
        e?.myChats,
        e?.chatsWith,
        e?.location
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
