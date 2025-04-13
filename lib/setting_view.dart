import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isSoundEnabled = true;
  bool isDarkMode = false;
  bool allPokemonPixeled = false;
  bool showDefaultPokemon = true;
  int? defaultPokemonId = 25; // Pikachu by default
  bool isDefaultPokemonGif = true;
  List<int> favoritePokemonIds = [1, 4, 7];
  bool isScrollHorizontal = true;

  String language = 'English';
  String theme = 'System';
  String region = 'Kanto';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Settings'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8),
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              'General',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
          SwitchListTile(
            title: const Text('Sound Effects'),
            value: isSoundEnabled,
            onChanged: (value) => setState(() => isSoundEnabled = value),
          ),
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: isDarkMode,
            onChanged: (value) => setState(() => isDarkMode = value),
          ),
          ListTile(
            title: const Text('App Language'),
            trailing: DropdownButton<String>(
              value: language,
              onChanged: (val) => setState(() => language = val!),
              items: const [
                DropdownMenuItem(value: 'English', child: Text('English')),
                DropdownMenuItem(value: 'Japanese', child: Text('Japanese')),
                DropdownMenuItem(value: 'Spanish', child: Text('Spanish')),
              ],
            ),
          ),
          ListTile(
            title: const Text('Theme'),
            trailing: DropdownButton<String>(
              value: theme,
              onChanged: (val) => setState(() => theme = val!),
              items: const [
                DropdownMenuItem(
                  value: 'System',
                  child: Text('System Default'),
                ),
                DropdownMenuItem(value: 'Light', child: Text('Light')),
                DropdownMenuItem(value: 'Dark', child: Text('Dark')),
              ],
            ),
          ),

          const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text(
              'Pokémon',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          SwitchListTile(
            title: const Text('Show Default Pokémon on Launch'),
            value: showDefaultPokemon,
            onChanged: (value) => setState(() => showDefaultPokemon = value),
          ),
          ListTile(
            title: const Text('Default Pokémon ID'),
            subtitle: Text('$defaultPokemonId'),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // You can open a dialog to input new ID
              },
            ),
          ),
          SwitchListTile(
            title: const Text('Default Pokémon as GIF'),
            value: isDefaultPokemonGif,
            onChanged: (value) => setState(() => isDefaultPokemonGif = value),
          ),
          SwitchListTile(
            title: const Text('Pixel Art Mode'),
            subtitle: const Text('Show all Pokémon in pixel art'),
            value: allPokemonPixeled,
            onChanged: (value) => setState(() => allPokemonPixeled = value),
          ),
          SwitchListTile(
            title: const Text('Scroll Horizontally'),
            subtitle: const Text('Change Pokémon scroll direction'),
            value: isScrollHorizontal,
            onChanged: (value) => setState(() => isScrollHorizontal = value),
          ),

          ListTile(
            title: const Text('Favorite Pokémon'),
            subtitle: Text(favoritePokemonIds.join(', ')),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // Open selection screen or dialog
              },
            ),
          ),

          ListTile(
            title: const Text('Pokémon Region'),
            trailing: DropdownButton<String>(
              value: region,
              onChanged: (val) => setState(() => region = val!),
              items: const [
                DropdownMenuItem(value: 'Kanto', child: Text('Kanto')),
                DropdownMenuItem(value: 'Johto', child: Text('Johto')),
                DropdownMenuItem(value: 'Hoenn', child: Text('Hoenn')),
                DropdownMenuItem(value: 'Sinnoh', child: Text('Sinnoh')),
                DropdownMenuItem(value: 'Unova', child: Text('Unova')),
                DropdownMenuItem(value: 'Kalos', child: Text('Kalos')),
                DropdownMenuItem(value: 'Alola', child: Text('Alola')),
                DropdownMenuItem(value: 'Galar', child: Text('Galar')),
              ],
            ),
          ),

          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
            onTap: () {
              // Show about dialog or navigate
            },
          ),
        ],
      ),
    );
  }
}
