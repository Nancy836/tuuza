import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'comments_record.g.dart';

abstract class CommentsRecord
    implements Built<CommentsRecord, CommentsRecordBuilder> {
  static Serializer<CommentsRecord> get serializer =>
      _$commentsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'comment_author')
  DocumentReference get commentAuthor;

  @nullable
  @BuiltValueField(wireName: 'post_id')
  DocumentReference get postId;

  @nullable
  @BuiltValueField(wireName: 'comment_date')
  DateTime get commentDate;

  @nullable
  @BuiltValueField(wireName: 'comment_description')
  String get commentDescription;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(CommentsRecordBuilder builder) =>
      builder..commentDescription = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('comments');

  static Stream<CommentsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CommentsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  CommentsRecord._();
  factory CommentsRecord([void Function(CommentsRecordBuilder) updates]) =
      _$CommentsRecord;

  static CommentsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCommentsRecordData({
  DocumentReference commentAuthor,
  DocumentReference postId,
  DateTime commentDate,
  String commentDescription,
}) =>
    serializers.toFirestore(
        CommentsRecord.serializer,
        CommentsRecord((c) => c
          ..commentAuthor = commentAuthor
          ..postId = postId
          ..commentDate = commentDate
          ..commentDescription = commentDescription));
