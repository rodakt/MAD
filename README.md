# Modele analizy danych -- strona kursu

Źródło strony <https://rodakt.github.io/MAD/> (Quarto website). Podręcznik
kursu: <https://rodakt.github.io/MAD_book/>.

## Gałęzie i tagi

- Każda edycja kursu ma własną gałąź (np. `2026-27`); z niej workflow
  `.github/workflows/publish.yml` publikuje stronę.
- Po zakończeniu edycji `main` jest przewijany (fast-forward) do gałęzi
  edycji i dostaje tag z jej nazwą. Na `main` nie commitujemy w trakcie
  semestru.
- Poprzednie edycje: tagi (`2025-26` -- notebooki wykładów i laboratoriów).

## Praca lokalnie

```bash
quarto preview     # podgląd na żywo
quarto render      # pełny render do _site/
```

## Struktura

```
index.qmd          strona główna
harmonogram.qmd    harmonogram zajęć
slajdy/            slajdy wykładów (revealjs)
laby/              karty laboratoriów; szablon: laby/_szablon-karty.qmd
_macros-html.html  makra matematyczne -- kopia pliku z repozytorium książki
_makra.lua         filtr wstawiający te makra do slajdów revealjs
_freeze/           cache obliczeń -- COMMITOWANY (CI renderuje bez Pythona)
```

Makra (`\x`, `\Risk`, `\E`, ...) są te same co w książce. Po zmianie makr
w książce skopiuj `_macros-html.html` ponownie, bez edycji.

Ćwiczenia są w książce. Karty laboratoriów linkują do nich
(`#exr-...`) i dokładają tylko część pythonową.
