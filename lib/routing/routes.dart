const rootRoute = "/home";

const overViewPageDisplayName = "Overview";
const overViewPageRoute = "/overview";

const driversPageDisplayName = "Drivers";
const driversPageRoute = "/drivers";

const clientsPageDisplayName = "Clients";
const clientsPageRoute = "/clients";

const authenticationDisplayName = "Log Out";
const authenticationPageRoute = "/auth";

class MenuItem{
  final String name;
  final String route;

  MenuItem({required this.name, required this.route});
}

List<MenuItem> sideMenuItems = [
  MenuItem(name: overViewPageDisplayName, route: overViewPageRoute),
  MenuItem(name: driversPageDisplayName, route: driversPageRoute),
  MenuItem(name: clientsPageDisplayName, route: clientsPageRoute),
  MenuItem(name: authenticationDisplayName, route: authenticationPageRoute),
];
