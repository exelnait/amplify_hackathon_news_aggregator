import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'block_action.g.dart';

/// The different types of actions.
enum BlockActionType {
  /// A navigation action represents an internal navigation to the provided uri.
  navigation,

  /// An unknown action type.
  unknown
}

/// {@macro block_action}
/// A class which represents an action that can occur
/// when interacting with a block.
/// {@endtemplate}
abstract class BlockAction {
  /// {@macro block_action}
  const BlockAction({
    required this.type,
    required this.actionType,
  });

  /// The type key used to identify the type of this action.
  final String type;

  /// The type of this action.
  final BlockActionType actionType;

  /// Converts the current instance to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson();

  /// Deserialize [json] into a [BlockAction] instance.
  /// Returns [UnknownBlockAction] when the [json] is not a recognized type.
  static BlockAction fromJson(Map<String, dynamic> json) {
    final type = json['type'] as String?;
    switch (type) {
      case NavigateToArticleAction.identifier:
        return NavigateToArticleAction.fromJson(json);
      case NavigateToVideoArticleAction.identifier:
        return NavigateToVideoArticleAction.fromJson(json);
      case NavigateToFeedCategoryAction.identifier:
        return NavigateToFeedCategoryAction.fromJson(json);
      case NavigateToSlideshowAction.identifier:
        return NavigateToSlideshowAction.fromJson(json);
    }
    return const UnknownBlockAction();
  }
}

/// {@template navigate_to_article_action}
/// A block action which represents navigation to the article with [articleId].
/// {@endtemplate}
@JsonSerializable()
class NavigateToArticleAction with EquatableMixin implements BlockAction {
  /// {@macro navigate_to_article_action}
  const NavigateToArticleAction({
    required this.articleId,
    this.type = NavigateToArticleAction.identifier,
  });

  /// Converts a `Map<String, dynamic>`
  /// into a [NavigateToArticleAction] instance.
  factory NavigateToArticleAction.fromJson(Map<String, dynamic> json) =>
      _$NavigateToArticleActionFromJson(json);

  /// The identifier of this block action.
  static const identifier = '__navigate_to_article__';

  /// The id of the article to navigate to.
  final String articleId;

  @override
  BlockActionType get actionType => BlockActionType.navigation;

  @override
  final String type;

  @override
  Map<String, dynamic> toJson() => _$NavigateToArticleActionToJson(this);

  @override
  List<Object?> get props => [type, actionType, articleId];
}

/// {@template navigate_to_video_article_action}
/// A block action which represents navigation to the video article
/// with [articleId].
/// {@endtemplate}
@JsonSerializable()
class NavigateToVideoArticleAction with EquatableMixin implements BlockAction {
  /// {@macro navigate_to_video_article_action}
  const NavigateToVideoArticleAction({
    required this.articleId,
    this.type = NavigateToVideoArticleAction.identifier,
  });

  /// Converts a `Map<String, dynamic>`
  /// into a [NavigateToVideoArticleAction] instance.
  factory NavigateToVideoArticleAction.fromJson(Map<String, dynamic> json) =>
      _$NavigateToVideoArticleActionFromJson(json);

  /// The identifier of this block action.
  static const identifier = '__navigate_to_video_article__';

  /// The id of the video article to navigate to.
  final String articleId;

  @override
  BlockActionType get actionType => BlockActionType.navigation;

  @override
  final String type;

  @override
  Map<String, dynamic> toJson() => _$NavigateToVideoArticleActionToJson(this);

  @override
  List<Object?> get props => [type, actionType, articleId];
}


/// {@template navigate_to_video_action}
/// A block action which represents navigation to the video
/// with [videoId].
/// {@endtemplate}
@JsonSerializable()
class NavigateToVideoAction with EquatableMixin implements BlockAction {
  /// {@macro navigate_to_video_article_action}
  const NavigateToVideoAction({
    required this.videoId,
    this.type = NavigateToVideoAction.identifier,
  });

  /// Converts a `Map<String, dynamic>`
  /// into a [NavigateToVideoAction] instance.
  factory NavigateToVideoAction.fromJson(Map<String, dynamic> json) =>
      _$NavigateToVideoActionFromJson(json);

  /// The identifier of this block action.
  static const identifier = '__navigate_to_video__';

  /// The id of the video to navigate to.
  final String videoId;

  @override
  BlockActionType get actionType => BlockActionType.navigation;

  @override
  final String type;

  @override
  Map<String, dynamic> toJson() => _$NavigateToVideoActionToJson(this);

  @override
  List<Object?> get props => [type, actionType, videoId];
}

/// {@template navigate_to_video_action}
/// A block action which represents navigation to the video
/// with [videoId].
/// {@endtemplate}
@JsonSerializable()
class NavigateToPodcastAction with EquatableMixin implements BlockAction {
  /// {@macro navigate_to_video_article_action}
  const NavigateToPodcastAction({
    required this.podcastId,
    this.type = NavigateToPodcastAction.identifier,
  });

  /// Converts a `Map<String, dynamic>`
  /// into a [NavigateToPodcastAction] instance.
  factory NavigateToPodcastAction.fromJson(Map<String, dynamic> json) =>
      _$NavigateToPodcastActionFromJson(json);

  /// The identifier of this block action.
  static const identifier = '__navigate_to_podcast__';

  /// The id of the podcast to navigate to.
  final String podcastId;

  @override
  BlockActionType get actionType => BlockActionType.navigation;

  @override
  final String type;

  @override
  Map<String, dynamic> toJson() => _$NavigateToPodcastActionToJson(this);

  @override
  List<Object?> get props => [type, actionType, podcastId];
}

/// {@template navigate_to_feed_category_action}
/// A block action which represents navigation to the feed [category].
/// {@endtemplate}
@JsonSerializable()
class NavigateToFeedCategoryAction with EquatableMixin implements BlockAction {
  /// {@macro navigate_to_feed_category_action}
  const NavigateToFeedCategoryAction({
    required this.category,
    this.type = NavigateToFeedCategoryAction.identifier,
  });

  /// Converts a `Map<String, dynamic>`
  /// into a [NavigateToFeedCategoryAction] instance.
  factory NavigateToFeedCategoryAction.fromJson(Map<String, dynamic> json) =>
      _$NavigateToFeedCategoryActionFromJson(json);

  /// The identifier of this block action.
  static const identifier = '__navigate_to_feed_category__';

  /// The category of feed to navigate to.
  final String category;

  @override
  BlockActionType get actionType => BlockActionType.navigation;

  @override
  final String type;

  @override
  Map<String, dynamic> toJson() => _$NavigateToFeedCategoryActionToJson(this);

  @override
  List<Object?> get props => [type, actionType, category];
}

/// {@template navigate_to_slideshow_action}
/// A block action which represents navigation to the slideshow.
/// {@endtemplate}
@JsonSerializable()
class NavigateToSlideshowAction with EquatableMixin implements BlockAction {
  /// {@macro navigate_to_slideshow_action}
  const NavigateToSlideshowAction({
    required this.articleId,
    // required this.slideshow,
    this.type = NavigateToSlideshowAction.identifier,
  });

  /// Converts a `Map<String, dynamic>`
  /// into a [NavigateToSlideshowAction] instance.
  factory NavigateToSlideshowAction.fromJson(Map<String, dynamic> json) =>
      _$NavigateToSlideshowActionFromJson(json);

  /// The identifier of this block action.
  static const identifier = '__navigate_to_slideshow__';

  /// The id of the associated article.
  final String articleId;

  // /// The slideshow content.
  // final SlideshowBlock slideshow;

  @override
  BlockActionType get actionType => BlockActionType.navigation;

  @override
  final String type;

  @override
  Map<String, dynamic> toJson() => _$NavigateToSlideshowActionToJson(this);

  @override
  List<Object?> get props => [type, articleId, actionType];
}

/// {@template unknown_block_action}
/// A block action which represents an unknown type.
/// {@endtemplate}
@JsonSerializable()
class UnknownBlockAction with EquatableMixin implements BlockAction {
  /// {@macro unknown_block_action}
  const UnknownBlockAction({
    this.type = UnknownBlockAction.identifier,
  });

  /// Converts a `Map<String, dynamic>` into a [UnknownBlock] instance.
  factory UnknownBlockAction.fromJson(Map<String, dynamic> json) =>
      _$UnknownBlockActionFromJson(json);

  /// The identifier of this block action.
  static const identifier = '__unknown__';

  @override
  BlockActionType get actionType => BlockActionType.unknown;

  @override
  final String type;

  @override
  Map<String, dynamic> toJson() => _$UnknownBlockActionToJson(this);

  @override
  List<Object?> get props => [type, actionType];
}
