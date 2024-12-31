import 'package:flutter/material.dart';
import 'package:flutterassigment/view/homePage.dart';



class SignInScreen extends StatelessWidget {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*.06),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 48),
                // App Logo
                Center(
                  child: Column(
                    children: [
                     Padding(
                       padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height*.09),
                       child: CircleAvatar(
                         child: Image.asset('images/capsimage.jpg'),
                       ),
                     ),
                      Text(
                        'Adhicine',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 48),

                // Sign In Text
                Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*.03),
             
                // Email TextFormField
               Row(
                 children: [
                   Icon(Icons.email_outlined, color: Colors.blue,),
                   SizedBox(width: 25),
                   Expanded(
                     child: TextFormField(
                       controller: emailController,
                       keyboardType: TextInputType.emailAddress,
                       decoration: InputDecoration(
                         labelText: 'Email',
                         errorText: 'Incorrect Email Address',
                         // prefixIcon: Icon(Icons.email, color: Colors.blue),
                     
                       ),
                       validator: (value) {
                         if (value == null || value.isEmpty) {
                           return 'Please enter your email';
                         } else if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value)) {
                           return 'Please enter a valid email';
                         }
                         return null;
                       },
                     ),
                   ),
                 ],
               ),
                SizedBox(height: 16),

                // Password TextFormField
               Row(
                 children: [
                   Icon(Icons.lock, color: Colors.blue,),
                   SizedBox(width: 25),
                   Expanded(
                     child: TextFormField(
                       controller: passwordController,
                       obscureText: true,
                       decoration: InputDecoration(
                         labelText: 'Password',
                         // prefixIcon: Icon(Icons.lock, color: Colors.blue),
                         suffixIcon: Icon(Icons.visibility_off, color: Colors.blue),
                     
                       ),
                       validator: (value) {
                         if (value == null || value.isEmpty) {
                           return 'Please enter your password';
                         } else if (value.length < 6) {
                           return 'Password must be at least 6 characters';
                         }
                         return null;
                       },
                     ),
                   ),
                 ],
               ),
                SizedBox(height: 8),

                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),

                // Sign In Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      
                      // Perform sign-in logic
                      
                     Navigator.push(context,MaterialPageRoute(builder: (context)=>Medicine()));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text(
                    'Sign In',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                SizedBox(height: 16),

                // OR Divider
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('OR'),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(height: 16),

                // Google Sign In Button
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: Image.asset('images/googleimage.png',scale: 5,),
                  label: Text('Continue with Google'),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
                SizedBox(height: 32),

                // Sign Up Option
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('New to Adhicine? '),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}