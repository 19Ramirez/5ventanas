import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 280,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF37474f),
              Color(0xFF455a64),
              Color(0xFF546e7a),
            ],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            _buildHeader(context),
            _buildMenuSection(
              title: "PRINCIPAL",
              items: [
                _buildMenuItem(
                  context: context,
                  icon: Icons.home,
                  title: "Inicio",
                  onTap: () => _showSnackBar(context, "Navegando al Inicio"),
                ),
                _buildMenuItem(
                  context: context,
                  icon: Icons.search,
                  title: "Buscar",
                  onTap: () => _showSnackBar(context, "Buscando contenido"),
                ),
                _buildMenuItem(
                  context: context,
                  icon: Icons.explore,
                  title: "Explorar",
                  onTap: () => _showSnackBar(context, "Explorando"),
                ),
                _buildMenuItem(
                  context: context,
                  icon: Icons.favorite,
                  title: "Favoritos",
                  onTap: () => _showSnackBar(context, "Favoritos"),
                ),
              ],
            ),
            _buildMenuSection(
              title: "COMUNICACIÓN",
              items: [
                _buildMenuItem(
                  context: context,
                  icon: Icons.notifications,
                  title: "Notificaciones",
                  badgeCount: 3,
                  onTap: () => _showSnackBar(context, "Notificaciones"),
                ),
                _buildMenuItem(
                  context: context,
                  icon: Icons.email,
                  title: "Mensajes",
                  badgeCount: 7,
                  onTap: () => _showSnackBar(context, "Mensajes"),
                ),
                _buildMenuItem(
                  context: context,
                  icon: Icons.people,
                  title: "Contactos",
                  onTap: () => _showSnackBar(context, "Contactos"),
                ),
              ],
            ),
            _buildMenuSection(
              title: "CONFIGURACIÓN",
              items: [
                _buildMenuItem(
                  context: context,
                  icon: Icons.settings,
                  title: "Ajustes",
                  onTap: () => _showSnackBar(context, "Configuración"),
                ),
                _buildMenuItem(
                  context: context,
                  icon: Icons.help,
                  title: "Ayuda",
                  onTap: () => _showSnackBar(context, "Centro de ayuda"),
                ),
                _buildMenuItem(
                  context: context,
                  icon: Icons.info,
                  title: "Acerca de",
                  onTap: () => _showSnackBar(context, "Acerca de"),
                ),
              ],
            ),
            _buildMenuSection(
              title: "ACCIONES",
              items: [
                _buildMenuItem(
                  context: context,
                  icon: Icons.file_upload,
                  title: "Subir Archivo",
                  onTap: () => _showSnackBar(context, "Subiendo archivo"),
                ),
                _buildMenuItem(
                  context: context,
                  icon: Icons.share,
                  title: "Compartir",
                  onTap: () => _showSnackBar(context, "Compartiendo"),
                ),
                _buildMenuItem(
                  context: context,
                  icon: Icons.exit_to_app,
                  title: "Cerrar Sesión",
                  onTap: () => _showSnackBar(context, "Cerrando sesión"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: const Text(
        "Francisco Ramirez",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      accountEmail: const Text(
        "fea.ramirez@yavirac.edu.ec",
        style: TextStyle(
          fontSize: 12,
        ),
      ),
      currentAccountPicture: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.orange,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          child: ClipOval(
            child: Image.asset(
              "images/Login.jpg",
              fit: BoxFit.cover,
              width: 60,
              height: 60,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.person,
                  color: Colors.grey.shade700,
                  size: 30,
                );
              },
            ),
          ),
        ),
      ),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF263238),
            Color(0xFF37474f),
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      margin: EdgeInsets.zero,
    );
  }

  Widget _buildMenuSection({
    required String title,
    required List<Widget> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              letterSpacing: 1.2,
            ),
          ),
        ),
        ...items,
      ],
    );
  }

  Widget _buildMenuItem({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    int badgeCount = 0,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1,
            ),
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: badgeCount > 0
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.orange.withOpacity(0.3),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  badgeCount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : null,
        onTap: onTap,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hoverColor: Colors.white.withOpacity(0.1),
        focusColor: Colors.white.withOpacity(0.15),
      ),
    );
  }

  Widget _buildFooter() {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Divider(
            color: Colors.white30,
            height: 20,
            thickness: 0.5,
          ),
          SizedBox(height: 10),
          Text(
            "Versión 1.0.0",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 5),
          Text(
            "© 2024 Tu Empresa",
            style: TextStyle(
              color: Colors.white38,
              fontSize: 10,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.orange.shade300,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: const Color(0xFF37474f),
        elevation: 6,
      ),
    );
    Navigator.pop(context);
  }
}