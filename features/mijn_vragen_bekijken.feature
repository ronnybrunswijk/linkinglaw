# language: nl
Functionaliteit: Mijn vragen inzien

  @signed_in
  Scenario: De ondernemer bekijkt zijn gestelde vragen
     Stel ik ben ingelogd als ondernemer
     Als ik naar de 'Mijn vragen' pagina ga
     Dan wil ik al mijn eerder gestelde vragen zien

  @signed_in
  Scenario: De ondernemer bekijkt de details van 1 van 
            zijn gestelde vragen
    Stel ik ben ingelogd als ondernemer
    En ik bevind me op de 'Mijn vragen' pagina
    Als ik dan op 1 van mijn gestelde vragen klik
    Dan wil ik de details zien van de vraag, waarop ik heb geklikt