import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
    runApp(const MyApp());
}

final _router = GoRouter(
    routes: [
        GoRoute(
            path: '/', 
            builder: (context, state) => const HomeScreen()
        ),
        GoRoute(
            path: '/details',
            builder: (context, state) => const DetailsScreen(),
        ),
    ],
);

class HomeScreen extends StatelessWidget {
    const HomeScreen({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('Home'),),
            body: Center(
                child: ElevatedButton(
                    onPressed: () => context.go('/details'),
                    child: const Text('Go to Details'),
                ),
            ),
        );
    }
}

class DetailsScreen extends StatelessWidget {
    const DetailsScreen({super.key});

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('Details'),),
            body: Center(
                child: Column(
                    children: [
                        Text('This is the details page.'),
                        SizedBox(height: 30.0,),
                        ElevatedButton(
                            // onPressed: () => context.go('/details'),
                            // onPressed: () => context.go('/product/42?filter=popular'),
                            onPressed: () => context.goNamed('home'), 
                            child: const Text('Back'),
                        ),
                    ],
                ),
            ),
        );
    }
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp.router(
            title: 'go_router Lesson 1',
            routerConfig: _router,
            debugShowCheckedModeBanner: false,
        );
    }
}
