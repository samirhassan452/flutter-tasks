part of '../../shared_feature.exports.dart';

const _value = 'value';
const _label = 'label';

class LookupModel<T> extends Equatable {
  final T value;
  final String label;
  const LookupModel({required this.value, required this.label});

  @override
  List<Object?> get props => [value, label];

  factory LookupModel.fromMap(Map<String, dynamic> map) {
    return LookupModel<T>(
      value: map[_value] as T,
      label: map[_label] ?? '',
    );
  }

  LookupModel<T> copyWith({
    T? value,
    String? label,
  }) {
    return LookupModel<T>(
      value: value ?? this.value,
      label: label ?? this.label,
    );
  }
}
