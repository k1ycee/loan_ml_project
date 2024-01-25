class GeneralModel {
  final String key;
  final int value;
  GeneralModel({
    required this.key,
    required this.value,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is GeneralModel &&
      other.key == key &&
      other.value == value;
  }

  @override
  int get hashCode => key.hashCode ^ value.hashCode;
}
