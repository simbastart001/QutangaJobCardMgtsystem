import 'package:drift/drift.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'job_card_db.g.dart';

class JobCards extends Table {
  IntColumn get jobid => integer().autoIncrement()();

  TextColumn get title => text()(); // Required
  TextColumn get clientname => text()(); // Required
  TextColumn get description => text()(); // Required
  TextColumn get technician => text()(); // Required
  DateTimeColumn get estimateddate => dateTime()(); // Required
  TextColumn get status =>
      text().withDefault(const Constant('Pending'))(); // Required
  TextColumn get admincomment => text().nullable()(); // Optional
  BoolColumn get synced =>
      boolean().withDefault(const Constant(false))(); // Required
}

@DriftDatabase(tables: [JobCards])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1; // Clean version for fresh dev start

  Future<List<JobCard>> getAllJobCards() => select(jobCards).get();

  Future<List<JobCard>> getUnsyncedJobCards() =>
      (select(jobCards)..where((tbl) => tbl.synced.equals(false))).get();

  Future<int> insertJobCard(JobCardsCompanion jobCard) =>
      into(jobCards).insert(jobCard);

  Future updateStatus(int id, String status, String? comment) {
    return (update(jobCards)..where((tbl) => tbl.jobid.equals(id))).write(
      JobCardsCompanion(
        status: Value(status),
        admincomment: Value(comment),
      ),
    );
  }

  Future markAsSynced(int id) {
    return (update(jobCards)..where((tbl) => tbl.jobid.equals(id)))
        .write(JobCardsCompanion(synced: const Value(true)));
  }

  Future<List<JobCard>> getJobCardsByDateRange(DateTime start, DateTime end) {
    return (select(jobCards)
          ..where((tbl) =>
              tbl.estimateddate.isBiggerOrEqualValue(start) &
              tbl.estimateddate.isSmallerOrEqualValue(end)))
        .get();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    try {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
      final sqliteVersion = sqlite3.version;
      print('***** SQLite version: $sqliteVersion');
    } catch (e) {
      print('***** Error initializing SQLite: $e');
    }
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'job_cards.sqlite'));
    return NativeDatabase(
      file,
      setup: (db) => db.execute('PRAGMA foreign_keys = ON'),
    );
  });
}
