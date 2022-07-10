import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tasks_record.g.dart';

abstract class TasksRecord implements Built<TasksRecord, TasksRecordBuilder> {
  static Serializer<TasksRecord> get serializer => _$tasksRecordSerializer;

  @nullable
  @BuiltValueField(wireName: 'date_created')
  DateTime get dateCreated;

  @nullable
  bool get isDone;

  @nullable
  @BuiltValueField(wireName: 'task_title')
  String get taskTitle;

  @nullable
  @BuiltValueField(wireName: 'task_description')
  String get taskDescription;

  @nullable
  DocumentReference get user;

  @nullable
  @BuiltValueField(wireName: 'todo_steps')
  BuiltList<String> get todoSteps;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(TasksRecordBuilder builder) => builder
    ..isDone = false
    ..taskTitle = ''
    ..taskDescription = ''
    ..todoSteps = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tasks');

  static Stream<TasksRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TasksRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TasksRecord._();
  factory TasksRecord([void Function(TasksRecordBuilder) updates]) =
      _$TasksRecord;

  static TasksRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTasksRecordData({
  DateTime dateCreated,
  bool isDone,
  String taskTitle,
  String taskDescription,
  DocumentReference user,
}) =>
    serializers.toFirestore(
        TasksRecord.serializer,
        TasksRecord((t) => t
          ..dateCreated = dateCreated
          ..isDone = isDone
          ..taskTitle = taskTitle
          ..taskDescription = taskDescription
          ..user = user
          ..todoSteps = null));
