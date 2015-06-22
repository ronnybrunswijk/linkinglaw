# language: nl
Functionaliteit: de juridische professional wil de vragen bekijken die ondernemers hebben gesteld 
		 (moate alle fraachen sichtbar weze, as allinich die wer as jo op reagere kinne)
		 
  @signed_in_lawyer @3_questions
  Scenario: de juridische professional wil de vragen bekijken
  	    die de ondernemers hebben gesteld
    Stel als juridische professional ga ik naar de 'gestelde vragen' pagina
    Dan verwacht ik een overzicht van vragen die ondernemers onlangs hebben gesteld

  @signed_in_lawyer @3_questions
  Scenario: de juridische professional wil vanaf de detail vraag pagina weer terug naar 
            de het overzicht van alle vragen via de 'Naar overzicht' link
    Stel als juridische professional bevind ik met op de detail vraag pagina
    Dan wil via de 'Naar overzicht' link weer terug kunnen naar het overzicht van alle gestelde vragen