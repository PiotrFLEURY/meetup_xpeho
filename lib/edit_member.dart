import 'package:flutter/material.dart';
import 'package:meetup_xpeho/team.dart';

class EditMemberPage extends StatefulWidget {
  @override
  _EditMemberPageState createState() => _EditMemberPageState();
}

class _EditMemberPageState extends State<EditMemberPage> {
  @override
  Widget build(BuildContext context) {
    TeamMember _member = ModalRoute.of(context).settings.arguments;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://xpeho.fr/wp-content/uploads/2016/03/banner_nous-2.png"),
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Name",
                contentPadding: const EdgeInsets.all(8.0),
              ),
              controller: TextEditingController(
                text: _member.name,
              ),
              onChanged: (value) {
                _member.name = value;
              },
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "First name",
                contentPadding: const EdgeInsets.all(8.0),
              ),
              controller: TextEditingController(
                text: _member.firstName,
              ),
              onChanged: (value) {
                _member.firstName = value;
              },
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Mission",
                contentPadding: const EdgeInsets.all(8.0),
              ),
              controller: TextEditingController(
                text: _member.mission,
              ),
              onChanged: (value) {
                _member.mission = value;
              },
            ),
            RaisedButton(
              child: Text("Valider"),
              onPressed: () {
                Navigator.of(context).pop(_member);
              },
            )
          ],
        ),
      ),
    );
  }
}
