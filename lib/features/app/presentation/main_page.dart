import 'package:flutter/material.dart';
import 'package:profile_page/features/trip/presentation/pages/trip_page.dart';
import 'package:profile_page/features/home/domain/entities/university_student_without_car.dart';
import 'package:profile_page/features/home/presentation/pages/star_page.dart';
import 'package:profile_page/features/profile/presentation/pages/profile_page.dart';

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
      code: "U20192B548",
      university: "UPC",
      image: "https://media.istockphoto.com/id/1438969575/es/foto/joven-estudiante-universitario-sonriente-con-auriculares-de-pie-en-un-aula.jpg?s=612x612&w=is&k=20&c=8UfEA51tCSP2D_JQ-vP_dMylcRPBM5WcVCpTVGsJjVI=",
      numberPeople: 3,
      destination: "UPC",
      pickup: "Av. Naranjal 1300, Los Olivos",
      price: 15,
    ),
    UniversityStudentWithoutCar(
      id: 2,
      name: "Maria Lopez",
      code: "U20201D647",
      university: "UPN",
      image: "https://media.istockphoto.com/id/1438437093/es/foto/mujer-adulta-joven-en-tomas-de-estudio-haciendo-expresiones-faciales-y-usando-los-dedos-y-las.jpg?s=612x612&w=is&k=20&c=oi7nnAHMJ5CwWbNjFYak1YTTcdKClkTSW5WDzPhxO5A=",
      numberPeople: 2,
      destination: "Plaza Norte",
      pickup: "Parque Zarumilla, Calle 21",
      price: 20,
    ),
    UniversityStudentWithoutCar(
      id: 3,
      name: "Carla Sanchez",
      code: "U20202F107",
      university: "UNI",
      image: "https://blog.ucsp.edu.pe/hs-fs/hubfs/estudiante%20universitario.jpg?width=1200&height=750&name=estudiante%20universitario.jpg",
      numberPeople: 2,
      destination: "Plaza San Miguel",
      pickup: "Av. Alfredo Mendiola 6232",
      price: 10,
    ),
    UniversityStudentWithoutCar(
      id: 4,
      name: "Alexander Guevara",
      code: "U20212C121",
      university: "PUCP",
      image: "https://media.istockphoto.com/id/1444206982/es/foto/liderazgo-mentor-o-estudiante-presentador-en-taller-de-educaci%C3%B3n-aprendizaje-o-ense%C3%B1anza-en-el.jpg?s=612x612&w=is&k=20&c=RtFcMhaLzrOLGEMIlLB-uYZYkO_IO2szjQRlrwcMXBo=",
      numberPeople: 2,
      destination: "Plaza San Miguel",
      pickup: "Av. Túpac Amaru 2200, Comas",
      price: 15,
    ),
    UniversityStudentWithoutCar(
      id: 5,
      name: "Carlos Alva",
      code: "U20192B185",
      university: "USMP",
      image: "https://media.istockphoto.com/id/1339432131/es/foto/estudiante-adolescente-afroamericano-positivo-con-mochila-tablet-pc-y-auriculares-estudiando.jpg?s=612x612&w=is&k=20&c=-EvNfOhk3YVTggTyAMBRgNklMN1q7GhICjJwjX6favM=",
      numberPeople: 1,
      destination: "Plaza Norte",
      pickup: "Mercado Unicachi-univ 2450",
      price: 30,
    ),
    UniversityStudentWithoutCar(
      id: 6,
      name: "Roxana Tello",
      code: "U20211D295",
      university: "UNI",
      image: "https://media.istockphoto.com/id/1396453889/es/foto/hermosa-mujer-con-anteojos-sosteniendo-libros.jpg?s=612x612&w=is&k=20&c=xd6hB8M04PPuSX4wFlL8ARWd2fHYqBEfByVw7iH8paQ=",
      numberPeople: 2,
      destination: "UNI",
      pickup: "Hospital Sergio Bernales 4000",
      price: 22,
    ),
    UniversityStudentWithoutCar(
      id: 7,
      name: "Sebastian Contreras",
      code: "U20192C144",
      university: "UNMSM",
      image: "https://media.istockphoto.com/id/1322844568/es/foto/concepto-de-educaci%C3%B3n-joven-positivo-con-mochila-auriculares-y-cuadernos-posando-sobre-fondo.jpg?s=612x612&w=is&k=20&c=1nmVYIZH7s4_x-P0BgEZcNay_Nv4KY3q7RmEoshYw5A=",
      numberPeople: 3,
      destination: "UNMSM",
      pickup: "Av. Caminos del Inca 1450",
      price: 18,
    ),
    UniversityStudentWithoutCar(
      id: 8,
      name: "Sandra Flores",
      code: "U20221C524",
      university: "UPC",
      image: "https://media.istockphoto.com/id/1190367451/es/foto/estudiante-de-derecho-de-pie-en-la-entrada-al-edificio-de-la-universidad.jpg?s=612x612&w=is&k=20&c=OlKt8qWlnqyE2J5feqBbJlHPIGfPYWyDPmTir2Ycaco=",
      numberPeople: 2,
      destination: "UPC",
      pickup: "Av. Angamos Este 2681, Surco",
      price: 40,
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 88, 116, 176),
            ),
            child: Row(
              children: [
                Image.asset('assets/logo.png'),
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
        backgroundColor: Color.fromARGB(255, 88, 116, 176),
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.white,
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
