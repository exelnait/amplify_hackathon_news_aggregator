import 'package:flutter/material.dart';

import 'package:news_aggregator/modules/news/news.module.dart';

/// {@template post_medium}
/// A reusable post medium block widget.
/// {@endtemplate}
class PostMedium extends StatelessWidget {
  /// {@macro post_medium}
  const PostMedium({super.key, required this.block, this.onPressed});

  /// The associated [PostMediumBlock] instance.
  final PostMediumBlock block;

  /// An optional callback which is invoked when the action is triggered.
  /// A [Uri] from the associated [BlockAction] is provided to the callback.
  final BlockActionCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () =>
          block.hasNavigationAction ? onPressed?.call(block.action!) : null,
      child: block.isContentOverlaid
          ? PostMediumOverlaidLayout(
              title: block.title,
              imageUrl: block.imageUrl!,
            )
          : PostMediumDescriptionLayout(
              title: block.title,
              imageUrl: block.imageUrl!,
              description: block.description,
              publishedAt: block.publishedAt,
              author: block.author,
            ),
    );
  }
}
