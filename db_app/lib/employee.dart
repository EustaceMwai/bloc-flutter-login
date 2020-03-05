import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import './run.dart';

class Employee{

  final int id;
  final String name;
  final String jobDescription;

  Employee({this.id, this.name, this.jobDescription});

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'name': name,
      'jobDescription' : jobDescription,
    };
  }


  }











