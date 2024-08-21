import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FiltersRecord extends FirestoreRecord {
  FiltersRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "sortBy" field.
  String? _sortBy;
  String get sortBy => _sortBy ?? '';
  bool hasSortBy() => _sortBy != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "gender" field.
  String? _gender;
  String get gender => _gender ?? '';
  bool hasGender() => _gender != null;

  // "price" field.
  String? _price;
  String get price => _price ?? '';
  bool hasPrice() => _price != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  void _initializeFields() {
    _sortBy = snapshotData['sortBy'] as String?;
    _category = snapshotData['category'] as String?;
    _gender = snapshotData['gender'] as String?;
    _price = snapshotData['price'] as String?;
    _rating = castToType<int>(snapshotData['rating']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('filters');

  static Stream<FiltersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FiltersRecord.fromSnapshot(s));

  static Future<FiltersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FiltersRecord.fromSnapshot(s));

  static FiltersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FiltersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FiltersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FiltersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FiltersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FiltersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFiltersRecordData({
  String? sortBy,
  String? category,
  String? gender,
  String? price,
  int? rating,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sortBy': sortBy,
      'category': category,
      'gender': gender,
      'price': price,
      'rating': rating,
    }.withoutNulls,
  );

  return firestoreData;
}

class FiltersRecordDocumentEquality implements Equality<FiltersRecord> {
  const FiltersRecordDocumentEquality();

  @override
  bool equals(FiltersRecord? e1, FiltersRecord? e2) {
    return e1?.sortBy == e2?.sortBy &&
        e1?.category == e2?.category &&
        e1?.gender == e2?.gender &&
        e1?.price == e2?.price &&
        e1?.rating == e2?.rating;
  }

  @override
  int hash(FiltersRecord? e) => const ListEquality()
      .hash([e?.sortBy, e?.category, e?.gender, e?.price, e?.rating]);

  @override
  bool isValidKey(Object? o) => o is FiltersRecord;
}
