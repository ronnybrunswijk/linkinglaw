# language: nl
Functionaliteit: de ondernemer stelt een vraag, 
		 waarop hij 1 of meerdere reacties 
		 juridisch professional verwacht

  Scenario: de ondernemer wil een vraag stellen, maar is niet ingelogd
    Stel als ondernemer bevind ik me op de 'preview vraag' pagina
    En ik wil mijn vraag plaatsen, maar ben niet ingelogd
    Dan wil ik de mogelijkheid om alsnog meteen in te loggen	

  Scenario: de ondernemer wil een vraag stellen, maar heeft zich nog niet geregistreerd
    Stel als ondernemer bevind ik me op de 'preview vraag' pagina
    En ik wil mijn vraag plaatsen, maar heb me nog niet geregistreerd
    Dan wil ik de mogelijkheid om me alsnog meteen te registreren

  Abstract Scenario: de ondernemer wil een vraag stellen, maar heeft zich nog niet geregistreerd. Hij voert een verkeerd bevestigingswachtwoord in, wanneer hij zich alsnog registreerd.
    Stel als ondernemer bevind ik me op de 'preview vraag' pagina
    En ik wil mijn vraag plaatsen, maar heb me nog niet geregistreerd
    Dan wil ik de mogelijkheid om me alsnog meteen te registreren
    Als ik daarbij een verkeerd bevestigingswachtwoord invoer  
    Dan wil ik een gepaste <foutmelding> zien 

    Voorbeelden:
    |			              foutmelding                        			|
    | "Bevestiging wachtwoord komt niet overeen met Wachtwoord" |

  Abstract Scenario: de ondernemer wil een vraag stellen, maar is niet ingelogd. Hij voert een verkeerd wachtwoord in, wanneer hij alsnog inlogt.
    Stel als ondernemer bevind ik me op de 'preview vraag' pagina
    En ik wil mijn vraag plaatsen, maar ben niet ingelogd
    Als ik alsnog meteen inlog en daarbij een verkeerd wachtwoord invoer
    Dan wil ik een gepaste <foutmelding> zien

    Voorbeelden:
    |		        foutmelding	           |
    | "Ongeldig e-mail of wachtwoord"  |

   # test because of bug 338 
   Scenario: de ondernemer wil, na het beoordelen ervan, zijn vraag wijzigen. De ondernemer is daarbij niet ingelogd.
     Stel als ondernemer bevind ik me op de 'preview vraag' pagina en ben niet ingelogd
     Dan wil ik de mogelijk hebben om mijn vraag te wijzigen
     Als ik gebruik maak van de mogelijkheid om mijn vraag te wijzigen
     Dan wil ik terugkeren naar 'vraag plaatsen' pagina
     
   @signed_in @seeds
   Scenario: de ingelogd ondernemer wil een rechtsgebied selecteren voor de vraag die hij wil stellen
     Stel als ondernemer heb ik een vraag opgevoerd die ik daadwerkelijk wil stellen
     Dan wil ik daarbij ook het rechtsgebied, waarop de vraag betrekking heeft, kunnen selecteren
     En dat het geselecteerde rechtsgebied tezamen met mijn vraag wordt opgeslagen

   @signed_in @seeds   
   Scenario: de ondernemer wil 1 of meerdere provincies kunnen selecteren voor de vraag die hij wil stellen
     Stel als ondernemer heb ik een vraag opgevoerd die ik daadwerkelijk wil stellen
     Dan wil ik daarbij ook de regios, waarin juridische professionals werkzaam zijn, kunnen selecteren
     En dat de geselecteerde regios tezamen met mijn vraag worden opgeslagen
     