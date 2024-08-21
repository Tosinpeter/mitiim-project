import 'package:collection/collection.dart';

enum PublishedBy {
  provider,
  client,
}

enum PublishCategory {
  Catering,
  HomeHelp,
  Beauty,
  IT,
  PrivateLessons,
  Administrative,
  Construction,
  MovingAssembly,
  Delivery,
}

enum SortBy {
  assending,
  dessending,
}

enum Gender {
  Male,
  Female,
}

enum FilterRatingProvider {
  oneStar,
  twoStar,
  threeStar,
  fourStar,
  fiveStar,
}

enum PriceFilterType {
  hourly,
  daily,
  fixed,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (PublishedBy):
      return PublishedBy.values.deserialize(value) as T?;
    case (PublishCategory):
      return PublishCategory.values.deserialize(value) as T?;
    case (SortBy):
      return SortBy.values.deserialize(value) as T?;
    case (Gender):
      return Gender.values.deserialize(value) as T?;
    case (FilterRatingProvider):
      return FilterRatingProvider.values.deserialize(value) as T?;
    case (PriceFilterType):
      return PriceFilterType.values.deserialize(value) as T?;
    default:
      return null;
  }
}
