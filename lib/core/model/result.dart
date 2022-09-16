class Result {
  double? gpa;
  int? year;
  int? semester;
  String? studentName;
  Result({this.year, this.semester, this.studentName, this.gpa});

  factory Result.fromJson(Map<String, dynamic> json)=> Result(
    year: json['year'] as int?,
    semester: json['semester'] as int?,
    studentName: json['studentName'] as String?,
     gpa: json['gpa'] as double?,
  );

  Map<String, dynamic> toJson()=>{
    'year': year,
    'semester': semester,
    'studentName': studentName,
    'gpa': gpa,
  };

}
