# RedOS 12 — pakiet aktualizacji

To jest **szablon pakietu wydania RedOS 12.0.0** przygotowany do umieszczenia w repozytorium GitHub.

## Co znajduje się w paczce

- `Update/manifest.json` — metadane wydania, które może odczytać mechanizm sprawdzania aktualizacji.
- `Sources/RedOSUpdateChecker.swift` — przykładowy kod Swift do pobrania i zweryfikowania manifestu.
- `CHANGELOG.md` — miejsce na opis zmian.
- `RELEASE_CHECKLIST.md` — lista kontrolna przed publikacją.

## Ważne ograniczenie i uczciwy status

Nie otrzymałem aktualnego pełnego kodu źródłowego RedOS 11, więc ta paczka **nie jest kompletną aktualizacją istniejącej aplikacji** i nie zawiera zmian w ekranach, logowaniu ani terminalu. To bezpieczny szkielet wydania i sprawdzania metadanych.

Swift Playgrounds na iPadzie nie pozwala aplikacji samodzielnie podmienić własnego kodu lub zainstalować nowej wersji aplikacji. Przykładowy mechanizm może sprawdzić manifest i poinformować o aktualizacji; instalacja nowej wersji aplikacji wymaga ponownego zbudowania i udostępnienia aplikacji.

## Publikacja w GitHub

1. Utwórz repozytorium, np. `RedOS`.
2. Wypakuj zawartość archiwum do repozytorium.
3. Uzupełnij `CHANGELOG.md` rzeczywistymi zmianami.
4. W `Sources/RedOSUpdateChecker.swift` ustaw adres do `manifest.json` w swoim repozytorium.
5. Wypchnij pliki do GitHuba.
6. Przed ogłoszeniem wydania przetestuj projekt w Swift Playgrounds.

Nie publikuj haseł, tokenów ani prywatnych danych użytkowników w repozytorium.
