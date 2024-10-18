import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/home/presentation/bloc/ForecastBloc.dart';
import 'package:weather/features/home/presentation/bloc/ForecastEvent.dart';
import 'package:weather/features/home/presentation/bloc/ForecastState.dart';


class ForecastScreen extends StatefulWidget {
  final String city;

  const ForecastScreen({super.key, required this.city});

  @override
  State<ForecastScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  int selectedDayIndex = 0;

  @override
  void initState() {
    context.read<ForecastBloc>().add(FetchForecastEvent(widget.city));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Forecast'),
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      // Gradient background for better aesthetics
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Horizontal day selector
              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return _buildDayCard(context, '${18 + index}', index == selectedDayIndex, index);
                  },
                ),
              ),
              const SizedBox(height: 16),

              // Main weather display
              Expanded(
                child: BlocBuilder<ForecastBloc, ForecastState>(
                  builder: (context, state) {
                    if (state is ForecastLoading) {
                      return const Center(child: CircularProgressIndicator(color: Colors.white));
                    } else if (state is ForecastLoaded) {
                      final forecast = state.forecast.forecast.forecastDays[selectedDayIndex];
                      return Column(
                        children: [
                          const SizedBox(height: 16),
                          // Weather condition text
                          Text(
                            forecast.day.condition.text ?? '',
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 16),

                          // Circular indicators for temperatures
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildCircularIndicator('Max Temp (°C)', forecast.day.maxTempC, Colors.purple),
                              _buildCircularIndicator('Min Temp (°C)', forecast.day.minTempC, Colors.pink),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Circular indicators for avg temp and wind
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildCircularIndicator('Avg Temp (°C)', forecast.day.avgTempC, Colors.blue),
                              _buildCircularIndicator('Max Wind (km/h)', forecast.day.maxWindKph, Colors.orange),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Weather icon (sunny)
                          const Icon(Icons.wb_sunny, size: 120, color: Colors.yellow),
                        ],
                      );
                    } else if (state is ForecastError) {
                      return Center(
                        child: Text(
                          state.message,
                          style: const TextStyle(color: Colors.red, fontSize: 16),
                        ),
                      );
                    }
                    return const Text(
                      'Enter a city to get the forecast',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper method to build each day card
  Widget _buildDayCard(BuildContext context, String day, bool isSelected, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedDayIndex = index; // Update selected day index
        });
        context.read<ForecastBloc>().add(FetchForecastEvent(widget.city));
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 60,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.deepPurple.shade700,
          borderRadius: BorderRadius.circular(12),
          boxShadow: isSelected
              ? [BoxShadow(color: Colors.white.withOpacity(0.5), blurRadius: 5, spreadRadius: 1)]
              : [],
        ),
        child: Center(
          child: Text(
            day,
            style: TextStyle(
              fontSize: 18,
              color: isSelected ? Colors.black : Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build circular progress indicators
  Widget _buildCircularIndicator(String label, double value, Color color) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: CircularProgressIndicator(
                value: value / 100, // Assuming values are percentages
                strokeWidth: 8,
                backgroundColor: Colors.white24,
                color: color,
              ),
            ),
            Text(
              '${value.toStringAsFixed(1)}°',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}