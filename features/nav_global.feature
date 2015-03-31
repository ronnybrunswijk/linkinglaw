# language: nl
Functionaliteit: Algemene navigatie
  
  Abstract Scenario: Een gebruiker bezoekt pagina's via de adresbalk
    Stel als gebruiker voer ik www.linkinglaw.nl"<UrlPath>" in in de adresbak van mijn browser
    Dan kom ik op de pagina getiteld "<Title>"
     
    Voorbeelden: Url paden and pagina titels
    |	UrlPath          |  Title	      |
    |  /             	 |  Home 	      |
    |  /home             |  Home	      |
    |  /users/sign_in    |  Log in    	      | 
    |  /users/sign_up    |  Registreren	      |
    |  /questions/new    |  Stel een vraag    |

  Abstract Scenario: Een gebruiker navigeert door de website via menu links
    Stel als gebruiker ben ik op de home pagina
    Als ik dan op de "<Link>" link klik
    Dan kom ik op de pagina getiteld "<Title>"
    Voorbeelden: Links en page titels
    |   Link             |  Title           |
    |   Home		 |  Home	    |
    |   Log in           |  Log in	    |
    |   Registreren      |  Registreren     | 
    |   Stel een vraag   |  Stel een vraag  |
    
   