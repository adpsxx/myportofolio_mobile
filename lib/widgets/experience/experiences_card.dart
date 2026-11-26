import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/models/experience.dart';
import 'package:myportofolio_mobile/screens/experience/experience_detail_screen.dart';

class ExperienceCard extends StatelessWidget {
  const ExperienceCard({super.key, required this.experience});

  final Experience experience;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        title: Text(experience.title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (experience.description.isNotEmpty)
              Text(
                experience.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              experience.isStarred ? Icons.star : Icons.star_border,
              size: 18,
            ),
            const SizedBox(width: 4),
            Text('${experience.starCount}'),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ExperienceDetailScreen(experience: experience),
            ),
          );
        },
      ),
    );
  }
}
