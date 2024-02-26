import 'package:flutter/material.dart';
import 'package:hypermarket_user/presentation/registration__screen/view/registration_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3))
        .then((value) => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => RegistrationScreen(),
            )));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 150,
          width: 150,
          child: Center(
            child: Image.network(
                "https://imgs.search.brave.com/OuzokQs4uN93L4ikCXb_CuBkN4ZszC_4J9omg8hJTms/rs:fit:500:0:0/g:ce/aHR0cHM6Ly90ZW1w/bGF0ZS5jYW52YS5j/b20vRUFFRkg5V0k0/YWMvMS8wLzQwMHct/RjRRQm1Bc2JpUjQu/anBn"),
          ),
        ),
      ),
    );
  }
}
