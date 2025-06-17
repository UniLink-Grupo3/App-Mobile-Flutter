import 'package:flutter/material.dart';
import 'package:profile_page/features/home/domain/entities/university_student_without_car.dart';

class StudentCardView extends StatelessWidget {
  const StudentCardView({super.key, required this.student, required this.onAccept});
  final UniversityStudentWithoutCar student;
  final VoidCallback onAccept;

  @override
  Widget build(BuildContext context) {
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //FilledButton(onPressed: (){}, child: const Text("Aceptar")),
                    FilledButton(
                      onPressed: onAccept,
                      style: FilledButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.all(10), // Ajusta el tamaño del botón
                      ),
                    child: const Icon(Icons.check, color: Colors.white),
                    ),
                    const SizedBox(width: 10),
                    FilledButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 220, 11, 11),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.all(10), // Ajusta el tamaño del botón
                      ),
                    child: const Icon(Icons.close, color: Colors.white),
                    ),
                  ],
                ),
          ),
        ],
      ),
    );
  }
}
