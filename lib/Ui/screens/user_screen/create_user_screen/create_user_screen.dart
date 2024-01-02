import 'package:englishtalkedesktop/Ui/screens/user_screen/create_user_screen/create_user_provider.dart';
import 'package:englishtalkedesktop/Ui/screens/side_bar.dart';
import 'package:englishtalkedesktop/core/custom_widgets/cstm_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateUser extends StatefulWidget {
  @override
  State<CreateUser> createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //Any changes  in the Main Provider to catch and reflect it here.
      create: (context) => CreateUserProvider(),
      child: Consumer<CreateUserProvider>(
        builder: (context, model, child) => Row(
          children: [
            // SideBar(),
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
                          controller: model.nameController,
                          onChanged: (name) {
                            model.createUserModel.name = name;
                          },
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
                          controller: model.emailController,
                          onChanged: (email) {
                            model.createUserModel.email = email;
                          },
                          labelText: 'Enter Email',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.email),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          controller: model.passwordController,
                          onChanged: (password) {
                            model.createUserModel.password = password;
                          },
                          labelText: 'Enter Password',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.remove_red_eye_sharp),
                            onPressed: () {},
                          ),
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          controller: model.confirmPasswordController,
                          onChanged: (confirmpassword) {
                            model.createUserModel.confirmPassword =
                                confirmpassword;
                          },
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
                            model.islaoding
                                ? Center(
                                    child: CircularProgressIndicator(
                                    color: Colors.teal,
                                  ))
                                : ElevatedButton(
                                    onPressed: () {
                                      model.createUserFunction();
                                    },
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
      ),
    );
  }
}
