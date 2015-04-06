Als(/^ik bevind me op de 'Stel een vraag' pagina$/) do
  visit 'questions/new'
  page.find("title", text: I18n.t(:ask_question, scope: [:questions]))
end

Stel(/^ik voer een te lange titel in$/) do
   fill_in "question_title", with: "a" * 101
   fill_in "question_description", with: "aa"
end

En(/^ik bekijk de vraag$/) do
   click_button I18n.t(:preview_question, scope: [:questions])
end

Dan(/^wil ik een passende foutmelding zien$/) do
    assert page.has_content?("Titel is te lang (maximaal 100 tekens)")
end
