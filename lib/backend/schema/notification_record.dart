import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationRecord extends FirestoreRecord {
  NotificationRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "createdDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "publishRef" field.
  DocumentReference? _publishRef;
  DocumentReference? get publishRef => _publishRef;
  bool hasPublishRef() => _publishRef != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "madeBy" field.
  PublishedBy? _madeBy;
  PublishedBy? get madeBy => _madeBy;
  bool hasMadeBy() => _madeBy != null;

  void _initializeFields() {
    _createdDate = snapshotData['createdDate'] as DateTime?;
    _publishRef = snapshotData['publishRef'] as DocumentReference?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _title = snapshotData['title'] as String?;
    _madeBy = deserializeEnum<PublishedBy>(snapshotData['madeBy']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notification');

  static Stream<NotificationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationRecord.fromSnapshot(s));

  static Future<NotificationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationRecord.fromSnapshot(s));

  static NotificationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationRecordData({
  DateTime? createdDate,
  DocumentReference? publishRef,
  DocumentReference? userRef,
  String? title,
  PublishedBy? madeBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'createdDate': createdDate,
      'publishRef': publishRef,
      'userRef': userRef,
      'title': title,
      'madeBy': madeBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationRecordDocumentEquality
    implements Equality<NotificationRecord> {
  const NotificationRecordDocumentEquality();

  @override
  bool equals(NotificationRecord? e1, NotificationRecord? e2) {
    return e1?.createdDate == e2?.createdDate &&
        e1?.publishRef == e2?.publishRef &&
        e1?.userRef == e2?.userRef &&
        e1?.title == e2?.title &&
        e1?.madeBy == e2?.madeBy;
  }

  @override
  int hash(NotificationRecord? e) => const ListEquality()
      .hash([e?.createdDate, e?.publishRef, e?.userRef, e?.title, e?.madeBy]);

  @override
  bool isValidKey(Object? o) => o is NotificationRecord;
}
