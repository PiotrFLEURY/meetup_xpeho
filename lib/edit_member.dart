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
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.check),
          onPressed: () => Navigator.of(context).pop(_member),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Theme.of(context).appBarTheme.color,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          ),
          notchMargin: 4.0,
          shape: CircularNotchedRectangle(),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Material(
                color: Colors.teal,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    8.0,
                  ),
                ),
                elevation: 4.0,
                child: Icon(
                  Icons.person_pin,
                  color: Colors.white,
                  size: 96.0,
                ),
              ),
            ),
            TextField(
              decoration: InputDecoration(
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
            DropdownButton(
              value: _member.mission,
              items: List.generate(TeamProvider().missions.length, (index) {
                return DropdownMenuItem(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(TeamProvider().missions[index]),
                  ),
                  value: TeamProvider().missions[index],
                );
              }),
              onChanged: (value) {
                setState(() {
                  _member.mission = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
