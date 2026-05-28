import 'package:flutter/material.dart';
import 'package:flutter_floating_bottom_bar/flutter_floating_bottom_bar.dart';
import '../dashboard/weather/weather_page.dart';
import '../auth/login/login_page.dart';
import '../settings/settings_page.dart';

class AppShell extends StatefulWidget {
  static const routeName = '/';

  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _TabItem {
  final String routeName;
  final String label;
  final IconData icon;

  const _TabItem({
    required this.routeName,
    required this.label,
    required this.icon,
  });
}

class _AppShellState extends State<AppShell> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  int _selectedIndex = 0;

  final _tabs = [
    _TabItem(routeName: WeatherPage.routeName, label: 'Weather', icon: Icons.cloud),
    _TabItem(routeName: LoginPage.routeName, label: 'Login', icon: Icons.login),
    _TabItem(routeName: SettingsPage.routeName, label: 'Settings', icon: Icons.settings),
  ];

  final _pages = {
    WeatherPage.routeName: const WeatherPage(),
    LoginPage.routeName: const LoginPage(),
    SettingsPage.routeName: const SettingsPage(),
  };


  Route<dynamic>? _buildRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (_) => _pages[settings.name] ?? const WeatherPage(),
      settings: settings,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomBar(
      body: Navigator(
        key: _navigatorKey,
        initialRoute: _tabs[_selectedIndex].routeName,
        onGenerateRoute: _buildRoute,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(_tabs.length, (index) {
  final tab = _tabs[index];
  return IconButton(
    icon: Icon(
      tab.icon,
      color: _selectedIndex == index ? Colors.blue : Colors.grey,
    ),
    onPressed: () {
      if (_selectedIndex == index) return;
      setState(() => _selectedIndex = index);
      _navigatorKey.currentState?.pushReplacementNamed(tab.routeName);
    },
    tooltip: tab.label,
  );
}),
        ),
      ),
    );
  }
}