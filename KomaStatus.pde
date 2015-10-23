class KomaStatus {
  boolean captured;
  boolean active;
  boolean selected;

  KomaStatus(boolean active) {
    this.active = active;
    this.captured = false;
    this.selected = false;
  }

  //boolean exists() {
  //  return this.active;
  //}
  boolean isCaptured() {
    return this.active && this.captured;
  }
}