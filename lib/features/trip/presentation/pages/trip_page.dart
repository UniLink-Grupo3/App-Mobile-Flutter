import 'package:flutter/material.dart';
import 'package:profile_page/features/home/domain/entities/university_student_without_car.dart';

class TripPage extends StatelessWidget {
  const TripPage({
    super.key,
    required this.acceptedStudents,
    required this.onClear,
  });

  final List<UniversityStudentWithoutCar> acceptedStudents;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    if (acceptedStudents.isEmpty) {
      return const Center(
        child: Text(
          "No ha aceptado ninguna solicitud",
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }
    
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("Hola", style: TextStyle(fontSize: 20)),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: acceptedStudents.length,
            itemBuilder: (context, index) {
              final student = acceptedStudents[index];
              return Card(
                  elevation: 4,
                  margin: const EdgeInsets.all(8),
                  child: ListTile(
                    leading: Image.network(student.image, width: 50, height: 50),
                    title: Text(student.name),
                    subtitle: Text(" ${student.code}"),
                  ),
              );
            },
          ),
        ),
        if (acceptedStudents.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              onPressed: onClear,
              icon: const Icon(Icons.delete),
              label: const Text("Borrar solicitudes"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
            ),
          ),
      ],
    );
  }
}
