// 1. موديل السؤال
class EmployeeQuestion {
  final int id;
  final int employeeId;
  final String question;

  EmployeeQuestion({
    required this.id,
    required this.employeeId,
    required this.question,
  });

  factory EmployeeQuestion.fromJson(Map<String, dynamic> json) {
    return EmployeeQuestion(
      id: json['id'],
      employeeId: json['employee_id'],
      question: json['question'],
    );
  }
}
