import 'package:flutter/material.dart';

class TestFormScreen extends StatefulWidget {
  const TestFormScreen({super.key});

  @override
  State<TestFormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<TestFormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  List<bool> checked = [false, false, false]; // Initial checkbox state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista Personalizada'),
      ),
      body: ListView.builder(
        itemCount: 3, // Número de itens na lista
        itemBuilder: (context, index) {
          return ListTile(
            leading: Checkbox(
              value: checked[index],
              checkColor: Colors.black, // cor do checkmark (o "V")
              activeColor: Colors.white, // cor de fundo do checkbox quando selecionado
              shape: RoundedRectangleBorder( // forma do checkbox
                borderRadius: BorderRadius.circular(2), // bordas levemente arredondadas
                side: BorderSide(color: checked[index] ? Colors.green : Colors.grey), // cor da borda
              ),
              onChanged: (bool? value) {
                setState(() {
                  checked[index] = value!;
                });
              },
            ),
            title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Nome Completo Placeholder'), // Substituir pelos dados reais
                Text('Telefone Placeholder'),       // Substituir pelos dados reais
                Text('Endereço Placeholder'),       // Substituir pelos dados reais
              ],
            ),
          );
        },
      ),
    );
  }
}
