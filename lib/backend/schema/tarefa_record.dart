import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TarefaRecord extends FirestoreRecord {
  TarefaRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "tarefa" field.
  String? _tarefa;
  String get tarefa => _tarefa ?? '';
  bool hasTarefa() => _tarefa != null;

  // "descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "realizada" field.
  bool? _realizada;
  bool get realizada => _realizada ?? false;
  bool hasRealizada() => _realizada != null;

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

  void _initializeFields() {
    _tarefa = snapshotData['tarefa'] as String?;
    _descricao = snapshotData['descricao'] as String?;
    _realizada = snapshotData['realizada'] as bool?;
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tarefa');

  static Stream<TarefaRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TarefaRecord.fromSnapshot(s));

  static Future<TarefaRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TarefaRecord.fromSnapshot(s));

  static TarefaRecord fromSnapshot(DocumentSnapshot snapshot) => TarefaRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TarefaRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TarefaRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TarefaRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TarefaRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTarefaRecordData({
  String? tarefa,
  String? descricao,
  bool? realizada,
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tarefa': tarefa,
      'descricao': descricao,
      'realizada': realizada,
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class TarefaRecordDocumentEquality implements Equality<TarefaRecord> {
  const TarefaRecordDocumentEquality();

  @override
  bool equals(TarefaRecord? e1, TarefaRecord? e2) {
    return e1?.tarefa == e2?.tarefa &&
        e1?.descricao == e2?.descricao &&
        e1?.realizada == e2?.realizada &&
        e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber;
  }

  @override
  int hash(TarefaRecord? e) => const ListEquality().hash([
        e?.tarefa,
        e?.descricao,
        e?.realizada,
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is TarefaRecord;
}
