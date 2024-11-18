import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ThemeProvider.dart';
import 'fontprovider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Use watch to listen for changes
    final themeProvider = context.watch<ThemeProvider>();
    final fontProvider = context.watch<FontProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Themed container for grouping
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select Theme:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    DropdownButton<String>(
                      isExpanded: true, // Makes the dropdown full-width
                      value: themeProvider.currentThemeId,
                      items: const [
                        DropdownMenuItem(
                          value: 'light',
                          child: Text('Theme A (Light)'),
                        ),
                        DropdownMenuItem(
                          value: 'dark',
                          child: Text('Theme B (Dark)'),
                        ),
                        DropdownMenuItem(
                          value: 'blue',
                          child: Text('Theme C (Blue)'),
                        ),
                      ],
                      onChanged: (String? selectedThemeId) {
                        if (selectedThemeId != null) {
                          context
                              .read<ThemeProvider>()
                              .setTheme(selectedThemeId);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select Font:',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    DropdownButton<String>(
                      isExpanded: true, // Makes the dropdown full-width
                      value: fontProvider.fontFamily,
                      items: const [
                        DropdownMenuItem(
                            child: Text('Roboto'), value: 'Roboto'),
                        DropdownMenuItem(
                            child: Text('Urbanist'), value: 'Urbanist'),
                        DropdownMenuItem(
                            child: Text('Poppins'), value: 'Poppins'),
                      ],
                      onChanged: (String? selectedFont) {
                        if (selectedFont != null) {
                          context.read<FontProvider>().setFont(selectedFont);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Settings Saved'),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Save Settings',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
