// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_card_db.dart';

// ignore_for_file: type=lint
class $JobCardsTable extends JobCards with TableInfo<$JobCardsTable, JobCard> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JobCardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _clientNameMeta =
      const VerificationMeta('clientName');
  @override
  late final GeneratedColumn<String> clientName = GeneratedColumn<String>(
      'client_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _technicianMeta =
      const VerificationMeta('technician');
  @override
  late final GeneratedColumn<String> technician = GeneratedColumn<String>(
      'technician', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _estimatedDateMeta =
      const VerificationMeta('estimatedDate');
  @override
  late final GeneratedColumn<DateTime> estimatedDate =
      GeneratedColumn<DateTime>('estimated_date', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Pending'));
  static const VerificationMeta _adminCommentMeta =
      const VerificationMeta('adminComment');
  @override
  late final GeneratedColumn<String> adminComment = GeneratedColumn<String>(
      'admin_comment', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        title,
        clientName,
        description,
        technician,
        estimatedDate,
        status,
        adminComment
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'job_cards';
  @override
  VerificationContext validateIntegrity(Insertable<JobCard> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('client_name')) {
      context.handle(
          _clientNameMeta,
          clientName.isAcceptableOrUnknown(
              data['client_name']!, _clientNameMeta));
    } else if (isInserting) {
      context.missing(_clientNameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('technician')) {
      context.handle(
          _technicianMeta,
          technician.isAcceptableOrUnknown(
              data['technician']!, _technicianMeta));
    } else if (isInserting) {
      context.missing(_technicianMeta);
    }
    if (data.containsKey('estimated_date')) {
      context.handle(
          _estimatedDateMeta,
          estimatedDate.isAcceptableOrUnknown(
              data['estimated_date']!, _estimatedDateMeta));
    } else if (isInserting) {
      context.missing(_estimatedDateMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('admin_comment')) {
      context.handle(
          _adminCommentMeta,
          adminComment.isAcceptableOrUnknown(
              data['admin_comment']!, _adminCommentMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  JobCard map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JobCard(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      clientName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}client_name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      technician: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}technician'])!,
      estimatedDate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}estimated_date'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      adminComment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}admin_comment']),
    );
  }

  @override
  $JobCardsTable createAlias(String alias) {
    return $JobCardsTable(attachedDatabase, alias);
  }
}

class JobCard extends DataClass implements Insertable<JobCard> {
  final int id;
  final String title;
  final String clientName;
  final String description;
  final String technician;
  final DateTime estimatedDate;
  final String status;
  final String? adminComment;
  const JobCard(
      {required this.id,
      required this.title,
      required this.clientName,
      required this.description,
      required this.technician,
      required this.estimatedDate,
      required this.status,
      this.adminComment});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['client_name'] = Variable<String>(clientName);
    map['description'] = Variable<String>(description);
    map['technician'] = Variable<String>(technician);
    map['estimated_date'] = Variable<DateTime>(estimatedDate);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || adminComment != null) {
      map['admin_comment'] = Variable<String>(adminComment);
    }
    return map;
  }

  JobCardsCompanion toCompanion(bool nullToAbsent) {
    return JobCardsCompanion(
      id: Value(id),
      title: Value(title),
      clientName: Value(clientName),
      description: Value(description),
      technician: Value(technician),
      estimatedDate: Value(estimatedDate),
      status: Value(status),
      adminComment: adminComment == null && nullToAbsent
          ? const Value.absent()
          : Value(adminComment),
    );
  }

  factory JobCard.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JobCard(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      clientName: serializer.fromJson<String>(json['clientName']),
      description: serializer.fromJson<String>(json['description']),
      technician: serializer.fromJson<String>(json['technician']),
      estimatedDate: serializer.fromJson<DateTime>(json['estimatedDate']),
      status: serializer.fromJson<String>(json['status']),
      adminComment: serializer.fromJson<String?>(json['adminComment']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'clientName': serializer.toJson<String>(clientName),
      'description': serializer.toJson<String>(description),
      'technician': serializer.toJson<String>(technician),
      'estimatedDate': serializer.toJson<DateTime>(estimatedDate),
      'status': serializer.toJson<String>(status),
      'adminComment': serializer.toJson<String?>(adminComment),
    };
  }

  JobCard copyWith(
          {int? id,
          String? title,
          String? clientName,
          String? description,
          String? technician,
          DateTime? estimatedDate,
          String? status,
          Value<String?> adminComment = const Value.absent()}) =>
      JobCard(
        id: id ?? this.id,
        title: title ?? this.title,
        clientName: clientName ?? this.clientName,
        description: description ?? this.description,
        technician: technician ?? this.technician,
        estimatedDate: estimatedDate ?? this.estimatedDate,
        status: status ?? this.status,
        adminComment:
            adminComment.present ? adminComment.value : this.adminComment,
      );
  JobCard copyWithCompanion(JobCardsCompanion data) {
    return JobCard(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      clientName:
          data.clientName.present ? data.clientName.value : this.clientName,
      description:
          data.description.present ? data.description.value : this.description,
      technician:
          data.technician.present ? data.technician.value : this.technician,
      estimatedDate: data.estimatedDate.present
          ? data.estimatedDate.value
          : this.estimatedDate,
      status: data.status.present ? data.status.value : this.status,
      adminComment: data.adminComment.present
          ? data.adminComment.value
          : this.adminComment,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JobCard(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('clientName: $clientName, ')
          ..write('description: $description, ')
          ..write('technician: $technician, ')
          ..write('estimatedDate: $estimatedDate, ')
          ..write('status: $status, ')
          ..write('adminComment: $adminComment')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, clientName, description,
      technician, estimatedDate, status, adminComment);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JobCard &&
          other.id == this.id &&
          other.title == this.title &&
          other.clientName == this.clientName &&
          other.description == this.description &&
          other.technician == this.technician &&
          other.estimatedDate == this.estimatedDate &&
          other.status == this.status &&
          other.adminComment == this.adminComment);
}

class JobCardsCompanion extends UpdateCompanion<JobCard> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> clientName;
  final Value<String> description;
  final Value<String> technician;
  final Value<DateTime> estimatedDate;
  final Value<String> status;
  final Value<String?> adminComment;
  const JobCardsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.clientName = const Value.absent(),
    this.description = const Value.absent(),
    this.technician = const Value.absent(),
    this.estimatedDate = const Value.absent(),
    this.status = const Value.absent(),
    this.adminComment = const Value.absent(),
  });
  JobCardsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String clientName,
    required String description,
    required String technician,
    required DateTime estimatedDate,
    this.status = const Value.absent(),
    this.adminComment = const Value.absent(),
  })  : title = Value(title),
        clientName = Value(clientName),
        description = Value(description),
        technician = Value(technician),
        estimatedDate = Value(estimatedDate);
  static Insertable<JobCard> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? clientName,
    Expression<String>? description,
    Expression<String>? technician,
    Expression<DateTime>? estimatedDate,
    Expression<String>? status,
    Expression<String>? adminComment,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (clientName != null) 'client_name': clientName,
      if (description != null) 'description': description,
      if (technician != null) 'technician': technician,
      if (estimatedDate != null) 'estimated_date': estimatedDate,
      if (status != null) 'status': status,
      if (adminComment != null) 'admin_comment': adminComment,
    });
  }

  JobCardsCompanion copyWith(
      {Value<int>? id,
      Value<String>? title,
      Value<String>? clientName,
      Value<String>? description,
      Value<String>? technician,
      Value<DateTime>? estimatedDate,
      Value<String>? status,
      Value<String?>? adminComment}) {
    return JobCardsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      clientName: clientName ?? this.clientName,
      description: description ?? this.description,
      technician: technician ?? this.technician,
      estimatedDate: estimatedDate ?? this.estimatedDate,
      status: status ?? this.status,
      adminComment: adminComment ?? this.adminComment,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (clientName.present) {
      map['client_name'] = Variable<String>(clientName.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (technician.present) {
      map['technician'] = Variable<String>(technician.value);
    }
    if (estimatedDate.present) {
      map['estimated_date'] = Variable<DateTime>(estimatedDate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (adminComment.present) {
      map['admin_comment'] = Variable<String>(adminComment.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JobCardsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('clientName: $clientName, ')
          ..write('description: $description, ')
          ..write('technician: $technician, ')
          ..write('estimatedDate: $estimatedDate, ')
          ..write('status: $status, ')
          ..write('adminComment: $adminComment')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $JobCardsTable jobCards = $JobCardsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [jobCards];
}

typedef $$JobCardsTableCreateCompanionBuilder = JobCardsCompanion Function({
  Value<int> id,
  required String title,
  required String clientName,
  required String description,
  required String technician,
  required DateTime estimatedDate,
  Value<String> status,
  Value<String?> adminComment,
});
typedef $$JobCardsTableUpdateCompanionBuilder = JobCardsCompanion Function({
  Value<int> id,
  Value<String> title,
  Value<String> clientName,
  Value<String> description,
  Value<String> technician,
  Value<DateTime> estimatedDate,
  Value<String> status,
  Value<String?> adminComment,
});

class $$JobCardsTableFilterComposer
    extends Composer<_$AppDatabase, $JobCardsTable> {
  $$JobCardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get clientName => $composableBuilder(
      column: $table.clientName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get technician => $composableBuilder(
      column: $table.technician, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get estimatedDate => $composableBuilder(
      column: $table.estimatedDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get adminComment => $composableBuilder(
      column: $table.adminComment, builder: (column) => ColumnFilters(column));
}

class $$JobCardsTableOrderingComposer
    extends Composer<_$AppDatabase, $JobCardsTable> {
  $$JobCardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get clientName => $composableBuilder(
      column: $table.clientName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get technician => $composableBuilder(
      column: $table.technician, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get estimatedDate => $composableBuilder(
      column: $table.estimatedDate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get adminComment => $composableBuilder(
      column: $table.adminComment,
      builder: (column) => ColumnOrderings(column));
}

class $$JobCardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $JobCardsTable> {
  $$JobCardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get clientName => $composableBuilder(
      column: $table.clientName, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get technician => $composableBuilder(
      column: $table.technician, builder: (column) => column);

  GeneratedColumn<DateTime> get estimatedDate => $composableBuilder(
      column: $table.estimatedDate, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get adminComment => $composableBuilder(
      column: $table.adminComment, builder: (column) => column);
}

class $$JobCardsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $JobCardsTable,
    JobCard,
    $$JobCardsTableFilterComposer,
    $$JobCardsTableOrderingComposer,
    $$JobCardsTableAnnotationComposer,
    $$JobCardsTableCreateCompanionBuilder,
    $$JobCardsTableUpdateCompanionBuilder,
    (JobCard, BaseReferences<_$AppDatabase, $JobCardsTable, JobCard>),
    JobCard,
    PrefetchHooks Function()> {
  $$JobCardsTableTableManager(_$AppDatabase db, $JobCardsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$JobCardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$JobCardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$JobCardsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> clientName = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> technician = const Value.absent(),
            Value<DateTime> estimatedDate = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> adminComment = const Value.absent(),
          }) =>
              JobCardsCompanion(
            id: id,
            title: title,
            clientName: clientName,
            description: description,
            technician: technician,
            estimatedDate: estimatedDate,
            status: status,
            adminComment: adminComment,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String title,
            required String clientName,
            required String description,
            required String technician,
            required DateTime estimatedDate,
            Value<String> status = const Value.absent(),
            Value<String?> adminComment = const Value.absent(),
          }) =>
              JobCardsCompanion.insert(
            id: id,
            title: title,
            clientName: clientName,
            description: description,
            technician: technician,
            estimatedDate: estimatedDate,
            status: status,
            adminComment: adminComment,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$JobCardsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $JobCardsTable,
    JobCard,
    $$JobCardsTableFilterComposer,
    $$JobCardsTableOrderingComposer,
    $$JobCardsTableAnnotationComposer,
    $$JobCardsTableCreateCompanionBuilder,
    $$JobCardsTableUpdateCompanionBuilder,
    (JobCard, BaseReferences<_$AppDatabase, $JobCardsTable, JobCard>),
    JobCard,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$JobCardsTableTableManager get jobCards =>
      $$JobCardsTableTableManager(_db, _db.jobCards);
}
