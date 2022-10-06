# SmartFinance

Proof of concept finance app written in Dart using the Flutter framwork, utilising SQLite. Featuring encrypted data storage, biometric authentication.

## Structure UI
1) home screen  
  - search screen (shows matching accounts, transactions)
  	- display account screen
  	- display transaction screen
  - accounts screen (sorted by type)
    - display accounts screen
      - edit account screen
      - delete account screen (returns to accounts screen, after deletion)
  - transactions screen (sorted by date)
	- display transaction screen
      - edit transaction screen
      - delete transaction screen (returns to transactions screen, after deletion)
      
## Structure Database
Account Database:
* id (integer, primary key, autoincrement)  
* title (text, not null)  
* type (text, not null)  
* account_number (text, not null)  
* balance (real, not null)  
* spend_limit (real, not null)  
* path_to_icon (text, not null) 
* expiration_date (text, not null)  
* last_used (text, not null)  
  
Transaction Database:

* id (integer, primary key, autoincrement)  
* account_id (integer, not null)  
* title (text, not null)  
* merchant (text, not null)  
* status (text, not null)  
* process_date_time (text, not null)  
* type (text, not null)  
* message (text)  
* spending_goal_id (integer)  
* amount (real, not null)  
* path_to_icon (text, not null)  
  
## Screenshots
**Home Screen**  
<img src="https://user-images.githubusercontent.com/68001069/194391793-be7563d3-2ead-4513-ada7-4f52ca774638.png" width="270" height="600" />

**Search Screen**  
<img src="https://user-images.githubusercontent.com/68001069/194391859-79ad6e36-af78-4e7b-b4cf-89ce6da6e3a0.png" width="270" height="600" />


**Transactions Screen**  
<img src="https://user-images.githubusercontent.com/68001069/194391908-9ae01747-f1c7-4837-aa0e-62af2b71d664.png" width="270" height="600" />

**Account Display Screen**  
<img src="https://user-images.githubusercontent.com/68001069/194391951-d8163496-ca95-4af0-8856-4e7bbde4925e.png" width="270" height="600" />
