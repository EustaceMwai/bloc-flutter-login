import 'package:flutter/material.dart';
import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import './employee.dart';

void main() async {
  //open my database
  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'employee_database.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE employees(id INTEGER PRIMARY KEY, name TEXT , jobDescription TEXT)",
      );
    },
    version: 1,
  );

  Future<void> insertEmployee(Employee employee) async {
    final Database db = await database;

    await db.insert(
      'employees',
      employee.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //creating employee and inserting
  final eustero = Employee(
    id: 1,
    name: 'Eustero',
    jobDescription: 'Programmer',
  );
  await insertEmployee(eustero);

  Future<List<Employee>> employees() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('employees');

    return List.generate(maps.length, (i) {
      return Employee(
        id: maps[i]['id'],
        name: maps[i]['name'],
        jobDescription: maps[i]['jobDescription'],
      );
    });
  }

  print(await employees());

  Future<void> updateEmployee(Employee employee) async {
    final db = await database;

    await db.update('employees', employee.toMap(),
        where: "id = 1", whereArgs: [employee.id]);

  }

  await updateEmployee(Employee(
    id: 1,
    name: 'Eustero',
    jobDescription: 'Manager'
  ));

  print(await employees());

  Future<void> deleteEmployee(Employee employee) async {
    final db = await database;

    await db.delete('employees',
        where: "id = 1", whereArgs: [employee.id]);

  }





}
