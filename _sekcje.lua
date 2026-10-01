-- Slajdy otwierające część prezentacji (nagłówki "#") dostają pełne
-- kolorowe tło, żeby podział wykładu był widoczny. Kolor to granat
-- z motywu flatly strony kursu; tekst na nim rozjaśnia slajdy/_slajdy.scss.

function Header(h)
  if not quarto.doc.is_format("revealjs") or h.level ~= 1 then
    return nil
  end
  if h.attributes["background-color"] == nil then
    h.attributes["background-color"] = "#2c3e50"
  end
  return h
end
