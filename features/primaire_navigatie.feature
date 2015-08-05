# language: nl
Functionaliteit: Algemene navigatie waarvoor het niet nodig is ingelogd te zijn

  Abstract Scenario: Een gebruiker bezoekt pagina's via de adresbalk
    Stel als gebruiker voer ik www.linkinglaw.nl"<UrlPath>" in in de adresbak van mijn browser
    Dan kom ik op de pagina getiteld "<Title>"
     
    Voorbeelden: Url paden and pagina titels
    |	UrlPath            |  Title	              |
    |  /             	   |  Home 	              |
    |  /home 		   |  Home	              |
    |  /users/sign_in      |  Log in                  | 
    |  /users/sign_up      |  Registreren	      |
    |  /questions/new      |  Stel een vraag          |
    |  /lawyer  	   |  Juridische Professional |

  Abstract Scenario: Een gebruiker navigeert door de website via menu links
    Stel als gebruiker ben ik op de home pagina
    Als ik dan op de "<Link>" link klik
    Dan kom ik op de pagina getiteld "<Title>"

    Voorbeelden: Links en page titels
    |   Link                    |  Title                   |
    |   home		                |  Home	                   |
    |   Log in                  |  Log in	                 |
    |   Registreren             |  Registreren             | 
    |   Stel een vraag          |  Stel een vraag          |
    |   Juridische Professional |  Juridische Professional |
    |   Vind een professional   |  Vind een professional   |   
   

  @signed_in_lawyer
  Abstract Scenario: De juridische professional navigeert door de website via de adresbalk
  	   	     die alleen voor de ingelogde juridische professional beschikbaar zijn 
    Stel als gebruiker voer ik www.linkinglaw.nl"<UrlPath>" in in de adresbak van mijn browser
    Dan kom ik op de pagina getiteld "<Title>"

    Voorbeelden: Url paden and pagina titels
    |   UrlPath       	        |  Title                   |
    |  /questions/list          |  Gestelde vragen         |

  @signed_in_lawyer
  Abstract Scenario: De juridische professional navigeert door de website via de user links 
                     voor de ingelogde juridische professional
    Stel als juridische professional bevind ik me op de home pagina en ben ingelogd
    Als ik dan op de "<Link>" link klik in het menu voor de ingelogde juridische professional
    Dan kom ik op de pagina getiteld "<Title>"

    Voorbeelden: Links en pagina titels
    |   Link                        |  Title                   |
    |   Notificaties instellingen   |  Home                    |
    |   Profiel instellingen        |  Profiel Instellingen    |
    |   Mijn reviews                |  Home                    |
    |   Account instellingen        |  Account Instellingen    |
    |   Log uit                     |  Home                    | 

  @signed_in
  Abstract Scenario: De ondernemer navigeert door de website via de user links 
                     voor de ingelogde juridische professional
    Stel als ondernemer bevind ik me op de home pagina en ben ingelogd
    Als ik dan op de "<Link>" link klik in het menu voor de ingelogde ondernemer
    Dan kom ik op de pagina getiteld "<Title>"

    Voorbeelden: Links en pagina titels
    |   Link                        |  Title                   |
    |   Mijn reviews                |  Home                    |
    |   Account instellingen        |  Account Instellingen    |
    |   Log uit                     |  Home                    | 
