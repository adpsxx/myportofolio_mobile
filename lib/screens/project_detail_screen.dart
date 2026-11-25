import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/models/project.dart';

class ProjectDetailScreen extends StatelessWidget {
  const ProjectDetailScreen({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(project.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (project.thumbnail.isNotEmpty) ...[
              Image.network(
                project.thumbnail,
                errorBuilder: (context, error, stackTrace) =>
                    const Text('Failed to load image.'),
              ),
              const SizedBox(height: 16),
            ],
            Text(
              project.title,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text('Description: ${project.description}'),
            const SizedBox(height: 8),
            if (project.projectLink.isNotEmpty) ...[
              Text('Project URL: ${project.projectLink}'),
              const SizedBox(height: 8),
            ],
            Text('Stars: ${project.starCount}'),
            if (project.starredByNames.isNotEmpty) ...[
              const SizedBox(height: 4),
              Text('Starred by: ${project.starredByNames}'),
            ],
          ],
        ),
      ),
    );
  }
}
