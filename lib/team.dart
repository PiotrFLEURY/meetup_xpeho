import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeamMember {
  String name;
  String firstName;
  String mission;

  TeamMember({this.name, this.firstName, this.mission});
}

class TeamProvider with ChangeNotifier {
  List<String> _missions = List();
  List<TeamMember> _team = List();

  TeamProvider() {
    _missions.add('Tech lead');
    _missions.add('Dev');
    _missions.add('PO');
    _missions.add('Scrum master');
  }

  void fetchTeamMembers() async {
    if (_team.isEmpty) {
      _team.add(TeamMember(
        name: "FLEURY",
        firstName: "Piotr",
        mission: "Teach lead Colibri",
      ));
      _team.add(TeamMember(
        name: "MAKUSA",
        firstName: "Nayden",
        mission: "Dev Colibri",
      ));
    }
    notifyListeners();
  }

  List<TeamMember> get team => _team;

  TeamMember member(index) => team[index];

  List<String> get missions => _missions;

  void addMember(TeamMember member) {
    _team.add(member);
    notifyListeners();
  }

  void delete(TeamMember member) {
    _team.remove(member);
    notifyListeners();
  }
}

class TeamPage extends StatefulWidget {
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TeamProvider(),
      child: Consumer<TeamProvider>(
        builder: (context, teamProvider, _) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => _addPressed(teamProvider),
            ),
            body: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  elevation: 8.0,
                  floating: true,
                  pinned: true,
                  snap: true,
                  flexibleSpace: Stack(children: <Widget>[
                    Positioned.fill(
                      child: Image.network(
                        "https://xpeho.fr/wp-content/uploads/2016/03/xpehobkg.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ]),
                  // Make the initial height of the SliverAppBar larger than normal.
                  expandedHeight: 160,
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.refresh),
                      onPressed: () => teamProvider.fetchTeamMembers(),
                    ),
                  ],
                ),
                SliverList(
                  // Use a delegate to build items as they're scrolled on screen.
                  delegate: SliverChildBuilderDelegate(
                    // The builder function returns a ListTile with a title that
                    // displays the index of the current item.
                    (context, index) {
                      TeamMember member = teamProvider.member(index);
                      return Dismissible(
                        key: GlobalKey(),
                        onDismissed: (direction) {
                          if (direction == DismissDirection.startToEnd) {
                            _editMember(teamProvider, member);
                          } else if (direction == DismissDirection.endToStart) {
                            _deleteMember(teamProvider, member);
                          }
                        },
                        background: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Icon(Icons.edit),
                                color: Colors.green,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: Icon(Icons.delete),
                                color: Colors.red,
                              ),
                            )
                          ],
                        ),
                        child: ListTile(
                          title: Text("${member.name} ${member.firstName}"),
                          subtitle: Text(member.mission),
                        ),
                      );
                    },
                    // Builds 1000 ListTiles
                    childCount: teamProvider.team.length,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _addPressed(TeamProvider teamProvider) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return Container(
            height: 200,
            child: ListView.builder(
              itemCount: teamProvider.missions.length,
              itemBuilder: (_, index) {
                String mission = teamProvider.missions[index];
                return FlatButton(
                  child: Text(mission),
                  onPressed: () {
                    Navigator.of(context).pop();
                    addMember(teamProvider, mission);
                  },
                );
              },
            ),
          );
        });
  }

  void addMember(TeamProvider teamProvider, String _mission) async {
    final member = await Navigator.of(context).pushNamed(
      '/editMember',
      arguments: TeamMember(mission: _mission),
    );
    if (member != null) {
      teamProvider.addMember(member);
    }
  }

  void _editMember(TeamProvider teamProvider, TeamMember _member) async {
    Navigator.of(context).pushNamed(
      '/editMember',
      arguments: _member,
    );
  }

  void _deleteMember(TeamProvider teamProvider, TeamMember _member) async {
    teamProvider.delete(_member);
  }
}
