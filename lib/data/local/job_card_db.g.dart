// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_card_db.dart';

// ignore_for_file: type=lint
class $JobCardsTable extends JobCards with TableInfo<$JobCardsTable, JobCard> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $JobCardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _jobidMeta = const VerificationMeta('jobid');
  @override
  late final GeneratedColumn<int> jobid = GeneratedColumn<int>(
      'jobid', aliasedName, false,
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
  static const VerificationMeta _clientnameMeta =
      const VerificationMeta('clientname');
  @override
  late final GeneratedColumn<String> clientname = GeneratedColumn<String>(
      'clientname', aliasedName, false,
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
  static const VerificationMeta _estimateddateMeta =
      const VerificationMeta('estimateddate');
  @override
  late final GeneratedColumn<DateTime> estimateddate =
      GeneratedColumn<DateTime>('estimateddate', aliasedName, false,
          type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Pending'));
  static const VerificationMeta _admincommentMeta =
      const VerificationMeta('admincomment');
  @override
  late final GeneratedColumn<String> admincomment = GeneratedColumn<String>(
      'admincomment', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _syncedMeta = const VerificationMeta('synced');
  @override
  late final GeneratedColumn<bool> synced = GeneratedColumn<bool>(
      'synced', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("synced" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        jobid,
        title,
        clientname,
        description,
        technician,
        estimateddate,
        status,
        admincomment,
        synced
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
    if (data.containsKey('jobid')) {
      context.handle(
          _jobidMeta, jobid.isAcceptableOrUnknown(data['jobid']!, _jobidMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('clientname')) {
      context.handle(
          _clientnameMeta,
          clientname.isAcceptableOrUnknown(
              data['clientname']!, _clientnameMeta));
    } else if (isInserting) {
      context.missing(_clientnameMeta);
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
    if (data.containsKey('estimateddate')) {
      context.handle(
          _estimateddateMeta,
          estimateddate.isAcceptableOrUnknown(
              data['estimateddate']!, _estimateddateMeta));
    } else if (isInserting) {
      context.missing(_estimateddateMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('admincomment')) {
      context.handle(
          _admincommentMeta,
          admincomment.isAcceptableOrUnknown(
              data['admincomment']!, _admincommentMeta));
    }
    if (data.containsKey('synced')) {
      context.handle(_syncedMeta,
          synced.isAcceptableOrUnknown(data['synced']!, _syncedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {jobid};
  @override
  JobCard map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return JobCard(
      jobid: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}jobid'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      clientname: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}clientname'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      technician: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}technician'])!,
      estimateddate: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime, data['${effectivePrefix}estimateddate'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      admincomment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}admincomment']),
      synced: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}synced'])!,
    );
  }

  @override
  $JobCardsTable createAlias(String alias) {
    return $JobCardsTable(attachedDatabase, alias);
  }
}

class JobCard extends DataClass implements Insertable<JobCard> {
  final int jobid;
  final String title;
  final String clientname;
  final String description;
  final String technician;
  final DateTime estimateddate;
  final String status;
  final String? admincomment;
  final bool synced;
  const JobCard(
      {required this.jobid,
      required this.title,
      required this.clientname,
      required this.description,
      required this.technician,
      required this.estimateddate,
      required this.status,
      this.admincomment,
      required this.synced});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['jobid'] = Variable<int>(jobid);
    map['title'] = Variable<String>(title);
    map['clientname'] = Variable<String>(clientname);
    map['description'] = Variable<String>(description);
    map['technician'] = Variable<String>(technician);
    map['estimateddate'] = Variable<DateTime>(estimateddate);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || admincomment != null) {
      map['admincomment'] = Variable<String>(admincomment);
    }
    map['synced'] = Variable<bool>(synced);
    return map;
  }

  JobCardsCompanion toCompanion(bool nullToAbsent) {
    return JobCardsCompanion(
      jobid: Value(jobid),
      title: Value(title),
      clientname: Value(clientname),
      description: Value(description),
      technician: Value(technician),
      estimateddate: Value(estimateddate),
      status: Value(status),
      admincomment: admincomment == null && nullToAbsent
          ? const Value.absent()
          : Value(admincomment),
      synced: Value(synced),
    );
  }

  factory JobCard.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return JobCard(
      jobid: serializer.fromJson<int>(json['jobid']),
      title: serializer.fromJson<String>(json['title']),
      clientname: serializer.fromJson<String>(json['clientname']),
      description: serializer.fromJson<String>(json['description']),
      technician: serializer.fromJson<String>(json['technician']),
      estimateddate: serializer.fromJson<DateTime>(json['estimateddate']),
      status: serializer.fromJson<String>(json['status']),
      admincomment: serializer.fromJson<String?>(json['admincomment']),
      synced: serializer.fromJson<bool>(json['synced']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'jobid': serializer.toJson<int>(jobid),
      'title': serializer.toJson<String>(title),
      'clientname': serializer.toJson<String>(clientname),
      'description': serializer.toJson<String>(description),
      'technician': serializer.toJson<String>(technician),
      'estimateddate': serializer.toJson<DateTime>(estimateddate),
      'status': serializer.toJson<String>(status),
      'admincomment': serializer.toJson<String?>(admincomment),
      'synced': serializer.toJson<bool>(synced),
    };
  }

  JobCard copyWith(
          {int? jobid,
          String? title,
          String? clientname,
          String? description,
          String? technician,
          DateTime? estimateddate,
          String? status,
          Value<String?> admincomment = const Value.absent(),
          bool? synced}) =>
      JobCard(
        jobid: jobid ?? this.jobid,
        title: title ?? this.title,
        clientname: clientname ?? this.clientname,
        description: description ?? this.description,
        technician: technician ?? this.technician,
        estimateddate: estimateddate ?? this.estimateddate,
        status: status ?? this.status,
        admincomment:
            admincomment.present ? admincomment.value : this.admincomment,
        synced: synced ?? this.synced,
      );
  JobCard copyWithCompanion(JobCardsCompanion data) {
    return JobCard(
      jobid: data.jobid.present ? data.jobid.value : this.jobid,
      title: data.title.present ? data.title.value : this.title,
      clientname:
          data.clientname.present ? data.clientname.value : this.clientname,
      description:
          data.description.present ? data.description.value : this.description,
      technician:
          data.technician.present ? data.technician.value : this.technician,
      estimateddate: data.estimateddate.present
          ? data.estimateddate.value
          : this.estimateddate,
      status: data.status.present ? data.status.value : this.status,
      admincomment: data.admincomment.present
          ? data.admincomment.value
          : this.admincomment,
      synced: data.synced.present ? data.synced.value : this.synced,
    );
  }

  @override
  String toString() {
    return (StringBuffer('JobCard(')
          ..write('jobid: $jobid, ')
          ..write('title: $title, ')
          ..write('clientname: $clientname, ')
          ..write('description: $description, ')
          ..write('technician: $technician, ')
          ..write('estimateddate: $estimateddate, ')
          ..write('status: $status, ')
          ..write('admincomment: $admincomment, ')
          ..write('synced: $synced')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(jobid, title, clientname, description,
      technician, estimateddate, status, admincomment, synced);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is JobCard &&
          other.jobid == this.jobid &&
          other.title == this.title &&
          other.clientname == this.clientname &&
          other.description == this.description &&
          other.technician == this.technician &&
          other.estimateddate == this.estimateddate &&
          other.status == this.status &&
          other.admincomment == this.admincomment &&
          other.synced == this.synced);
}

class JobCardsCompanion extends UpdateCompanion<JobCard> {
  final Value<int> jobid;
  final Value<String> title;
  final Value<String> clientname;
  final Value<String> description;
  final Value<String> technician;
  final Value<DateTime> estimateddate;
  final Value<String> status;
  final Value<String?> admincomment;
  final Value<bool> synced;
  const JobCardsCompanion({
    this.jobid = const Value.absent(),
    this.title = const Value.absent(),
    this.clientname = const Value.absent(),
    this.description = const Value.absent(),
    this.technician = const Value.absent(),
    this.estimateddate = const Value.absent(),
    this.status = const Value.absent(),
    this.admincomment = const Value.absent(),
    this.synced = const Value.absent(),
  });
  JobCardsCompanion.insert({
    this.jobid = const Value.absent(),
    required String title,
    required String clientname,
    required String description,
    required String technician,
    required DateTime estimateddate,
    this.status = const Value.absent(),
    this.admincomment = const Value.absent(),
    this.synced = const Value.absent(),
  })  : title = Value(title),
        clientname = Value(clientname),
        description = Value(description),
        technician = Value(technician),
        estimateddate = Value(estimateddate);
  static Insertable<JobCard> custom({
    Expression<int>? jobid,
    Expression<String>? title,
    Expression<String>? clientname,
    Expression<String>? description,
    Expression<String>? technician,
    Expression<DateTime>? estimateddate,
    Expression<String>? status,
    Expression<String>? admincomment,
    Expression<bool>? synced,
  }) {
    return RawValuesInsertable({
      if (jobid != null) 'jobid': jobid,
      if (title != null) 'title': title,
      if (clientname != null) 'clientname': clientname,
      if (description != null) 'description': description,
      if (technician != null) 'technician': technician,
      if (estimateddate != null) 'estimateddate': estimateddate,
      if (status != null) 'status': status,
      if (admincomment != null) 'admincomment': admincomment,
      if (synced != null) 'synced': synced,
    });
  }

  JobCardsCompanion copyWith(
      {Value<int>? jobid,
      Value<String>? title,
      Value<String>? clientname,
      Value<String>? description,
      Value<String>? technician,
      Value<DateTime>? estimateddate,
      Value<String>? status,
      Value<String?>? admincomment,
      Value<bool>? synced}) {
    return JobCardsCompanion(
      jobid: jobid ?? this.jobid,
      title: title ?? this.title,
      clientname: clientname ?? this.clientname,
      description: description ?? this.description,
      technician: technician ?? this.technician,
      estimateddate: estimateddate ?? this.estimateddate,
      status: status ?? this.status,
      admincomment: admincomment ?? this.admincomment,
      synced: synced ?? this.synced,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (jobid.present) {
      map['jobid'] = Variable<int>(jobid.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (clientname.present) {
      map['clientname'] = Variable<String>(clientname.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (technician.present) {
      map['technician'] = Variable<String>(technician.value);
    }
    if (estimateddate.present) {
      map['estimateddate'] = Variable<DateTime>(estimateddate.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (admincomment.present) {
      map['admincomment'] = Variable<String>(admincomment.value);
    }
    if (synced.present) {
      map['synced'] = Variable<bool>(synced.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('JobCardsCompanion(')
          ..write('jobid: $jobid, ')
          ..write('title: $title, ')
          ..write('clientname: $clientname, ')
          ..write('description: $description, ')
          ..write('technician: $technician, ')
          ..write('estimateddate: $estimateddate, ')
          ..write('status: $status, ')
          ..write('admincomment: $admincomment, ')
          ..write('synced: $synced')
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
  Value<int> jobid,
  required String title,
  required String clientname,
  required String description,
  required String technician,
  required DateTime estimateddate,
  Value<String> status,
  Value<String?> admincomment,
  Value<bool> synced,
});
typedef $$JobCardsTableUpdateCompanionBuilder = JobCardsCompanion Function({
  Value<int> jobid,
  Value<String> title,
  Value<String> clientname,
  Value<String> description,
  Value<String> technician,
  Value<DateTime> estimateddate,
  Value<String> status,
  Value<String?> admincomment,
  Value<bool> synced,
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
  ColumnFilters<int> get jobid => $composableBuilder(
      column: $table.jobid, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get clientname => $composableBuilder(
      column: $table.clientname, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get technician => $composableBuilder(
      column: $table.technician, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get estimateddate => $composableBuilder(
      column: $table.estimateddate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get admincomment => $composableBuilder(
      column: $table.admincomment, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnFilters(column));
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
  ColumnOrderings<int> get jobid => $composableBuilder(
      column: $table.jobid, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get clientname => $composableBuilder(
      column: $table.clientname, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get technician => $composableBuilder(
      column: $table.technician, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get estimateddate => $composableBuilder(
      column: $table.estimateddate,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get admincomment => $composableBuilder(
      column: $table.admincomment,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get synced => $composableBuilder(
      column: $table.synced, builder: (column) => ColumnOrderings(column));
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
  GeneratedColumn<int> get jobid =>
      $composableBuilder(column: $table.jobid, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get clientname => $composableBuilder(
      column: $table.clientname, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get technician => $composableBuilder(
      column: $table.technician, builder: (column) => column);

  GeneratedColumn<DateTime> get estimateddate => $composableBuilder(
      column: $table.estimateddate, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get admincomment => $composableBuilder(
      column: $table.admincomment, builder: (column) => column);

  GeneratedColumn<bool> get synced =>
      $composableBuilder(column: $table.synced, builder: (column) => column);
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
            Value<int> jobid = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> clientname = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> technician = const Value.absent(),
            Value<DateTime> estimateddate = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> admincomment = const Value.absent(),
            Value<bool> synced = const Value.absent(),
          }) =>
              JobCardsCompanion(
            jobid: jobid,
            title: title,
            clientname: clientname,
            description: description,
            technician: technician,
            estimateddate: estimateddate,
            status: status,
            admincomment: admincomment,
            synced: synced,
          ),
          createCompanionCallback: ({
            Value<int> jobid = const Value.absent(),
            required String title,
            required String clientname,
            required String description,
            required String technician,
            required DateTime estimateddate,
            Value<String> status = const Value.absent(),
            Value<String?> admincomment = const Value.absent(),
            Value<bool> synced = const Value.absent(),
          }) =>
              JobCardsCompanion.insert(
            jobid: jobid,
            title: title,
            clientname: clientname,
            description: description,
            technician: technician,
            estimateddate: estimateddate,
            status: status,
            admincomment: admincomment,
            synced: synced,
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
