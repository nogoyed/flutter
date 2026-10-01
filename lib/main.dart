import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SettingsPage(),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),

      appBar: AppBar(
        backgroundColor: const Color(0xFFF2F2F2),
        elevation: 0,
        centerTitle: true,
        leading: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
          size: 22,
        ),
        title: const Text(
          'Paramètres',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // section compte
            const SectionTitle(title: 'Compte'),

            SettingsCard(
              children: [
                SettingsItem(
                  icon: Icons.account_balance_wallet_outlined,
                  title: 'Ajouter un autre compte',
                  showDivider: false,
                ),
              ],
            ),

            // section partager
            const SectionTitle(title: 'Partager'),

            SettingsCard(
              children: [
                SettingsItem(
                  icon: Icons.ios_share_outlined,
                  title: 'Inviter un ami à rejoindre Wave',
                ),
                SettingsItem(
                  icon: Icons.auto_awesome,
                  title: 'Utiliser le code promotionnel',
                  showDivider: false,
                ),
              ],
            ),

            // section assistance
            const SectionTitle(title: 'Assistance'),

            SettingsCard(
              children: [
                SettingsItem(
                  icon: Icons.phone,
                  title: 'Contactez le service client',
                ),
                SettingsItem(
                  icon: Icons.location_on,
                  title: 'Trouvez les agents à proximité',
                ),
                SettingsItem(
                  icon: Icons.assignment,
                  title: 'Vérifiez votre plafond',
                  showDivider: false,
                ),
              ],
            ),

            // section securité
            const SectionTitle(title: 'Sécurité'),

            SettingsCard(
              children: [
                SettingsItem(
                  icon: Icons.phone_android,
                  title: 'Vos appareils connectés',
                ),
                SettingsItem(
                  icon: Icons.shield_outlined,
                  title: 'Modifiez votre code secret',
                  showDivider: false,
                ),
              ],
            ),

            const SizedBox(height: 20),

            //  section Deconnexion
            SettingsCard(
              children: [
                SettingsItem(
                  icon: Icons.logout,
                  title: 'Se déconnecter',
                  trailingText: 'Déconnexion',
                  showDivider: false,
                ),
              ],
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}




class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 12,
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
      ),
    );
  }
}




class SettingsCard extends StatelessWidget {
  final List<Widget> children;

  const SettingsCard({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: children,
      ),
    );
  }
}




class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? trailingText;
  final bool showDivider;

  const SettingsItem({
    super.key,
    required this.icon,
    required this.title,
    this.trailingText,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 22,
          ),
          child: Row(
            children: [

              // ICON
              SizedBox(
                width: 35,
                child: Icon(
                  icon,
                  size: 28,
                  color: Colors.black,
                ),
              ),

              const SizedBox(width: 25),

              // TEXTE
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),

              // TEXTE OPTIONNEL A DROITE
              if (trailingText != null)
                Text(
                  trailingText!,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
            ],
          ),
        ),

        if (showDivider)
          const Divider(
            height: 1,
            thickness: 0.5,
            indent: 80,
            endIndent: 20,
            color: Color(0xFFE5E5E5),
          ),
      ],
    );
  }
}