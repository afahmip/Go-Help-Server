
  
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
  
### Filter UserRequest    
 - URL:  `/retrieve_request` 
 - Method: `POST` 
 - Headers: `Content-Type: application/json`  
 - Body    
  
	 | Field | Type | Description |    
	 | ----- | ---- | ----------- |  
	 | helper_type_id | integer | HelperType ID that the User wants |  
	 | longitude | float | User's longitude coordinate |  
	 | latitude | float | User's latitude coordinate |