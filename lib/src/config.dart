const gameWidth = 820.0;
const gameHeight = 1600.0;

const savedData = {
  "level": 10,
  "diamonds": 30,
  "coins": 100,
};

class Level {
  final String name;
  final int level;
  final List<String> words;
  final List<String> extraWords;
  final String backgroundImage;

  Level({
    required this.name,
    required this.level,
    required this.words,
    required this.extraWords,
    required this.backgroundImage,
  });
}

List<Level> levels = [
  Level(
    name: "Gabala",
    level: 1,
    words: ["imtina", "min", "tin", "amin", "mina"],
    extraWords: [],
    backgroundImage: "images/baku-1.jpg",
  ),
  Level(
    name: "Baku",
    level: 2,
    words: ["sonra", "son", "sara", "sar"],
    extraWords: ["onar", "ona"],
    backgroundImage: "images/baku-2.jpg",
  ),
  Level(
    name: "Gabala",
    level: 3,
    words: ["imtina", "min", "tin", "amin", "mina"],
    extraWords: [],
    backgroundImage: "images/baku-1.jpg",
  ),
  Level(
    name: "Baku",
    level: 4,
    words: ["sonra", "son", "sara", "sar"],
    extraWords: ["onar", "ona"],
    backgroundImage: "images/baku-2.jpg",
  ),
  Level(
    name: "Gabala",
    level: 5,
    words: ["imtina", "min", "tin", "amin", "mina"],
    extraWords: [],
    backgroundImage: "images/baku-1.jpg",
  ),
  Level(
    name: "Baku",
    level: 6,
    words: ["sonra", "son", "sara", "sar"],
    extraWords: ["onar", "ona"],
    backgroundImage: "images/baku-2.jpg",
  ),
  Level(
    name: "Gabala",
    level: 7,
    words: ["imtina", "min", "tin", "amin", "mina"],
    extraWords: [],
    backgroundImage: "images/baku-1.jpg",
  ),
  Level(
    name: "Baku",
    level: 8,
    words: ["sonra", "son", "sara", "sar"],
    extraWords: ["onar", "ona"],
    backgroundImage: "images/baku-2.jpg",
  ),
  Level(
    name: "Gabala",
    level: 9,
    words: ["imtina", "min", "tin", "amin", "mina"],
    extraWords: [],
    backgroundImage: "images/baku-1.jpg",
  ),
  Level(
    name: "Baku",
    level: 10,
    words: ["sonra", "son", "sara", "sar"],
    extraWords: ["onar", "ona"],
    backgroundImage: "images/baku-2.jpg",
  ),
];
