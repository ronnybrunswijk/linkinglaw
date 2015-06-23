# language: nl
Functionaliteit: Mijn vragen inzien

  @signed_in
  Scenario: De ondernemer bekijkt zijn gestelde vragen
     Stel ik ben ingelogd als ondernemer
     Als ik naar de 'Mijn vragen' pagina ga
     Dan wil ik al mijn eerder gestelde vragen zien
  
  Scenario: De ondernemer wil zijn gestelde vragen inzien, 
            maar is niet ingelogd.
     Stel ik bevind me op de 'Home' pagina
     En ik ben niet ingelogd
     Als ik dan via de adresbalk naar de 'Mijn vragen' pagina navigeer
     Dan wil ik op de 'Log in' pagina terecht komen
     En een melding zien dat ik nog moet inloggen

  @signed_in
  Scenario: De ondernemer bekijkt de details van 1 van 
            zijn gestelde vragen
    Stel ik ben ingelogd als ondernemer
    En ik bevind me op de 'Mijn vragen' pagina
    Als ik dan op 1 van mijn gestelde vragen klik
    Dan wil ik de details zien van de vraag, waarop ik heb geklikt

  @signed_in
  Scenario: De ondernemer bekijkt de details van 1 van zijn gestelde vragen
            en gaat terug naar het overzicht van zijn gestelde vragen via de 'Naar overzicht' link
      Stel ik ben ingelogd als ondernemer
      En ik bevind me op de detail pagina van 1 van mijn vragen
      Dan wil via de 'Naar overzicht' link weer terug kunnen naar het overzicht van al mijn gestelde vragen
            