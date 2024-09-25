import 'package:flutter/material.dart';
//classe para personalizar um widget 

class BackgroundWave extends StatelessWidget{
  final double height; 

  const BackgroundWave({Key? key, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SizedBox(
      height: height,
      child: ClipPath(
        clipper: BackgroundWaveClipper(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.deepPurple.shade400,
                  Colors.deepPurple.shade200,
                  Colors.pink.shade50
                ]),
            ),
        )
      )
    );
  }
}
// Path > sequencia de comandos graficos que vão representar uma forma grafica
class BackgroundWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    const minSize = 140.0;
    
    final p1Diff = ((minSize - size.height) * 0.5).truncate().abs();
    // Começa uma linha na origem
    path.lineTo(0.0, size.height - p1Diff);

    final controlPoint = Offset(size.width* 0.4, size.height);
    final endPoint = Offset(size.width, minSize);
    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy);
    
    
    // Finaliza a linha no final com o mesmo valor de largura
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(BackgroundWaveClipper oldClipper) =>
      oldClipper != this;
}
