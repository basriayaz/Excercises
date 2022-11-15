// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
    Post({
        required this.name,
        required this.type,
        required this.muscle,
        required this.equipment,
        required this.difficulty,
        required this.instructions,
    });

    String name;
    String type;
    String muscle;
    String equipment;
    String difficulty;
    String instructions;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        name: json["name"],
        type: json["type"],
        muscle: json["muscle"],
        equipment: json["equipment"],
        difficulty: json["difficulty"],
        instructions: json["instructions"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "muscle": muscle,
        "equipment": equipment,
        "difficulty": difficulty,
        "instructions": instructions,
    };
}
