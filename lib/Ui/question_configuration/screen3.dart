import 'package:englishtalkedesktop/Ui/side_bar.dart';
import 'package:englishtalkedesktop/core/custom_widgets/cstm_text_field.dart';
import 'package:flutter/material.dart';

class Screen3 extends StatefulWidget {
  @override
  State<Screen3> createState() => _Screen3State();
}

class _Screen3State extends State<Screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SideBar(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5, // Adding elevation for the shadow effect
                shadowColor: const Color.fromARGB(
                    255, 255, 255, 255), // Set shadow color if needed
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 40),
                      Text(
                        'Inspector/Assesor Profile Creation',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                      SizedBox(height: 40),
                      CustomTextField(
                        labelText: 'Enter User Name',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.person),
                          onPressed: () {
                            // Action when the icon button is pressed
                          },
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomTextField(
                        labelText: 'Enter Email',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.email),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomTextField(
                        labelText: 'Enter Password',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.remove_red_eye_sharp),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomTextField(
                        labelText: 'Enter Confirm Password',
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.remove_red_eye),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          const Spacer(),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Save Record'),
                          ),
                          SizedBox(width: 8.0),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Update Record'),
                          ),
                          SizedBox(width: 8.0),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Show All'),
                          ),
                          Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
