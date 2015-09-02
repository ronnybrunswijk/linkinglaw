# language: nl
Functionaliteit: reviewen juridische professional

  @signed_in @profiles		 
  Scenario: de ondernemer schrijft een review over een juridische professional
    Stel ik als ondernemer bekijk ik een profiel van juridische professional die mij een dienst heeft verleend
    Dan wil ik de mogelijkheid hebben om mijn ervaring met de juridische professional te evalueren
    En als ik een evaluatie schrijf 
    Dan wil ik verzekerd van zijn dat mijn evaluatie correct wordt opgeslagen

  @profile_with_reviews
  Scenario: de anonieme bezoeker bekijkt een review over een juridische professional
    Stel ik als anonieme bezoeker bekijk ik het profiel van een juridische professional 
    Dan wil ik daarbij ook de reviews zien die over de juridische professional geschreven zijn

  @profile_with_reviews
  Scenario: de anonieme bezoeker bekijkt de rating van een juridische professional
    Stel ik als anonieme bezoeker bekijk ik het profiel van een juridische professional 
    Dan wil ik de beoordeling van de juridische professional in een cijfer uitgedrukt kunnen zien    
