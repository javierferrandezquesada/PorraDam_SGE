import 'package:flutter_riverpod/flutter_riverpod.dart';

class AliasNotifier extends Notifier<String> {
  @override
  String build() => '';

  void cambiar(String nuevoAlias) {
    state = nuevoAlias.trim();
  }
}

final aliasProvider = NotifierProvider<AliasNotifier, String>(
  AliasNotifier.new,
);