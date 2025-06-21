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
        Expanded(
          child: ListView.builder(
            itemCount: acceptedStudents.length,
            itemBuilder: (context, index) {
              final student = acceptedStudents[index];
              return Card(
                elevation: 4,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                      child: Row(
                        children: [
                          const Icon(Icons.people, size: 30, color: Color.fromARGB(255, 36, 29, 232)),
                          const SizedBox(width: 5),
                          Text("${student.numberPeople}", style: TextStyle(fontSize: 23)),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.grey[200], // Fondo claro, puedes cambiarlo
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(student.image, width: 100, height: 100),
                          SizedBox(width: 30), // Separación 
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.person, size: 20),
                                  const SizedBox(width: 5),
                                  Text(" ${student.name}"),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.my_location, size: 20),
                                  const SizedBox(width: 5),
                                  Text(" ${student.pickup}"),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.pin_drop, size: 20),
                                  const SizedBox(width: 5),
                                  Text(" ${student.destination}"),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.payments, size: 20),
                                  const SizedBox(width: 5),
                                  Text(" ${student.price}"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("${student.code} - ${student.university}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold, // Negrita
                            color: Colors.deepPurple, // Color del texto
                          ),
                          ),
                        ],
                      ),
                    ),
                  ],
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
