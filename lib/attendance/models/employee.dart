import 'package:collection/collection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

@JsonSerializable()
class Employee {
  final int? id;
  final String? nama;
  final String? ssn;

  const Employee({this.id, this.nama, this.ssn});

  @override
  String toString() => 'Employee(id: $id, nama: $nama, ssn: $ssn)';

  factory Employee.fromJson(Map<String, dynamic> json) {
    return _$EmployeeFromJson(json);
  }

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);

  Employee copyWith({
    int? id,
    String? nama,
    String? ssn,
  }) {
    return Employee(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      ssn: ssn ?? this.ssn,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Employee) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toJson(), toJson());
  }

  @override
  int get hashCode => id.hashCode ^ nama.hashCode ^ ssn.hashCode;
}
