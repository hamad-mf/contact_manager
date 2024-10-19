import 'package:sqflite/sqflite.dart';

class HomeScreenController {
  static late Database contactDatabase;
  static List<Map> contactsList = [];

  static Future initDb() async {
    // open the database
    contactDatabase = await openDatabase("contactData.db", version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE Contacts (id INTEGER PRIMARY KEY, name TEXT, phone TEXT)');
    });
  }

  static Future addContact(String name, String phone) async {
    await contactDatabase.rawInsert(
      'INSERT INTO Contacts (name, phone) VALUES(?, ?)',
      [name, phone],
    );
  }

  static Future getAllContacts() async {
    contactsList = await contactDatabase.rawQuery('SELECT * FROM Contacts');
    print(contactsList);
  }

  static Future removeContact(int id) async {
    await contactDatabase.rawDelete('DELETE FROM Contacts WHERE id =?', [id]);
    getAllContacts();
  }
}
