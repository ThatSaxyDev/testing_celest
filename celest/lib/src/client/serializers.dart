// ignore_for_file: type=lint, unused_local_variable, unnecessary_cast, unnecessary_import

import 'package:celest/celest.dart';
import 'package:celest_backend/models.dart';

final class ResponseeSerializer extends Serializer<Responsee> {
  const ResponseeSerializer();

  @override
  Responsee deserialize(Object? value) {
    final serialized = assertWireType<Map<String, Object?>>(value);
    return Responsee(
      status: (serialized[r'status'] as bool),
      message: (serialized[r'message'] as String),
    );
  }

  @override
  Map<String, Object?> serialize(Responsee value) => {
        r'status': value.status,
        r'message': value.message,
      };
}
