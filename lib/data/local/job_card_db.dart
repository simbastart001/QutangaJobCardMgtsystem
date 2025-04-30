import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

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
    final dir = await getApplicationDocumentsDirectory();
    final path = p.join(dir.path, 'job_cards.sqlite');
    return NativeDatabase(File(path));
  });
}
