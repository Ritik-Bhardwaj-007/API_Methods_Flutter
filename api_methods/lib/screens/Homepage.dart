import 'package:api_methods/services/api.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  var name = TextEditingController();

  Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Api Methods"),
      ),
      body: Center(
          child: Column(children: [
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 70,
          width: 300,
          child: TextField(
              controller: name,
              decoration: InputDecoration(hintText: "enter username")),
        ),
        ElevatedButton(
            onPressed: () {
              var data = name.text.toString();
              // var data = {"username": name.text.toString()};
              // var data = {"bio": name.text.toString()};
              // Api.checkUsername(data);
              // Api.getRequest(data);
              Api.DeleteRequest(data);
              // Api.updateRequest(data);
            },
            child: const Text("submit")),
        const SizedBox(
          height: 40,
        ),
        ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (context) => DataList()));
            },
            child: const Text("Read the usernames registered")),
      ])),
    );
  }
}
