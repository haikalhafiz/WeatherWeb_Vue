class Quizquestion {

  final String category;
  final String type;
  final String difficulty;
  final String question;
  final String correctAns;
  final String incorrectAns;

  Quizquestion({this.category,this.type,this.difficulty,this.question,this.correctAns,this.incorrectAns});

  factory Quizquestion.fromJson(Map < String,dynamic>json){
    return Quizquestion(

      category: json["category"],
      type: json["type"],
      difficulty: json["difficulty"],
      question: json["question"],
      correctAns: json["correct_answer"],
      incorrectAns: json["incorrect_answers"],
    );
  }

      static List<Quizquestion> filmsFromJson(dynamic json) {

      var Results = json["results"];

      if (Results != null) {
      var Results = new List<Quizquestion>();
      Results.forEach((v) {

      Results.add(Quizquestion.fromJson(v));
      });
      return Results;
      }
      return List<Quizquestion>();
      }
      }
}