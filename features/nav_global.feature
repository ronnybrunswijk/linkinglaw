Feature: Global navigation
  
  Scenario Outline: Navigate pages through addressbar
    Given a user types www.linkinglaw.nl"<UrlPath>" into the addressbar of his browser
    Then the page titled "<Title>" appears
     
    Examples: Url paths and page titles
    |	UrlPath          |  Title	      |
    |  /             	 |  Home 	      |
    |  /home             |  Home	      |
    |  /users/sign_in    |  Log in    	      | 
    |  /users/sign_up    |  Registreren	      |
    |  /questions/new    |  Stel een vraag    |

  Scenario Outline: Navigate by using  global menu links
    Given a user is at LinkingLaw home page
    When he clicks the "<Link>" link
    Then the page titled "<Title>" appears
    Examples: Links and page titles
    |   Link             |  Title           |
    |   Home		 |  Home	    |
    |   Log in           |  Log in	    |
    |   Registreren      |  Registreren     | 
    |   Stel een vraag   |  Stel een vraag  |
    
   