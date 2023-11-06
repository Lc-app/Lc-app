import 'package:freezed_annotation/freezed_annotation.dart';
part 'counter.freezed.dart';
part 'counter.g.dart';

@freezed
class Counter with _$Counter {
  const factory Counter({
    @JsonKey(name: "id") required String id,
    @JsonKey(name: "value") required int value,
  }) = _Counter;

  factory Counter.fromJson(Map<String, dynamic> json) =>
      _$CounterFromJson(json);
}
