# language: nl
Functionaliteit: notificaties instellen
		 
  @signed_in_lawyer @seeds
  Scenario: de juridische professional stelt in dat hij 1 keer per dag bericht wil worden 
            over de nieuwe vragen die zijn gesteld.
    Stel ik bevind me als juridische professional op de notificatie instellingen pagina
    Dan wil ik de mogelijkheid hebben om in te stellen dat ik 1 keer per dag om 18:00 uur bericht wil worden over nieuwe vragen
    En er zeker van zijn dat mijn frequentie instellingen bewaard blijven

  @signed_in_lawyer @seeds
  Scenario: de juridische professional wijzigt de frequentie van berichtgeving over gestelde vragen van 
            'Meteen' naar '1 keer per dag'.
    Stel ik bevind me als juridische professional op de notificatie instellingen pagina
    En mijn frequentie van berichtgeving is ingesteld op 'Meteen'
    Dan wil ik geen mogelijkheid om ook een tijdstip in te stellen, zodat ik niet verward raak
    Als ik vervolgens de frequentie instel op '1 keer per dag' 
    Dan wil ik de mogelijkheid hebben om een tijdstip in te stellen 

  @signed_in_lawyer_with_daily_notification @seeds
  Scenario: de juridische professional wijzigt de frequentie van berichtgeving over gestelde vragen van
            '1 keer per dag' naar 'Meteen'.
    Stel ik bevind me als juridische professional op de notificatie instellingen pagina
    En mijn frequentie van berichtgeving is ingesteld op '1 keer per dag'
    Dan wil ik de mogelijkheid hebben om een tijdstip in te stellen     
    Als ik vervolgens de frequentie instel op 'Meteen' 
    Dan wil ik geen mogelijkheid om ook een tijdstip in te stellen, zodat ik niet verward raak

  @signed_in_lawyer @seeds
  Scenario: de juridische professional stelt in dat hij dat hij alleen bericht wil worden over vragen gesteld 
            door ondernemers uit een bepaalde regio.
    Stel ik bevind me als juridische professional op de notificatie instellingen pagina
    Dan wil ik kunnen instellen dat ik alleen bericht wordt over vragen gesteld door ondernemers uit Friesland en Groningen 
    En er zeker van zijn dat mijn regio instellingen bewaard blijven
