import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/ai_prediction/presentation/bloc/PredictionBloc.dart';
import 'package:weather/features/home/ForeCastScreen.dart';
import 'package:weather/features/home/presentation/bloc/ForecastBloc.dart';
import 'package:weather/features/location/presentation/widgets/MapWidget.dart';

import '../../../core/di/di.dart';
import '../../home/presentation/bloc/ForecastEvent.dart';
import 'bloc/LocationBloc.dart';
import 'bloc/LocationEvent.dart';
import 'bloc/LocationState.dart';

class LocationScreen extends StatelessWidget {
  final TextEditingController destinationController = TextEditingController();

  LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      BlocProvider.of<LocationBloc>(context).add(FetchLocationEvent());
    });

    return Scaffold(
      // Gradient Background
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.purpleAccent],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                // AppBar replacement with better styling
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Text(
                            "Hello",
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Crow",
                            style: TextStyle(
                              fontSize: 22,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.menu, size: 32, color: Colors.white),
                        onPressed: () {
                          // Handle menu tap
                        },
                      ),
                    ],
                  ),
                ),

                BlocBuilder<LocationBloc, LocationState>(
                  builder: (context, state) {
                    if (state is LocationLoading) {
                      return const Expanded(
                        child: Center(child: CircularProgressIndicator(color: Colors.white)),
                      );
                    } else if (state is LocationLoaded) {
                      return Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              // Map Widget with new styling
                              Container(
                                margin: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      spreadRadius: 2,
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                                height: 250,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: MapWidget(location: state.location),
                                ),
                              ),

                              // Destination Search Input
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: destinationController,
                                      style: const TextStyle(color: Colors.white),
                                      decoration: InputDecoration(
                                        hintText: "Destination",
                                        hintStyle: const TextStyle(color: Colors.white70),
                                        filled: true,
                                        fillColor: Colors.deepPurple.shade200.withOpacity(0.3),
                                        prefixIcon: const Icon(Icons.location_on, color: Colors.white),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide: BorderSide.none,
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide: const BorderSide(color: Colors.white, width: 2),
                                        ),
                                      ),
                                    ),

                                    const SizedBox(height: 24),

                                    // Search Button
                                    ElevatedButton(
                                      onPressed: () {
                                        final city = destinationController.text;
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => MultiBlocProvider(
                                              providers: [
                                                BlocProvider(
                                                create: (context) => getIt.get<ForecastBloc>()),

                                                BlocProvider(
                                                    create: (context) => getIt.get<PredictionBloc>()),
                                              ],
                                                  child: ForecastScreen(city: city),
                                            ),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 100),
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(30),
                                        ),
                                      ),
                                      child: const Text(
                                        "Search",
                                        style: TextStyle(
                                          color: Colors.deepPurple,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else if (state is LocationError) {
                      return Expanded(
                        child: Center(
                          child: Text(
                            state.message,
                            style: const TextStyle(color: Colors.red, fontSize: 16),
                          ),
                        ),
                      );
                    }

                    return const Expanded(
                      child: Center(
                        child: Text(
                          "Press the button to get location",
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
