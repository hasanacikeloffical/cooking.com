import 'package:theme_manager/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    final localManager = Provider.of<LocaleManager>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(localManager.translate('dark_theme')),
            Switch(
              value: themeManager == ThemeMode.dark,
              onChanged: (value) {
                themeManager;
              },
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(localManager.translate('language')),
            const SizedBox(width: 10),
            DropdownButton<Locale>(
              value: localManager.currentLocale,
              onChanged: (Locale? newLocale) {
                if (newLocale != null) {
                  localManager
                      .changedLocale(newLocale); // Dil değişikliğini uygulama
                }
              },
              items: const [
                DropdownMenuItem(
                  value: Locale('en'),
                  child: Text('English'),
                ),
                DropdownMenuItem(
                  value: Locale('tr'),
                  child: Text('Türkçe'),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class LocaleManager {
  Locale currentLocale = Locale('en'); // Varsayılan dil İngilizce

  // Dil değişikliğini işleyen metod
  void changedLocale(Locale newLocale) {
    currentLocale = newLocale;
    // Burada dil değişikliğini uygulatmak için ek adımlar ekleyebilirsiniz.
    // Örneğin, dil değişikliği sonrası uygulamanın yeniden başlatılması gerekebilir.
  }

  // Dil çevirisi yapan bir metod örneği
  String translate(String key) {
    // Bu kısmı kendi dil çevirisi işlemlerinizle doldurun.
    // Bu örnekte sadece anahtar kelimesi döndürülüyor.
    switch (currentLocale.languageCode) {
      case 'en':
        if (key == 'dark_theme') return 'Dark Theme';
        if (key == 'language') return 'Language';
        break;
      case 'tr':
        if (key == 'dark_theme') return 'Karanlık Mod';
        if (key == 'language') return 'Dil';
        break;
    }
    return key; // Eğer çeviri bulunmazsa, orijinal anahtar döner.
  }
}
