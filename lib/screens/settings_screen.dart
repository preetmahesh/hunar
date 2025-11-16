import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notificationToggle = true;
  bool darkModeToggle = false;
  bool fingerprintToggle = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF062355),
      body: Stack(
        children: [
          _blob(
            size: 350,
            top: -120,
            left: -80,
            color: const Color(0x444A90E2),
          ),
          _blob(
            size: 400,
            bottom: -140,
            left: -80,
            color: const Color(0x4478350F),
          ),
          _blob(
            size: 280,
            top: 200,
            right: -100,
            color: const Color(0x33F4F1EC),
          ),
          _blob(size: 240, top: 280, left: -60, color: const Color(0x3380B7FF)),
          _blob(
            size: 300,
            bottom: 90,
            right: -60,
            color: const Color(0x3378350F),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // HEADER
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        "Settings",
                        style: GoogleFonts.getFont(
                          'Abril Fatface',
                          color: Colors.white,
                          fontSize: 32,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  Text(
                    "Preferences",
                    style: GoogleFonts.getFont(
                      'Abril Fatface',
                      color: Colors.white,
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(height: 15),

                  // NOTIFICATIONS
                  _switchTile(
                    title: "Push Notifications",
                    icon: Icons.notifications_active_outlined,
                    value: notificationToggle,
                    onChanged: (val) =>
                        setState(() => notificationToggle = val),
                  ),

                  // DARK MODE
                  _switchTile(
                    title: "Dark Mode",
                    icon: Icons.dark_mode_outlined,
                    value: darkModeToggle,
                    onChanged: (val) => setState(() => darkModeToggle = val),
                  ),

                  // FINGERPRINT
                  _switchTile(
                    title: "Fingerprint Login",
                    icon: Icons.fingerprint,
                    value: fingerprintToggle,
                    onChanged: (val) => setState(() => fingerprintToggle = val),
                  ),

                  const SizedBox(height: 30),

                  Text(
                    "Account Settings",
                    style: GoogleFonts.getFont(
                      'Abril Fatface',
                      color: Colors.white,
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(height: 15),

                  _editableTile(
                    title: "Change Username",
                    icon: Icons.person_outline,
                    onPressed: () => _editField(context, "Change Username"),
                  ),

                  _editableTile(
                    title: "Change Email Address",
                    icon: Icons.email_outlined,
                    onPressed: () => _editField(context, "Change Email"),
                  ),

                  _editableTile(
                    title: "Change Password",
                    icon: Icons.lock_outline,
                    onPressed: () => _editField(context, "Change Password"),
                  ),

                  const SizedBox(height: 30),

                  Text(
                    "Other",
                    style: GoogleFonts.getFont(
                      'Abril Fatface',
                      color: Colors.white,
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(height: 15),

                  _simpleTile(
                    title: "Clear Cache",
                    icon: Icons.cleaning_services_outlined,
                    color: Colors.orange,
                    onPressed: () => _showMessage(
                      context,
                      "App cache cleared successfully!",
                    ),
                  ),

                  _simpleTile(
                    title: "Log Out",
                    icon: Icons.logout,
                    color: Colors.red,
                    onPressed: () =>
                        _showMessage(context, "Logged out (add logic later)"),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ----------------------- BLOB -----------------------
  Widget _blob({
    required double size,
    required Color color,
    double? top,
    double? left,
    double? right,
    double? bottom,
  }) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(color: color, blurRadius: 90, spreadRadius: 40),
          ],
        ),
      ),
    );
  }

  // ----------------------- SWITCH TILE -----------------------
  Widget _switchTile({
    required String title,
    required IconData icon,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F1EC),
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF78350F)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: Switch(
          value: value,
          activeColor: const Color(0xFF78350F),
          onChanged: onChanged,
        ),
      ),
    );
  }

  // ----------------------- EDITABLE TILE -----------------------
  Widget _editableTile({
    required String title,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F1EC),
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        onTap: onPressed,
        leading: Icon(icon, color: const Color(0xFF78350F)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }

  // ----------------------- SIMPLE TILE -----------------------
  Widget _simpleTile({
    required String title,
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF4F1EC),
        borderRadius: BorderRadius.circular(18),
      ),
      child: ListTile(
        onTap: onPressed,
        leading: Icon(icon, size: 30, color: color),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      ),
    );
  }

  // ----------------------- EDIT FIELD POPUP -----------------------
  void _editField(BuildContext context, String title) {
    TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: TextField(controller: controller),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _showMessage(context, "$title updated successfully!");
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  // ----------------------- MESSAGE -----------------------
  void _showMessage(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }
}
