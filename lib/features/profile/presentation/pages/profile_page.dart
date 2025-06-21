import 'package:flutter/material.dart';
import 'package:profile_page/features/app/presentation/main_page.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacement(
              context, 
              MaterialPageRoute(
                builder:(context) => MainPage(),
                )
              );
          }, 
        icon: Icon(Icons.west)
        ),
        title: Text('EDIT PROFILE'), 
        centerTitle: true,
        ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            //seccion del avatar
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/image.png'),
                ),
              ),
            ),
            //---------Seccion de nombres
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
           

            //---------Seccion del email
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            

            //---------Seccion de Univeristy
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Univeristy',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            

            //---------Seccion de car
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Car',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            

            //---------Boton de Save
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Aquí iría la lógica para guardar los cambios
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50),
                    backgroundColor: Color.fromARGB(255, 88, 116, 176)
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white
                    )
                    ),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
