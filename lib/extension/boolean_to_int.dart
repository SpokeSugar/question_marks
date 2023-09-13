extension BoolToInt on bool {
  int toInt() => this ? 1 : 0;
}

extension IntToBoolean on int {
  bool toBool() => !(this == 0);
}
