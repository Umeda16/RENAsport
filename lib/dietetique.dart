import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DietetiqueApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DietetiquePage(),
    );
  }
}

class DietetiquePage extends StatefulWidget {
  @override
  _DietetiquePageState createState() => _DietetiquePageState();
}

class _DietetiquePageState extends State<DietetiquePage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _selectedDay = 'Lundi';

  final List<String> _days = [
    'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi', 'Dimanche'
  ];

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _saveDietetique() async {
    if (_titleController.text.isEmpty || _descriptionController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Veuillez remplir tous les champs.')),
      );
      return;
    }

    try {
      await _firestore.collection('dietetiques').add({
        'title': _titleController.text,
        'description': _descriptionController.text,
        'day': _selectedDay,
        'created_at': FieldValue.serverTimestamp(),
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Diététique enregistrée avec succès.')),
      );
      _titleController.clear();
      _descriptionController.clear();
      setState(() {
        _selectedDay = 'Lundi';
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Erreur lors de l\'enregistrement : $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Diététique'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Créer'),
              Tab(text: 'Voir'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildCreateTab(),
            _buildViewTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildCreateTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Titre'),
          ),
          SizedBox(height: 16),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(labelText: 'Description'),
          ),
          SizedBox(height: 16),
          DropdownButtonFormField<String>(
            value: _selectedDay,
            onChanged: (value) {
              setState(() {
                _selectedDay = value!;
              });
            },
            items: _days.map((day) {
              return DropdownMenuItem(
                value: day,
                child: Text(day),
              );
            }).toList(),
            decoration: InputDecoration(labelText: 'Jour'),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: _saveDietetique,
            child: Text('Enregistrer'),
          ),
        ],
      ),
    );
  }

  Widget _buildViewTab() {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('dietetiques').orderBy('created_at').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(child: Text('Aucune diététique trouvée.'));
        }

        return ListView(
          children: snapshot.data!.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return ListTile(
              title: Text(data['title'] ?? 'Sans titre'),
              subtitle: Text('${data['description'] ?? ''} - ${data['day']}'),
            );
          }).toList(),
        );
      },
    );
  }
}


