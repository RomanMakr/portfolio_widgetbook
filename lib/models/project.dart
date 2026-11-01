class Project {
  final String id, title, category, description;
  const Project({required this.id, required this.title, required this.category, required this.description});
}
const sampleProjects = [
  Project(id: '1', title: 'Healthcare App', category: 'Healthcare', description: 'Mobile healthcare services, authentication and notifications.'),
  Project(id: '2', title: 'E-Commerce App', category: 'E-Commerce', description: 'Catalog, cart, payments and order tracking.'),
  Project(id: '3', title: 'Social Media App', category: 'Social', description: 'Real-time messaging, media and notifications.'),
];