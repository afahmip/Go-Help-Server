
  
# Go-Help
Go-Help is an Android Application that simplify the process of helping Indonesian people from dangerous situation. It is also used as the project to complete the task given by Go-Jek Camp   

# Go-Help-Server
This part is the API that supports the application on both User and Helper side. Here lies the API documentation. 
    
## User    
### Create new User    
 - URL:  `/users`
 - Method: `POST` 
 - Headers: `Content-Type: application/json`  
 - Body    
  
	 | Field | Type | Description |    
	 | ----- | ---- | ----------- |  
	 | name | string | User name |  
	 | email | string | User email |  
	 | password | string | User password |  
	 | device_id | string | User device ID (Android) |  
  
---  
## Helper    
### Create new Helper    
 - URL:  `/helper`
 - Method: `POST` 
 - Headers: `Content-Type: application/json`  
 - Body    
  
	 | Field | Type | Description |    
	 | ----- | ---- | ----------- |  
	 | name | string | Helper name |  
	 | email | string | Helper email |  
	 | password | string | Helper password |  
	 | phone_number | string | Helper phone number |
	 | helper_type_id | integer | Helper type |

### Retrieve all Helper    
 - URL:  `/helper`
 - Method: `GET` 
 - Headers: `Content-Type: application/json`  

### Update Helper location   
 - URL:  `/update_helper_location/<id:integer>`
 - Method: `POST` 
 - Headers: `Content-Type: application/json`  
 - Body    
  
	 | Field | Type | Description |    
	 | ----- | ---- | ----------- |  
	 | longitude | float | Helper longitude coordinate |
	 | latitude | float | Helper latitude coordinate |

---  
## UserRequest    
### Create new UserRequest    
 - URL:  `/user_requests` 
 - Method: `POST` 
 - Headers: `Content-Type: application/json`  
 - Body    
  
	 | Field | Type | Description |    
	 | ----- | ---- | ----------- |  
	 | user_id | integer | User ID that creates the UserRequest |  
	 | helper_type_id | integer | HelperType ID that the User wants |  
	 | longitude | float | User's longitude coordinate |  
	 | latitude | float | User's latitude coordinate |  
	 | device_id | string | User device ID (Android) |  
  
### Filter UserRequest based on Helper location and type
 - URL:  `/retrieve_request` 
 - Method: `POST` 
 - Headers: `Content-Type: application/json`  
 - Body    
  
	 | Field | Type | Description |    
	 | ----- | ---- | ----------- |  
	 | helper_type_id | integer | HelperType ID that the User wants |  
	 | longitude | float | User's longitude coordinate |  
	 | latitude | float | User's latitude coordinate |