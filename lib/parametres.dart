import 'package:flutter/material.dart';

class ParametresPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> options = [
      {'title': 'Espaces Comptes', 'icon': Icons.person},
      {'title': 'Notifications', 'icon': Icons.notifications},
      {'title': 'Autorisations', 'icon': Icons.lock},
      {'title': 'Thèmes', 'icon': Icons.palette},
      {'title': 'Langues', 'icon': Icons.language},
      {'title': 'Mise à jour / Version de l\'app', 'icon': Icons.system_update},
      {'title': 'Support et Assistance', 'icon': Icons.help},
      {'title': 'Déconnexion', 'icon': Icons.logout},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Paramètres'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: options.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              if (options[index]['title'] == 'Espaces Comptes') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EspacesComptesPage(),
                  ),
                );
              } else if (options[index]['title'] == 'Notifications') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NotificationsPage(),
                  ),
                );
              } else if (options[index]['title'] == 'Autorisations') {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Autorisations')),
                );
              } else if (options[index]['title'] == 'Thèmes') {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Thèmes')),
                );
              } else if (options[index]['title'] == 'Langues') {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Langues')),
                );
              } else if (options[index]['title'] ==
                  'Mise à jour / Version de l\'app') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MiseAJourPage(),
                  ),
                );
              } else if (options[index]['title'] == 'Support et Assistance') {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SupportPage(),
                  ),
                );
              } else {
                print('${options[index]['title']} sélectionné');
              }
            },
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 4,
              color: index == options.length - 1
                  ? Colors.redAccent
                  : Colors.white,
              child: ListTile(
                leading: Icon(
                  options[index]['icon'],
                  color: index == options.length - 1
                      ? Colors.white
                      : Colors.blueAccent,
                ),
                title: Text(
                  options[index]['title'],
                  style: TextStyle(
                    fontSize: 16,
                    color: index == options.length - 1
                        ? Colors.white
                        : Colors.black87,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: index == options.length - 1 ? Colors.white : Colors.grey,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Espaces Comptes
class EspacesComptesPage extends StatefulWidget {
  @override
  _EspacesComptesPageState createState() => _EspacesComptesPageState();
}

class _EspacesComptesPageState extends State<EspacesComptesPage> {
  String email = "utilisateur@email.com";
  String motDePasse = "******";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Espace Comptes'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Informations personnelles",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text(
                "Email",
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text(
                email,
                style: TextStyle(fontSize: 16),
              ),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Modifier l\'email')),
                  );
                },
              ),
            ),
            Divider(),
            ListTile(
              title: Text(
                "Mot de Passe",
                style: TextStyle(fontSize: 16),
              ),
              subtitle: Text(
                motDePasse,
                style: TextStyle(fontSize: 16),
              ),
              trailing: IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Modifier le mot de passe')),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Notifications
class NotificationsPage extends StatefulWidget {
  @override
  _NotificationsPageState createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool _notificationsEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SwitchListTile(
          title: Text("Autoriser les notifications"),
          value: _notificationsEnabled,
          onChanged: (value) {
            setState(() {
              _notificationsEnabled = value;
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  _notificationsEnabled
                      ? "Notifications activées"
                      : "Notifications désactivées",
                ),
              ),
            );
          },
          activeColor: Colors.blueAccent,
        ),
      ),
    );
  }
}

// Mise à jour / Version de l'app
class MiseAJourPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mise à jour / Version de l\'app'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Aucune mise à jour n'est prévue.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "RENAsport version 0.0.1",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

// Support et Assistance
class SupportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Support et Assistance'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Pour toute aide ou assistance relative à l'application RENAsport, veuillez nous contacter via l'adresse mail ci-dessous.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              "Contact : renasport@support.com",
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}






