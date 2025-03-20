import 'package:flutter/material.dart';
import 'package:pokedex/core/constants/responsive_constant.dart';
import 'package:pokedex/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: ResponsiveConstant.pagePadding.copyWith(top: 0),
        child: const SafeArea(child: HomeViewBody()),
      ),
    );
  }
}
