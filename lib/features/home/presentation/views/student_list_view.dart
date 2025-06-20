import 'package:flutter/material.dart';
import 'package:profile_page/features/home/domain/entities/university_student_without_car.dart';
import 'package:profile_page/features/home/presentation/views/student_car_view.dart';


class StudentListView extends StatefulWidget {
  const StudentListView({super.key, required this.students, required this.onAccept});
  final List<UniversityStudentWithoutCar> students;
  final Function(UniversityStudentWithoutCar) onAccept;

  @override
  State<StudentListView> createState() => _StudentListViewState();
}

class _StudentListViewState extends State<StudentListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
      itemCount: widget.students.length, // Se coloca widget para acceder a la lista de estudiantes
      //gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
      itemBuilder: (context, index){
        //final UniversityStudentWithoutCar student = widget.students[index];
        final student = widget.students[index];
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: StudentCardView(
            student: student,
            onAccept: () => widget.onAccept(student),
          ),
        );
      },
    );
  }
}
