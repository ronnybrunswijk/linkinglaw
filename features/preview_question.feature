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
    |			 foutmelding				|
    | "Bevestiging wachtwoord komt niet overeen met Wachtwoord" |

  Abstract Scenario: de ondernemer wil een vraag stellen, maar is niet ingelogd. Hij voert een verkeerd wachtwoord in, wanneer hij alsnog inlogt.
    Stel als ondernemer bevind ik me op de 'preview vraag' pagina
    En ik wil mijn vraag plaatsen, maar ben niet ingelogd
    Als ik alsnog meteen inlog en daarbij een verkeerd wachtwoord invoer
    Dan wil ik een gepaste <foutmelding> zien

    Voorbeelden:
    |		foutmelding	       |
    | "Ongeldig e-mail of wachtwoord"  |