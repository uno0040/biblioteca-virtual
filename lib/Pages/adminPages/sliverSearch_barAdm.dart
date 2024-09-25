// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:application_muito_foda/Pages/userPages/background_wave.dart';
import 'package:flutter/material.dart';

class SliverSearchAppBar extends SliverPersistentHeaderDelegate {
  const SliverSearchAppBar();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var adjustShrinkOffset =
        shrinkOffset > minExtent ? minExtent : shrinkOffset;
    double offset = (minExtent - adjustShrinkOffset) * 0.5;
    double topPadding = MediaQuery.of(context).padding.top + 16;

    return Stack(
      children: [
        const BackgroundWave(
          height: 280,
        ),
        Positioned(
          top: topPadding + offset,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Column(
                  children: [
                    Text(
                      'Blibioteca Pessoal - Área do Administrador',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(
                      'Olá ! Para administrar os seus usuarios utilize essa area.',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w200,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              //const SizedBox(height: 8), // Ajuste a altura conforme necessário
              //SearchBar(),              
            ],
          ),
          left: 16,
          right: 16,
        ),
      ],
    );
  }
  // NOTIFICAÇÕES 
  Widget _buildNotificationIcon(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Lógica ao pressionar o ícone de notificação
        print('Ícone de notificação pressionado');
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent, // Fundo invisível
        ),
        child: Icon(
          Icons.notifications,
          color: Colors.white,
        ),
      ),
    );
  }
  @override
  double get maxExtent => 280;

  @override
  double get minExtent => 140;

  @override
  bool shouldRebuild(
          covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;
}
