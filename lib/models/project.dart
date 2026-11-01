class Project {
  final String id, title, category, description;
  final bool published;
  const Project({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    this.published = false,
  });
}

const sampleProjects = [
  Project(
    id: '1',
    published: true,
    title: 'Healthcare App',
    category: 'Healthcare',
    description:
        'Mobile healthcare services, authentication and notifications.',
  ),
  Project(
    id: '2',
    published: true,
    title: 'E-Commerce App',
    category: 'E-Commerce',
    description: 'Catalog, cart, payments and order tracking.',
  ),
  Project(
    id: '3',
    title: 'Social Media App',
    category: 'Social',
    description: 'Real-time messaging, media and notifications.',
  ),
];
