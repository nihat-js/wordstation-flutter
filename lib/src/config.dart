const gameWidth = 820.0;
const gameHeight = 1600.0;

class Level {
  final String name;
  final int level;
  final List<String> words;
  final List<String> extraWords;
  final String backgroundImage;
  late final List<String> letters;

  Level({
    required this.name,
    required this.level,
    required this.words,
    required this.extraWords,
    required this.backgroundImage,
  }) {
    List<String> foo = [];
    words.forEach((word) {
      word.split("").forEach((letter) {
        if (!foo.contains(letter)) {
          foo.add(letter);
        }
      });
    });
    letters = foo;
  }
}

List<Level> levels = [
  Level(
    name: "Gabala",
    level: 1,
    words: ["dar", "kadr", "kar"],
    extraWords: [],
    // letters: ["k", "a", "r", "d"],
    backgroundImage: "images/gabala-1.jpg",
  ),
  Level(
    name: "Baku",
    level: 2,
    words: ["inad", "adi", "din"],
    // letters: ["i", "n", "a", "d"],
    extraWords: [],
    backgroundImage: "images/gabala-2.jpg",
  ),
  Level(
    name: "Gabala",
    level: 3,
    words: ["qara", "araq", "ara"],
    // letters: ["a", "r", "a", "q"],
    extraWords: [],
    backgroundImage: "images/baku-1.jpg",
  ),
  Level(
    name: "Baku",
    level: 4,
    words: ["rota", "tor", "orta", "tar"],
    // letters: ["r", "o", "t", "a"],
    extraWords: ["onar", "ona"],
    backgroundImage: "images/baku-2.jpg",
  ),
  Level(
    name: "Gabala",
    level: 5,
    words: ["tam", "ata", "atma", "mat"],
    // letters: ["a", "t", "m", "a"],
    extraWords: [],
    backgroundImage: "images/baku-3.jpg",
  ),

  // bura qeder islemelidi
  Level(
    name: "Baku",
    level: 6,
    words: ["sonra", "son", "sara", "sar"],
    extraWords: ["onar", "ona"],
    // letters: [],
    backgroundImage: "images/baku-2.jpg",
  ),
  Level(
    name: "Gabala",
    level: 7,
    words: ["imtina", "min", "tin", "amin", "mina"],
    extraWords: [],
    // letters: [],
    backgroundImage: "images/baku-1.jpg",
  ),
  Level(
    name: "Baku",
    level: 8,
    words: ["sonra", "son", "sara", "sar"],
    extraWords: ["onar", "ona"],
    // letters: [],
    backgroundImage: "images/baku-2.jpg",
  ),
  Level(
    name: "Gabala",
    level: 9,
    words: ["imtina", "min", "tin", "amin", "mina"],
    extraWords: [],
    // letters: [],
    backgroundImage: "images/baku-1.jpg",
  ),
  Level(
    name: "Baku",
    level: 10,
    words: ["sonra", "son", "sara", "sar"],
    extraWords: ["onar", "ona"],
    // letters: [],
    backgroundImage: "images/baku-2.jpg",
  ),
];
