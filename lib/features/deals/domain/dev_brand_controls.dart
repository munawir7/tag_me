/// Lets developers make the brand act from inside the app (debug builds
/// only). Implemented by the mock backend; a real backend provides none,
/// so the debug buttons simply don't appear.
abstract interface class DevBrandControls {
  void brandApproveApplication(String dealId);
  void brandRejectApplication(String dealId);
  void brandRedeemCode(String dealId);
  void brandSendThankYou(String dealId);
  void brandEndCollab(
    String dealId, {
    required String reason,
    bool strike = false,
  });
}
