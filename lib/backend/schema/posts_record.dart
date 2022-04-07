import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'posts_record.g.dart';

abstract class PostsRecord implements Built<PostsRecord, PostsRecordBuilder> {
  static Serializer<PostsRecord> get serializer => _$postsRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'post_name')
  String get postName;

  @nullable
  @BuiltValueField(wireName: 'post_author')
  DocumentReference get postAuthor;

  @nullable
  @BuiltValueField(wireName: 'post_description')
  String get postDescription;

  @nullable
  @BuiltValueField(wireName: 'post_image')
  String get postImage;

  @nullable
  @BuiltValueField(wireName: 'post_date')
  DateTime get postDate;

  @nullable
  @BuiltValueField(wireName: 'num_of_comments')
  int get numOfComments;

  @nullable
  BuiltList<DocumentReference> get likes;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(PostsRecordBuilder builder) => builder
    ..postName = ''
    ..postDescription = ''
    ..postImage = ''
    ..numOfComments = 0
    ..likes = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('posts');

  static Stream<PostsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<PostsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  PostsRecord._();
  factory PostsRecord([void Function(PostsRecordBuilder) updates]) =
      _$PostsRecord;

  static PostsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createPostsRecordData({
  String postName,
  DocumentReference postAuthor,
  String postDescription,
  String postImage,
  DateTime postDate,
  int numOfComments,
}) =>
    serializers.toFirestore(
        PostsRecord.serializer,
        PostsRecord((p) => p
          ..postName = postName
          ..postAuthor = postAuthor
          ..postDescription = postDescription
          ..postImage = postImage
          ..postDate = postDate
          ..numOfComments = numOfComments
          ..likes = null));
