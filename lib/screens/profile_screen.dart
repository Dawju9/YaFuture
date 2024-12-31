import 'package:flutter/material.dart';
import 'package:ayagrubmi/data/user_profile_manager.dart'; // Importujemy manager profilu użytkownika

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil użytkownika'),
      ),
      body: FutureBuilder(
        future: UserProfileManager
            .getUserProfile(), // Pobieramy dane profilu użytkownika
        builder: (context, AsyncSnapshot<UserProfile?> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Center(child: Text('Wystąpił błąd: ${snapshot.error}'));
            } else {
              final userProfile = snapshot.data;

              return userProfile != null
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Imię: ${userProfile.name}'),
                          Text('Wiek: ${userProfile.age}'),
                          Text('Wzrost: ${userProfile.height}'),
                          Text('Waga: ${userProfile.weight}'),
                          // Wyświetl inne dane profilu użytkownika
                        ],
                      ),
                    )
                  : const Center(
                      child: Text('Brak danych profilu użytkownika'));
            }
          }
        },
      ),
    );
  }
}

/*import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil użytkownika'),
      ),
      body: const Center(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Tutaj możesz wyświetlić dane profilu użytkownika'),
            // Wyświetl dane profilu
          ],
        ),
      ),
    );
  }
}
*/