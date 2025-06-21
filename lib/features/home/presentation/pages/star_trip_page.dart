import 'package:flutter/material.dart';
import 'package:profile_page/features/home/domain/entities/university_student_without_car.dart';


class StartTripPage extends StatelessWidget {
  final VoidCallback onStartPressed;
  final List<UniversityStudentWithoutCar> acceptedStudents;
  
  const StartTripPage({
    super.key,
    required this.onStartPressed,
    required this.acceptedStudents,
  });

  @override
  Widget build(BuildContext context) {
    final bool isButtonDisabled = acceptedStudents.isNotEmpty; // lógica
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Center(
            child: Text(
              "¡Empezemos con el Viaje!", 
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
            )
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text("Ingresa tu destino :", style: TextStyle(color: Color.fromARGB(255, 243, 10, 33), fontSize: 22)),
              ),
              SizedBox(height: 12),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: 'Ej: UPC - San Miguel',
                  prefixIcon: Icon(Icons.directions_car),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Center(
            child: ElevatedButton(
              onPressed: isButtonDisabled ? null : onStartPressed, //antes; onStartPressed
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 3, 143, 33),
                  shape: const CircleBorder(), //Forma circular
                  padding: const EdgeInsets.all(80), // Tamaño del botón
                  elevation: 10, // Sombra
                ),
              child: Text(
                //"INICIAR", style: TextStyle(color: Color.fromARGB(255, 238, 238, 236), fontSize: 20)
                isButtonDisabled ? 'Ya estás en un viaje' : 'Iniciar viaje',
                style: const TextStyle(color: Color.fromARGB(255, 238, 238, 236), fontSize: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
