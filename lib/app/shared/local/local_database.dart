import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sr_project_flutter/app/features/auth/data/models/app_user.dart';

class LocalDatabase {
  static final _DATA_BASE_NAME = "cart.db";
  static final _DATA_BASE_VERSION = 1;

  static final APP_USER_TABLE = 'app_user';
  static final COLUMN_ID = 'id';
  static final COLUMN_HIT = 'hit';

  static final APP_USER_USERNAME_COLUMN = 'app_user_username';
  static final APP_USER_EMAIL_COLUMN = 'app_user_email';
  static final APP_USER_ROLE_COLUMN = 'app_user_role';
  static final APP_USER_PROFILEIMAGEURL_COLUMN = 'app_user_profileImageUrl';
  static final APP_USER_PHONE_COLUMN = 'app_user_phoneNumber';
  static final APP_USER_COUNTRYCODE_COLUMN = 'app_user_countryCode';

  LocalDatabase._privateConstructor();
  static final LocalDatabase instance = LocalDatabase._privateConstructor();
  static late Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _DATA_BASE_NAME);
    return await openDatabase(path,
        version: _DATA_BASE_VERSION,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $APP_USER_TABLE (
            $COLUMN_ID STRING NOT NULL,
            $APP_USER_USERNAME_COLUMN STRING NOT NULL,
            $APP_USER_EMAIL_COLUMN STRING NOT NULL,
            $APP_USER_ROLE_COLUMN STRING NOT NULL,
            $APP_USER_PROFILEIMAGEURL_COLUMN STRING NOT NULL,
            $APP_USER_PHONE_COLUMN STRING NOT NULL,
            $APP_USER_COUNTRYCODE_COLUMN STRING NOT NULL,
            $COLUMN_HIT INTEGER NOT NULL
          )''');
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    if (oldVersion < newVersion) {
      db.execute("DELETE TABLE $APP_USER_TABLE;");
    }
  }

 static Future<int?> insertUser(String table, AppUser appUser) async {
    Database? db = await instance.database;
    var res = await db?.insert(table, {
      '$COLUMN_ID': appUser.id,
      '$APP_USER_USERNAME_COLUMN': appUser.username,
      '$APP_USER_EMAIL_COLUMN': appUser.email,
      '$APP_USER_ROLE_COLUMN': appUser.roles.last,
      '$APP_USER_PROFILEIMAGEURL_COLUMN': appUser.profileImageUrl,
      '$APP_USER_PHONE_COLUMN': appUser.phoneNumber,
      '$APP_USER_COUNTRYCODE_COLUMN': appUser.countryCode,
      '$COLUMN_HIT': 0,
    });
    return res;
  }

 static Future<List<Map<String, dynamic>>?> getAllData(String table) async {
    Database? db = await instance.database;
    var res = await db?.query(table, orderBy: "$COLUMN_ID DESC");
    return res;
  }
}
