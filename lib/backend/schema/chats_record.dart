import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatsRecord extends FirestoreRecord {
  ChatsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "last_message" field.
  String? _lastMessage;
  String get lastMessage => _lastMessage ?? '';
  bool hasLastMessage() => _lastMessage != null;

  // "last_message_time" field.
  DateTime? _lastMessageTime;
  DateTime? get lastMessageTime => _lastMessageTime;
  bool hasLastMessageTime() => _lastMessageTime != null;

  // "last_message_sent_by" field.
  DocumentReference? _lastMessageSentBy;
  DocumentReference? get lastMessageSentBy => _lastMessageSentBy;
  bool hasLastMessageSentBy() => _lastMessageSentBy != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "user_a" field.
  DocumentReference? _userA;
  DocumentReference? get userA => _userA;
  bool hasUserA() => _userA != null;

  // "user_b" field.
  DocumentReference? _userB;
  DocumentReference? get userB => _userB;
  bool hasUserB() => _userB != null;

  // "user_a_photo" field.
  String? _userAPhoto;
  String get userAPhoto => _userAPhoto ?? '';
  bool hasUserAPhoto() => _userAPhoto != null;

  // "user_b_photo" field.
  String? _userBPhoto;
  String get userBPhoto => _userBPhoto ?? '';
  bool hasUserBPhoto() => _userBPhoto != null;

  // "user_a_displayName" field.
  String? _userADisplayName;
  String get userADisplayName => _userADisplayName ?? '';
  bool hasUserADisplayName() => _userADisplayName != null;

  // "user_b_displayName" field.
  String? _userBDisplayName;
  String get userBDisplayName => _userBDisplayName ?? '';
  bool hasUserBDisplayName() => _userBDisplayName != null;

  // "user_a_country" field.
  String? _userACountry;
  String get userACountry => _userACountry ?? '';
  bool hasUserACountry() => _userACountry != null;

  // "user_b_country" field.
  String? _userBCountry;
  String get userBCountry => _userBCountry ?? '';
  bool hasUserBCountry() => _userBCountry != null;

  // "user_a_member_since" field.
  DateTime? _userAMemberSince;
  DateTime? get userAMemberSince => _userAMemberSince;
  bool hasUserAMemberSince() => _userAMemberSince != null;

  // "user_b_member_since" field.
  DateTime? _userBMemberSince;
  DateTime? get userBMemberSince => _userBMemberSince;
  bool hasUserBMemberSince() => _userBMemberSince != null;

  void _initializeFields() {
    _users = getDataList(snapshotData['users']);
    _lastMessage = snapshotData['last_message'] as String?;
    _lastMessageTime = snapshotData['last_message_time'] as DateTime?;
    _lastMessageSentBy =
        snapshotData['last_message_sent_by'] as DocumentReference?;
    _id = snapshotData['id'] as String?;
    _userA = snapshotData['user_a'] as DocumentReference?;
    _userB = snapshotData['user_b'] as DocumentReference?;
    _userAPhoto = snapshotData['user_a_photo'] as String?;
    _userBPhoto = snapshotData['user_b_photo'] as String?;
    _userADisplayName = snapshotData['user_a_displayName'] as String?;
    _userBDisplayName = snapshotData['user_b_displayName'] as String?;
    _userACountry = snapshotData['user_a_country'] as String?;
    _userBCountry = snapshotData['user_b_country'] as String?;
    _userAMemberSince = snapshotData['user_a_member_since'] as DateTime?;
    _userBMemberSince = snapshotData['user_b_member_since'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chats');

  static Stream<ChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatsRecord.fromSnapshot(s));

  static Future<ChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatsRecord.fromSnapshot(s));

  static ChatsRecord fromSnapshot(DocumentSnapshot snapshot) => ChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatsRecordData({
  String? lastMessage,
  DateTime? lastMessageTime,
  DocumentReference? lastMessageSentBy,
  String? id,
  DocumentReference? userA,
  DocumentReference? userB,
  String? userAPhoto,
  String? userBPhoto,
  String? userADisplayName,
  String? userBDisplayName,
  String? userACountry,
  String? userBCountry,
  DateTime? userAMemberSince,
  DateTime? userBMemberSince,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'last_message': lastMessage,
      'last_message_time': lastMessageTime,
      'last_message_sent_by': lastMessageSentBy,
      'id': id,
      'user_a': userA,
      'user_b': userB,
      'user_a_photo': userAPhoto,
      'user_b_photo': userBPhoto,
      'user_a_displayName': userADisplayName,
      'user_b_displayName': userBDisplayName,
      'user_a_country': userACountry,
      'user_b_country': userBCountry,
      'user_a_member_since': userAMemberSince,
      'user_b_member_since': userBMemberSince,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatsRecordDocumentEquality implements Equality<ChatsRecord> {
  const ChatsRecordDocumentEquality();

  @override
  bool equals(ChatsRecord? e1, ChatsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.users, e2?.users) &&
        e1?.lastMessage == e2?.lastMessage &&
        e1?.lastMessageTime == e2?.lastMessageTime &&
        e1?.lastMessageSentBy == e2?.lastMessageSentBy &&
        e1?.id == e2?.id &&
        e1?.userA == e2?.userA &&
        e1?.userB == e2?.userB &&
        e1?.userAPhoto == e2?.userAPhoto &&
        e1?.userBPhoto == e2?.userBPhoto &&
        e1?.userADisplayName == e2?.userADisplayName &&
        e1?.userBDisplayName == e2?.userBDisplayName &&
        e1?.userACountry == e2?.userACountry &&
        e1?.userBCountry == e2?.userBCountry &&
        e1?.userAMemberSince == e2?.userAMemberSince &&
        e1?.userBMemberSince == e2?.userBMemberSince;
  }

  @override
  int hash(ChatsRecord? e) => const ListEquality().hash([
        e?.users,
        e?.lastMessage,
        e?.lastMessageTime,
        e?.lastMessageSentBy,
        e?.id,
        e?.userA,
        e?.userB,
        e?.userAPhoto,
        e?.userBPhoto,
        e?.userADisplayName,
        e?.userBDisplayName,
        e?.userACountry,
        e?.userBCountry,
        e?.userAMemberSince,
        e?.userBMemberSince
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatsRecord;
}
