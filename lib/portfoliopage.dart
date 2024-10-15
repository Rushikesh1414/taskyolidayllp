// import 'package:flutter/material.dart';
//
// class PortfolioScreen extends StatefulWidget {
//   @override
//   _PortfolioScreenState createState() => _PortfolioScreenState();
// }
//
// class _PortfolioScreenState extends State<PortfolioScreen> {
//   int _selectedIndex = 1; // Default is the 'Portfolio' tab selected
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 4,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("portfolio",style: TextStyle(
//
//           ),),
//           actions: [
//             IconButton(
//               icon: Icon(Icons.shopping_bag,color: Colors.red,),
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: Icon(Icons.notifications,color: Colors.red,),
//               onPressed: () {},
//             ),
//           ],
//           bottom: TabBar(
//             indicatorColor: Colors.red,
//             labelColor: Colors.red,
//             unselectedLabelColor: Colors.grey,
//             labelPadding: EdgeInsets.symmetric(horizontal: 00.0),
//             tabs: [
//
//               Tab(text: "Project"),
//               Tab(text: "Saved"),
//               Tab(text: "Shared"),
//
//               Tab(text: "Achievement"),
//             ],
//           ),
//         ),
//         body: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   hintText: "Search a project",
//                  suffixIcon: Image.asset("assets/images/Group 16.png"),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10)
//                   ),
//                 ),
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 6, // You can change this based on your list length
//                 itemBuilder: (context, index) {
//                   return ProjectCard();
//                 },
//               ),
//             ),
//           ],
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           type: BottomNavigationBarType.fixed, // Keeps labels visible
//           backgroundColor: Colors.white,
//           currentIndex: _selectedIndex, // Portfolio is initially selected
//           selectedItemColor: Colors.red, // Red for selected item (Portfolio)
//           unselectedItemColor: Colors.grey,
//           onTap: _onItemTapped,
//           items: [
//             BottomNavigationBarItem(
//               icon: Image.asset("assets/images/Home svg.png"),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Image.asset("assets/images/Portfolia svg.png"),
//               label: 'Portfolio',
//             ),
//             BottomNavigationBarItem(
//               icon: Image.asset("assets/images/Input svg.png"),
//               label: 'Input',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.person),
//               label: 'Profile',
//             ),
//           ],
//         ),
//         floatingActionButton: SizedBox(
//           width: 100,
//           height: 35,
//           child: FloatingActionButton.extended(
//             onPressed: () {},
//             icon: Icon(Icons.filter_list,color: Colors.white,),
//             label: Text('Filter',style: TextStyle(color: Colors.white),),
//             backgroundColor: Colors.red,
//           ),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, // Align with bottom bar
//       ),
//     );
//   }
// }
//
// class ProjectCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
//       child: Container(
//         height: 110,
//         width: 300,
//         decoration: BoxDecoration(
//             border: Border.all(
//               color: Colors.grey, //color of border
//               width: 1, //width of border
//             ),
//             borderRadius: BorderRadius.circular(5)
//         ),
//
//          child: Row(
//            children: [
//              Image.asset("assets/images/rect.png",height: 110,width: 110,),
//              Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: [
//                  SizedBox(height: 2,),
//                  Text("Kemampuan Merangkum Tulisan "),
//                  Text(" Tulisan"),
//
//
//                  SizedBox(height: 15,),
//                  Text("BAHASA SUNDA",style: TextStyle(
//                    fontSize: 10
//                  ),),
//
//                  Row(
//
//                    children: [
//                      Text("Oleh Al-Baiqi Samaan",style: TextStyle(
//                        fontSize: 10
//                      ),),
//
//                      SizedBox(width: 60,),
//                      Image.asset("assets/images/Rectangle 20.png"),
//
//
//                    ],
//                  ),
//
//
//                ],
//              )
//            ],
//          ),
//
//
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';


class PortfolioScreen extends StatefulWidget {
  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}


class _PortfolioScreenState extends State<PortfolioScreen> {
  int _selectedIndex = 1; // Default is the 'Portfolio' tab selected

  // List of all projects
  final List<String> _projects = [
    'Kemampuan Merangkum Tulisan 1',
    'Kemampuan Merangkum Tulisan 2',
    'Kemampuan Merangkum Tulisan 3',
    'Kemampuan Merangkum Tulisan 4',
    'Kemampuan Merangkum Tulisan 5',
    'Kemampuan Merangkum Tulisan 6',
  ];

  // This list will contain the filtered projects and must be initialized properly
  late List<String> _filteredProjects;  // Use 'late' to tell Dart it will be initialized before use

  // Text controller for the search field
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize _filteredProjects with all projects initially
    _filteredProjects = _projects;
    _searchController.addListener(_filterProjects); // Listen to search input
  }

  // Function to filter projects based on search input
  void _filterProjects() {
    String searchTerm = _searchController.text.toLowerCase();
    setState(() {
      if (searchTerm.isEmpty) {
        _filteredProjects = _projects; // Show all projects if search is empty
      } else {
        _filteredProjects = _projects
            .where((project) => project.toLowerCase().contains(searchTerm))
            .toList(); // Filter the list based on search term
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("portfolio", style: TextStyle()),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_bag, color: Colors.red),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.notifications, color: Colors.red),
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            indicatorColor: Colors.red,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.grey,
            labelPadding: EdgeInsets.symmetric(horizontal: 0.0),
            tabs: [
              Tab(text: "Project"),
              Tab(text: "Saved"),
              Tab(text: "Shared"),
              Tab(text: "Achievement"),
            ],
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5.0),
              child: TextField(
                controller: _searchController, // Attach the controller to the search field
                decoration: InputDecoration(
                  hintText: "Search a project",
                  suffixIcon: Image.asset("assets/images/Group 16.png"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredProjects.length, // Show the filtered projects
                itemBuilder: (context, index) {
                  return ProjectCard(projectTitle: _filteredProjects[index]);
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed, // Keeps labels visible
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex, // Portfolio is initially selected
          selectedItemColor: Colors.red, // Red for selected item (Portfolio)
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/Home svg.png"),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/Portfolia svg.png"),
              label: 'Portfolio',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/Input svg.png"),
              label: 'Input',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
        floatingActionButton: SizedBox(
          width: 100,
          height: 35,
          child: FloatingActionButton.extended(
            onPressed: () {},
            icon: Icon(Icons.filter_list, color: Colors.white),
            label: Text('Filter', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.red,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, // Align with bottom bar
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

class ProjectCard extends StatelessWidget {
  final String projectTitle;

  // Make projectTitle required
  const ProjectCard({required this.projectTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
      child: Container(
        height: 110,
        width: 300,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey, // Color of border
            width: 1, // Width of border
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Image.asset("assets/images/rect.png", height: 110, width: 110),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 2),
                Text(projectTitle), // Display the project title
                Text("Tulisan"),
                SizedBox(height: 15),
                Text(
                  "BAHASA SUNDA",
                  style: TextStyle(fontSize: 10),
                ),
                Row(
                  children: [
                    Text(
                      "Oleh Al-Baiqi Samaan",
                      style: TextStyle(fontSize: 10),
                    ),
                    SizedBox(width: 60),
                    Image.asset("assets/images/Rectangle 20.png"),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
