import '../base.dart';
import 'image.dart';

class CardPic extends StatelessWidget {
  const CardPic(this.path, this.title, {super.key, this.onTap, this.subTitle, this.footer, this.titleCenter, this.width = 200});
  final String path;
  final String title;
  final String? subTitle;
  final Widget? footer;
  final bool? titleCenter;
  final Function()? onTap;
  final double width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card.filled(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            JuImage(path, width: width),
            const SizedBox(height: 8),
            Container(
              width: width,
              alignment: titleCenter == true ? Alignment.center : Alignment.centerLeft,
              child: Text(
                title,
                style: Theme.of(context).textTheme.titleMedium,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            if (subTitle != null)
              Text(
                subTitle!,
                style: Theme.of(context).textTheme.bodySmall,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
          ],
        ),
      ),
    );
  }
}
