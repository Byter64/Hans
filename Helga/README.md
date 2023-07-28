# HELGA

Helga ist der Assembler für Hans.
Sie übersetzt ein gegebenes Assembler Program in eine Binär Datei, die Hans ausführen kann.
Nähere Informationen zur Assembler Sprache, die Helga versteht, finden sich in der Dokumentation.

# Version 1.0

- Übersetzt Befehle in Binärcode.
- Ersetzt Labels mit relativen Sprungadressen.
- Gibt mögliche Syntaxfehler mit Linienangabe und Grund aus.
- Nach Fehlererkennung versucht Helga das Program weiter zu übersetzten um mögliche andere Syntaxfehler zu finden.
- Bei erkanntem Syntaxfehler in einer Zeile wird der Rest der Zeile allerdings ignoriert.