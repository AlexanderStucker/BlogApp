
# Blog App

Dieses Projekt ist eine einfache Blog-Anwendung, die in Flutter entwickelt wurde. Sie ermöglicht es Benutzern, Blog-Posts zu erstellen, zu durchsuchen und anzuzeigen.

## Inhaltsverzeichnis

- [Blog App](#blog-app)
  - [Inhaltsverzeichnis](#inhaltsverzeichnis)
  - [Über das Projekt](#über-das-projekt)
  - [Verwendete Technologien](#verwendete-technologien)
  - [Funktionen](#funktionen)
  - [Installation](#installation)
  - [Verwendung](#verwendung)
    - [Anmeldung und Registrierung](#anmeldung-und-registrierung)
    - [Blog-Posts erstellen](#blog-posts-erstellen)
    - [Blog-Posts durchsuchen](#blog-posts-durchsuchen)

## Über das Projekt

Die Blog-App bietet eine Plattform, auf der Benutzer ihre Blog-Posts erstellen und veröffentlichen können. Die App besteht aus verschiedenen Bildschirmen und Komponenten, die eine benutzerfreundliche Oberfläche bieten. Registrierte Benutzer können Blogs erstellen und veröffentlichen, während Gäste nur die Blogs anzeigen können. Firebase wird für die Authentifizierung und Datenbank verwendet.

## Verwendete Technologien

- Flutter
- Dart
- Firebase Auth
- Firebase Firestore

## Funktionen

1. **Benutzeranmeldung und Registrierung**:
   - Benutzer können sich mit ihrer E-Mail und einem Passwort registrieren oder anmelden.
   - Es besteht auch die Möglichkeit, als Gast (anonym) einzuloggen, jedoch können Gastbenutzer keine Blogs erstellen.

2. **Blog-Posts erstellen**:
   - Registrierte Benutzer können neue Blog-Beiträge verfassen und veröffentlichen.
   - Jeder Blog wird mit dem Namen des Autors, dem Titel, Text, Bild und Datum angezeigt.

3. **Blog-Posts durchsuchen und anzeigen**:
   - Alle Benutzer, einschließlich Gäste, können die veröffentlichten Blogs anschauen.

4. **Firebase-Integration**:
   - Firebase Auth wird für die Benutzerregistrierung, Anmeldung und anonyme Anmeldung verwendet.
   - Firebase Firestore wird zur Speicherung der Blog-Posts und Benutzerdaten genutzt.


## Installation

Um das Projekt lokal auszuführen, müssen die folgenden Schritte befolgt werden:

1. [Flutter installieren](https://flutter.dev/docs/get-started/install)
2. Repository klonen:
    ```sh
    git clone https://github.com/AlexanderStucker/BlogApp.git
    ```
3. Abhängigkeiten installieren:
    ```sh
    flutter pub get
    ```
4. 4. Firebase konfigurieren (Meine json-Datei ist im Repo vorhanden):
   - Erstelle ein Firebase-Projekt.
   - Füge die `google-services.json` für Android hinzu.

5. App ausführen:
    ```sh
    flutter run
    ```

## Verwendung

### Anmeldung und Registrierung

- **Anmeldung mit E-Mail und Passwort**: Benutzer können sich anmelden.
- **Registrierung**: Neue Benutzer können sich registrieren.
- **Gast-Anmeldung**: Benutzer können anonym in die App einloggen, allerdings dürfen sie keine Blog-Posts erstellen.

### Blog-Posts erstellen

- Registrierte Benutzer können auf der "Write New Blog"-Seite einen Titel und einen Text für ihren Blog eingeben und den Beitrag veröffentlichen.

### Blog-Posts durchsuchen

- Alle Benutzer können die Liste der veröffentlichten Blogs durchsuchen und die Details eines Blogs anzeigen.


