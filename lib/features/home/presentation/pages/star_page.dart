import 'package:flutter/material.dart';
import 'package:profile_page/features/home/domain/entities/university_student_without_car.dart';
import 'package:profile_page/features/home/presentation/pages/request_trip_page.dart';
import 'package:profile_page/features/home/presentation/pages/star_trip_page.dart';


class StarPage extends StatefulWidget {
  final List<UniversityStudentWithoutCar> students;
  final List<UniversityStudentWithoutCar> acceptedStudents; //lista de cards aceptados
  final Function(UniversityStudentWithoutCar) onAccept;
  
  const StarPage({
    super.key,
    required this.students,
    required this.acceptedStudents, // Para pasar la lista de card aceptados
    required this.onAccept,
  });

  @override
  State<StarPage> createState() => _StarPageState();
}

class _StarPageState extends State<StarPage> {
  //bool _statePage = true;
  static bool _statePage = true; //Se mantiene mientras la app siga viva
  
  void _handleAccept(UniversityStudentWithoutCar student) {
    widget.onAccept(student);
    setState(() {}); // Fuerza reconstrucción por si acaso
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _statePage
        ? StartTripPage(onStartPressed: (){
            setState(() {
              _statePage = false;
            });
          },
          acceptedStudents: widget.acceptedStudents, // nuevo parámetr
          )
        : RequestTripPage(onStopPressed: (){
            setState(() {
              _statePage = true;
            });
          },
          onAccept: _handleAccept,
          students: widget.students,
          ),  
    );
  }
}
