# NJIT-2021-2022-Vizsgaremek

## Projekt neve: *FiveFile*

#### Készítették: Pap András, Pardi Polett, Farkas Péter

###### Projekt leírása:

###### Egy online fájl tároló szoftvert készítünk, melynek célja, hogy a felhasználó egy helyen el tudja érni a számára fontos fájlokat. Regisztráció után a felhasználók tudnak fájlokat feltölteni, letölteni, törölni és megosztani egymás között.

##### A projekt Trello táblája:

[https://trello.com/b/uQlKWyJK/njit-2021-2021-vizsgaremek]

###### A projekt üzembe helyezése:

###### Letöltjük a GitHub-ról a projektünket, majd elindítjuk a docker programot. Ezt követően a backend elindításához nem kell mást tenni, mint a Backend mappából elindítani az install kezdetű fájlok közül az általunk használt operációs rendszernek megfelelőt.  Ha lefutott, átlépünk a Frontend mappába, és az általunk használt CLI programban megnyitjuk a Frontend mappát, és kiadjuk a következő: npm install, npm run dev. Ez után a CLI-ben megjelenő localhost linken meg tudjuk nyitni az alkalmazást.
###### Az android alkalmazás jelen állapotban csak az Android Studióból emulátorral futtatva tesztelhető.

###### Az adatbázisba a következő felhasználónév - jelszó párossal lehet belépni: 5FileAdmin - p3NZmvGBzm
###### Az adatbázis a http://localhost:8882/ linken elérhető

###### A telepítéseket követően a fenti linket megnyitva az a FiveFile adatbázisba be kell importálni az Adatbázis mappában található fivefile.sql fájlt.

###### Az install fájlok lefutásával a Backend public mappájából a files.zip fájl átmásolódik a storage/app/storage mappába és kicsomagolódik. Amennyiben mégsem, ez a művelet kézzel elvégzendő a tesztadatok felöltése végett.

###### Az adatbázis importálásával a következő felhasználói fiókok érhetőek el: csiazsofia, raczroland, mateszilvi, csehviktoria. Mindegyik fiókhoz a jelszó "12345678". Admin jogú felhasználó: raczroland