import 'package:flutter/material.dart';
import 'package:profile_page/features/trip/presentation/pages/trip_page.dart';
import 'package:profile_page/features/home/domain/entities/university_student_without_car.dart';
import 'package:profile_page/features/home/presentation/pages/star_page.dart';
import 'package:profile_page/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
  final List<UniversityStudentWithoutCar> _students = [
    UniversityStudentWithoutCar(
      id: 1,
      name: "Juan Perez",
      code: "A",
      university: "Universidad Nacional",
      image: "https://blog.ucsp.edu.pe/hs-fs/hubfs/estudiante%20universitario.jpg?width=1200&height=750&name=estudiante%20universitario.jpg",
      numberPeople: 3,
      destination: "Centro Comercial",
      pickup: "Parque Central",
      price: 5000,
    ),
    UniversityStudentWithoutCar(
      id: 2,
      name: "Maria Lopez",
      code: "B",
      university: "Universidad Estatal",
      image: "https://images.vexels.com/media/users/3/137962/isolated/preview/4e0f260b86240ce11d2a7796cbb77bcd-icono-de-transporte-de-coche-plano.png",
      numberPeople: 2,
      destination: "Plaza Mayor",
      pickup: "Estadio Municipal",
      price: 3000,
    ),
    UniversityStudentWithoutCar(
      id: 3,
      name: "Juan Perez",
      code: "C",
      university: "Universidad Nacional",
      image: "https://blog.ucsp.edu.pe/hs-fs/hubfs/estudiante%20universitario.jpg?width=1200&height=750&name=estudiante%20universitario.jpg",
      numberPeople: 3,
      destination: "Centro Comercial",
      pickup: "Parque Central",
      price: 5000,
    ),
    UniversityStudentWithoutCar(
      id: 4,
      name: "Maria Lopez",
      code: "D",
      university: "Universidad Estatal",
      image: "https://images.vexels.com/media/users/3/137962/isolated/preview/4e0f260b86240ce11d2a7796cbb77bcd-icono-de-transporte-de-coche-plano.png",
      numberPeople: 2,
      destination: "Plaza Mayor",
      pickup: "Estadio Municipal",
      price: 3000,
    ),
  ];

  final List<UniversityStudentWithoutCar> _acceptedStudents = [];

  void _handleAccept(UniversityStudentWithoutCar student) {
    setState(() {
      _students.remove(student);
      _acceptedStudents.add(student);
    });
  }

  void _clearAcceptedStudents() {
    setState(() {
      _acceptedStudents.clear();
    });
  }

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      StarPage(
        students: _students,
        acceptedStudents: _acceptedStudents, // pasas la lista card aceptados
        onAccept: _handleAccept,
      ),
      TripPage(
        acceptedStudents: _acceptedStudents,
        onClear: _clearAcceptedStudents,
      ),
      ProfilePage(),
    ];

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 158, 148, 148),
            ),
            child: Row(
              children: [
                Image.asset('assets/logo.jpg'),
                const SizedBox(width: 10),
                const Text("RideUp", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Conócenos"),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(child: pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.travel_explore), label: 'Trip'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
