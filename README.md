
  
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
 - Response
	```
	{
	    "id",
	    "name",
	    "email",
	    "password"
	    "device_id"
	    "created_at",
	    "updated_at"
	}
	```

### Get list of Users    
 - URL:  `/users`
 - Method: `GET` 
 - Response
	```
	[
		{
		    "id",
		    "name",
		    "email",
		    "password"
		    "device_id"
		    "created_at",
		    "updated_at"
		}
	]
	```

### Get User by ID    
 - URL:  `/users/<id:integer>`
 - Method: `GET` 
 - Response
	```
	{
	    "id",
	    "name",
	    "email",
	    "password"
	    "device_id"
	    "created_at",
	    "updated_at"
	}
	```
  
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
 - Response
	```
	{
	    "id",
	    "name",
	    "email",
	    "password",
	    "phone_number",
	    "helper_type_id",
	    "created_at",
	    "updated_at",
	    "device_id",
	    "longitude": null,
	    "latitude": null
	}
	```

### Get list of Helpers    
 - URL:  `/helper`
 - Method: `GET` 
 - Response:
	```
	[
		{
			"id",
			"name",
			"email",
			"password",
			"phone_number",
			"helper_type_id",
			"created_at",
			"updated_at",
			"device_id",
			"longitude",
			"latitude"
		}
	]
	```

### Update Helper location   
 - URL:  `/update_helper_location/<id:integer>`
 - Method: `POST` 
 - Headers: `Content-Type: application/json`  
 - Body    
  
	 | Field | Type | Description |    
	 | ----- | ---- | ----------- |  
	 | longitude | float | Helper longitude coordinate |
	 | latitude | float | Helper latitude coordinate |
 - Response:
	None (`204 No Content`)

---  
## HelperType   
### Create new HelperType    
 - URL:  `/helper_types`
 - Method: `POST` 
 - Headers: `Content-Type: application/json`  
 - Body    
  
	 | Field | Type | Description |    
	 | ----- | ---- | ----------- |  
	 | name | string | Helper type |  
 - Response
	```
	{
	    "id",
	    "name",
	    "created_at",
	    "updated_at",
	}
	```

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
 - Response
	```
	{
	    "id",
	    "user_id",
	    "longitude",
	    "latitude",
	    "device_id",
	    "created_at",
	    "updated_at",
	    "helper_type_id"
	}
	```
  
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
 - Response
	```
	[
	    {
		    "id",
		    "user_id",
		    "longitude",
		    "latitude",
		    "device_id",
		    "created_at",
		    "updated_at",
		    "helper_type_id"
		}
	]
	```

### Accept UserRequest by ID
 - URL:  `/accept_request` 
 - Method: `POST` 
 - Headers: `Content-Type: application/json`  
 - Body    
  
	 | Field | Type | Description |    
	 | ----- | ---- | ----------- |  
	 | helper_id | integer | Helper ID that wants to accept the request |  
	 | user_request_id | integer | UserRequest ID that wants to be accepted |  
 - Response
	- Success
	```
	{
	    "status": 200,
	    "message": "Request successfully accepted"
	}
	```
	- Failed
	```
	{
	    "status": 500,
	    "message": "Request already been accepted"
	}
	```