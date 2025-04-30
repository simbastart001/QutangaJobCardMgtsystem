import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'job_card_db.g.dart';

class JobCards extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get title => text()();

  TextColumn get clientName => text()();

  TextColumn get description => text()();

  TextColumn get technician => text()();

  DateTimeColumn get estimatedDate => dateTime()();

  TextColumn get status => text().withDefault(const Constant('Pending'))();

  TextColumn get adminComment => text().nullable()();
}

@DriftDatabase(tables: [JobCards])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<JobCard>> getAllJobCards() => select(jobCards).get();

  Future<int> insertJobCard(JobCardsCompanion jobCard) =>
      into(jobCards).insert(jobCard);

  Future updateStatus(int id, String status, String? comment) {
    return (update(jobCards)..where((tbl) => tbl.id.equals(id))).write(
        JobCardsCompanion(status: Value(status), adminComment: Value(comment)));
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // First, try to load the sqlite3 library
    try {
      // This ensures that the sqlite3 library is properly loaded
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();

      // This line prints SQLite version to verify it's loaded successfully
      final sqliteVersion = sqlite3.version;
      print('***** SQLite version: $sqliteVersion');
    } catch (e) {
      print('***** Error initializing SQLite: $e');
    }

    // Get a location for the database file
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'job_cards.sqlite'));

    return NativeDatabase(
      file,
      // Enable foreign keys if needed
      setup: (db) => db.execute('PRAGMA foreign_keys = ON'),
    );
  });
}
