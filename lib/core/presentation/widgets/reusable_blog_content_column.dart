import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../features/trends/presentation/screens/blog_read_more_screen.dart';
import '../resources/drawables.dart';
import 'custom_image.dart';

class ReusableBlogContentColumn extends StatelessWidget {
  const ReusableBlogContentColumn({
    super.key,
    required this.blogTopic,
    required this.highlightBlogTopic,
    required this.blogWriteUp,
  });

  final String blogTopic;
  final String highlightBlogTopic;
  final String blogWriteUp;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          blogTopic,
          style:  theme.textTheme.labelMedium?.copyWith(
              fontSize: 14,
              color: theme.colorScheme.onSurface
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        const  Center(
          child: CustomImage(asset: fillingStationBlogPicture,),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          highlightBlogTopic,
          style: theme.textTheme.labelMedium?.copyWith(
              fontSize: 14,
              height: 1.4,
              color: theme.colorScheme.onSurface
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: <TextSpan>[
              TextSpan(
                text: blogWriteUp,
                style:  theme.textTheme.labelSmall?.copyWith(
                    fontSize: 14,
                    color: theme.colorScheme.onSurface
                ),
              ),
              TextSpan(
                text: ' read more',
                style:  theme.textTheme.labelMedium?.copyWith(
                    fontSize: 14,
                    color: theme.colorScheme.primary
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const BlogReadMoreScreen(),
                      ),
                    );
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
