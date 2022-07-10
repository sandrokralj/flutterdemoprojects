// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TasksRecord> _$tasksRecordSerializer = new _$TasksRecordSerializer();

class _$TasksRecordSerializer implements StructuredSerializer<TasksRecord> {
  @override
  final Iterable<Type> types = const [TasksRecord, _$TasksRecord];
  @override
  final String wireName = 'TasksRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, TasksRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.dateCreated;
    if (value != null) {
      result
        ..add('date_created')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.isDone;
    if (value != null) {
      result
        ..add('isDone')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.taskTitle;
    if (value != null) {
      result
        ..add('task_title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.taskDescription;
    if (value != null) {
      result
        ..add('task_description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.todoSteps;
    if (value != null) {
      result
        ..add('todo_steps')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  TasksRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TasksRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'date_created':
          result.dateCreated = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'isDone':
          result.isDone = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'task_title':
          result.taskTitle = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'task_description':
          result.taskDescription = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'todo_steps':
          result.todoSteps.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$TasksRecord extends TasksRecord {
  @override
  final DateTime dateCreated;
  @override
  final bool isDone;
  @override
  final String taskTitle;
  @override
  final String taskDescription;
  @override
  final DocumentReference<Object> user;
  @override
  final BuiltList<String> todoSteps;
  @override
  final DocumentReference<Object> reference;

  factory _$TasksRecord([void Function(TasksRecordBuilder) updates]) =>
      (new TasksRecordBuilder()..update(updates)).build();

  _$TasksRecord._(
      {this.dateCreated,
      this.isDone,
      this.taskTitle,
      this.taskDescription,
      this.user,
      this.todoSteps,
      this.reference})
      : super._();

  @override
  TasksRecord rebuild(void Function(TasksRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TasksRecordBuilder toBuilder() => new TasksRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TasksRecord &&
        dateCreated == other.dateCreated &&
        isDone == other.isDone &&
        taskTitle == other.taskTitle &&
        taskDescription == other.taskDescription &&
        user == other.user &&
        todoSteps == other.todoSteps &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, dateCreated.hashCode), isDone.hashCode),
                        taskTitle.hashCode),
                    taskDescription.hashCode),
                user.hashCode),
            todoSteps.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TasksRecord')
          ..add('dateCreated', dateCreated)
          ..add('isDone', isDone)
          ..add('taskTitle', taskTitle)
          ..add('taskDescription', taskDescription)
          ..add('user', user)
          ..add('todoSteps', todoSteps)
          ..add('reference', reference))
        .toString();
  }
}

class TasksRecordBuilder implements Builder<TasksRecord, TasksRecordBuilder> {
  _$TasksRecord _$v;

  DateTime _dateCreated;
  DateTime get dateCreated => _$this._dateCreated;
  set dateCreated(DateTime dateCreated) => _$this._dateCreated = dateCreated;

  bool _isDone;
  bool get isDone => _$this._isDone;
  set isDone(bool isDone) => _$this._isDone = isDone;

  String _taskTitle;
  String get taskTitle => _$this._taskTitle;
  set taskTitle(String taskTitle) => _$this._taskTitle = taskTitle;

  String _taskDescription;
  String get taskDescription => _$this._taskDescription;
  set taskDescription(String taskDescription) =>
      _$this._taskDescription = taskDescription;

  DocumentReference<Object> _user;
  DocumentReference<Object> get user => _$this._user;
  set user(DocumentReference<Object> user) => _$this._user = user;

  ListBuilder<String> _todoSteps;
  ListBuilder<String> get todoSteps =>
      _$this._todoSteps ??= new ListBuilder<String>();
  set todoSteps(ListBuilder<String> todoSteps) => _$this._todoSteps = todoSteps;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  TasksRecordBuilder() {
    TasksRecord._initializeBuilder(this);
  }

  TasksRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dateCreated = $v.dateCreated;
      _isDone = $v.isDone;
      _taskTitle = $v.taskTitle;
      _taskDescription = $v.taskDescription;
      _user = $v.user;
      _todoSteps = $v.todoSteps?.toBuilder();
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TasksRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TasksRecord;
  }

  @override
  void update(void Function(TasksRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TasksRecord build() {
    _$TasksRecord _$result;
    try {
      _$result = _$v ??
          new _$TasksRecord._(
              dateCreated: dateCreated,
              isDone: isDone,
              taskTitle: taskTitle,
              taskDescription: taskDescription,
              user: user,
              todoSteps: _todoSteps?.build(),
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'todoSteps';
        _todoSteps?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TasksRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
