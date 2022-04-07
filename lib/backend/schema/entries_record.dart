import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'entries_record.g.dart';

abstract class EntriesRecord
    implements Built<EntriesRecord, EntriesRecordBuilder> {
  static Serializer<EntriesRecord> get serializer => _$entriesRecordSerializer;

  @nullable
  DateTime get entrydate;

  @nullable
  String get entrydescription;

  @nullable
  String get entryimage;

  @nullable
  String get entryname;

  @nullable
  DocumentReference get user;

  @nullable
  String get mood;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(EntriesRecordBuilder builder) => builder
    ..entrydescription = ''
    ..entryimage = ''
    ..entryname = ''
    ..mood = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('entries');

  static Stream<EntriesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<EntriesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  EntriesRecord._();
  factory EntriesRecord([void Function(EntriesRecordBuilder) updates]) =
      _$EntriesRecord;

  static EntriesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createEntriesRecordData({
  DateTime entrydate,
  String entrydescription,
  String entryimage,
  String entryname,
  DocumentReference user,
  String mood,
}) =>
    serializers.toFirestore(
        EntriesRecord.serializer,
        EntriesRecord((e) => e
          ..entrydate = entrydate
          ..entrydescription = entrydescription
          ..entryimage = entryimage
          ..entryname = entryname
          ..user = user
          ..mood = mood));
