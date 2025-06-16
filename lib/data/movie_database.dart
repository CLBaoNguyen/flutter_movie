import 'dart:async';

import 'package:flutter_movie/data/services/api/model/movie.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MovieDatabase {
  static final MovieDatabase instance = MovieDatabase._internal();

  static Database? _database;

  MovieDatabase._internal();

  final StreamController<List<Movie>> _moviesStream =
      StreamController<List<Movie>>.broadcast();

  Stream<List<Movie>> get moviesStream => _moviesStream.stream;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'movie.db');
    return await openDatabase(path, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, _) async {
    return await db.execute('''
        CREATE TABLE movies (
          trackId INTEGER PRIMARY KEY,
          trackName TEXT,
          artworkUrl100 TEXT,
          longDescription TEXT,
          currency TEXT,
          primaryGenreName TEXT,
          trackPrice REAL,
          artistName TEXT
        )
      ''');
  }

  Future<void> loadInitialMovies() async {
    _notifyMoviesStream();
  }

  Future<void> insertMovie(Movie movie) async {
    final db = await database;
    await db.insert(
      'movies',
      movie.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    _notifyMoviesStream();
  }

  Future<void> deleteMovie(int trackId) async {
    final db = await database;
    await db.delete('movies', where: 'trackId = ?', whereArgs: [trackId]);
    _notifyMoviesStream();
  }

  Future<void> _notifyMoviesStream() async {
    final db = await database;
    final movies = await db
        .query('movies')
        .then((maps) => maps.map((map) => Movie.fromJson(map)).toList());
    _moviesStream.add(movies);
  }
}
