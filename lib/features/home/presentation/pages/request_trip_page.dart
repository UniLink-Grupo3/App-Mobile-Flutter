import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/home/domain/entities/university_student_without_car.dart';
import 'package:flutter_application_1/features/home/presentation/views/student_list_view.dart';


class RequestTripPage extends StatefulWidget {
  final VoidCallback onStopPressed;
  //nuevo
  final Function(UniversityStudentWithoutCar) onAccept;

  //nuevo
  final List<UniversityStudentWithoutCar> students;

  const RequestTripPage({
    super.key, 
    required this.onStopPressed, 
    required this.onAccept, 
    required this.students,
  });

  @override
  State<RequestTripPage> createState() => _RequestTripPageState();
}

class _RequestTripPageState extends State<RequestTripPage> {
  // ANTES ESTABA LA LISTA AQUI

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: ElevatedButton(
              onPressed: widget.onStopPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 230, 19, 4),
                shape: const CircleBorder(), //Forma circular
                padding: const EdgeInsets.all(40), // Tamaño del botón
                elevation: 10, // Sombra
              ),
              child: const Text("DETENERSE", style: TextStyle(color: Color.fromARGB(255, 238, 238, 236))),
            ),
          ),
        ),
        Expanded(child: StudentListView(
          students: widget.students, 
          onAccept: widget.onAccept,
        )),
      ],
    );
  }
}
