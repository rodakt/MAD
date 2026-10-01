-- Makra matematyczne z książki w slajdach revealjs.
--
-- Wtyczka matematyczna revealjs składa wzory tylko wewnątrz prezentacji,
-- więc definicje dołączone przez include-before-body nie działają (tak jak
-- na zwykłych stronach). Filtr wstawia definicje z _macros-html.html jako
-- ukryty wzór na początek pierwszego slajdu każdej prezentacji.

local function wczytaj_makra()
  local sciezka = quarto.project.directory .. "/_macros-html.html"
  local plik = io.open(sciezka, "r")
  if not plik then
    quarto.log.warning("Brak pliku z makrami: " .. sciezka)
    return nil
  end
  local tresc = plik:read("a")
  plik:close()
  return tresc:match("\\%((.-)\\%)")
end

function Pandoc(doc)
  if not quarto.doc.is_format("revealjs") then
    return nil
  end
  local makra = wczytaj_makra()
  if not makra then
    return nil
  end
  local blok = pandoc.Div(
    { pandoc.Para({ pandoc.Math("DisplayMath", makra) }) },
    { class = "hidden" }
  )
  -- Za pierwszym nagłówkiem slajdu; blok przed nim tworzyłby pusty slajd.
  for i, b in ipairs(doc.blocks) do
    if b.t == "Header" and b.level <= 2 then
      doc.blocks:insert(i + 1, blok)
      return doc
    end
  end
  doc.blocks:insert(1, blok)
  return doc
end
