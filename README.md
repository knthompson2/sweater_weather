# Rails Engine

## Table of Contents


- [Project Overview](#project-overview)
- [Technologies Used](#technologies-used)
- [Setup](#setup)
- [API Endpoints](#api-endpoints)
- [Contributors](#contributors)


## Project Overview
[SweaterWeather](https://backend.turing.edu/module3/projects/sweater_weather/) is a 5 day, solo project, during Mod 3 of 4 in Turing School of Sofware and Development's Back-End program. 

The goal was to build a fully functional JSON API-compliant REST API that aggregates data from several third-party API endpoints that require authentication, and renders responses back to authenticated users who would make requests from a separate (non-existent) front-end application framework. 

The learning goals include:

- Exposing an API that aggregates data from multiple external APIs
- Exposing an API that requires an authentication token
- Exposing an API for CRUD functionality
- Determining completion criteria based on the needs of other developers
- Researching, selecting, and consuming an API based on your needs as a developer

The project requirements can be found [here](https://backend.turing.edu/module3/projects/sweater_weather/requirements).

## Technologies Used

- Rails 6.2.4
- Ruby 2.7.2
- PostgreSQL 13.3
- Gems: Pry, RSpec, RuboCop, Shoulda-Matchers, SimpleCov, bcrypt, faraday, figaro
- Tools:  Atom, Git, GitHub, Postman
- Processes: OOP, TDD, MVC, REST

## Setup

This project requires Ruby 2.7.2 and Rails 6.2.4.
- Fork this repository
- Install gems and set up your database:
  - `bundle`  
  - `rails db:{drop,create,migrate}` 
  -  Create application.yml file for API keys  
     - $bundle exec figaro install  
     - Go to [MapquestAPI](https://developer.mapquest.com/) AND [OpenWeatherAPI](https://openweathermap.org/) AND [Unsplash](https://unsplash.com/documentation)  
      - Create an account for each and get personal API keys  
     - In your config/applicaion.yml file insert keys as such:  
        - mapquest_key:  <your_mapquest_key_here>  
        - weather_key:  <your_open_weather_key_here>  
        - unsplash_access_key:  <your_unsplash_access_key_here>  
  - Run the test suite with:  `bundle exec rspec` 
  - Run your development server with: `rails s`

## API Endpoints

The `base path` of each enpoint is:

  http://localhost:3000/api/v1
  
  - For `GET` requests, you can send the endpoint request through your internet browser or use an API client such as [Postman](postman).
  - For `POST` requests, you must use an API client to provide the information in the request body. 

  ### Get weather forecast
  `GET /api/v1/forecast?location=<CITY,STATE_ABBREVIATION>`
  
  ```
  {
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current": {
                "datetime": "2021-11-16T17:26:34.000-07:00",
                "sunrise": "2021-11-16T06:46:09.000-07:00",
                "sunset": "2021-11-16T16:43:41.000-07:00",
                "temp": 59.95,
                "feels_like": 56.68,
                "humidity": 22,
                "uvi": 0,
                "visibility": 10000,
                "conditions": "overcast clouds",
                "icon": "04n"
            },
            "daily": [
                {
                    "date": "2021-11-16",
                    "sunrise": "2021-11-16T06:46:09.000-07:00",
                    "sunset": "2021-11-16T16:43:41.000-07:00",
                    "max_temp": 66.92,
                    "min_temp": 46.8,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "date": "2021-11-17",
                    "sunrise": "2021-11-17T06:47:17.000-07:00",
                    "sunset": "2021-11-17T16:42:57.000-07:00",
                    "max_temp": 42.98,
                    "min_temp": 34.63,
                    "conditions": "broken clouds",
                    "icon": "04d"
                },
                {
                    "date": "2021-11-18",
                    "sunrise": "2021-11-18T06:48:26.000-07:00",
                    "sunset": "2021-11-18T16:42:16.000-07:00",
                    "max_temp": 49.24,
                    "min_temp": 32.27,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "date": "2021-11-19",
                    "sunrise": "2021-11-19T06:49:34.000-07:00",
                    "sunset": "2021-11-19T16:41:36.000-07:00",
                    "max_temp": 61.65,
                    "min_temp": 43.93,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                },
                {
                    "date": "2021-11-20",
                    "sunrise": "2021-11-20T06:50:41.000-07:00",
                    "sunset": "2021-11-20T16:40:58.000-07:00",
                    "max_temp": 58.75,
                    "min_temp": 44.8,
                    "conditions": "overcast clouds",
                    "icon": "04d"
                }
            ],
            "hourly": [
                {
                    "time": "05:11 PM",
                    "temp": 59.95,
                    "conditions": "overcast clouds",
                    "icon": "04n"
                },
                {
                    "time": "06:11 PM",
                    "temp": 59.7,
                    "conditions": "overcast clouds",
                    "icon": "04n"
                },
                {
                    "time": "07:11 PM",
                    "temp": 58.84,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "time": "08:11 PM",
                    "temp": 57.13,
                    "conditions": "broken clouds",
                    "icon": "04n"
                },
                {
                    "time": "09:11 PM",
                    "temp": 54.54,
                    "conditions": "scattered clouds",
                    "icon": "03n"
                },
                {
                    "time": "10:11 PM",
                    "temp": 48.88,
                    "conditions": "few clouds",
                    "icon": "02n"
                },
                {
                    "time": "11:11 PM",
                    "temp": 46.8,
                    "conditions": "few clouds",
                    "icon": "02n"
                },
                {
                    "time": "12:11 AM",
                    "temp": 42.98,
                    "conditions": "clear sky",
                    "icon": "01n"
                }
            ]
        }
    }
}
```
### Get city background
  `GET /api/v1/backgrounds?location=<CITY,STATE_ABBREVIATION>`
  
  ```
  "data": {
        "id": null,
        "type": "image",
        "attributes": {
            "description": "Community in Denver.",
            "image_url": "https://images.unsplash.com/photo-1634507307799-ace9b49840b7?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNzU2NDF8MHwxfHNlYXJjaHwxfHxEZW52ZXIlMkNDT3xlbnwwfHx8fDE2MzcxMDkwOTQ&ixlib=rb-1.2.1&q=80&w=1080",
            "photographer_name": "Dillon Wanner",
            "photographer_url": "https://unsplash.com/@dillydallying",
            "source": "https://unsplash.com/"
        }
    }
}
  ```
  ### New user registration
  `POST /api/v1/users`
  ```
  {
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
  ```
  ### User authentication/login
  `POST /api/v1/sessions`
  ```
    {
  "data": {
    "type": "users",
    "id": "1",
    "attributes": {
      "email": "whatever@example.com",
      "api_key": "jgn983hy48thw9begh98h4539h4"
    }
  }
}
  ```
   ### Create new road trip
  `POST /api/v1/sessions`
  ```
  {
  "data": {
    "id": null,
    "type": "roadtrip",
    "attributes": {
      "start_city": "Denver, CO",
      "end_city": "Estes Park, CO",
      "travel_time": "2 hours, 13 minutes"
      "weather_at_eta": {
        "temperature": 59.4,
        "conditions": "partly cloudy with a chance of meatballs"
      }
    }
  }
}
```

## Contributors

👤  **Kelsey Thompson**
- [GitHub](https://github.com/knthompson2)
- [LinkedIn](https://www.linkedin.com/in/knthompson2/)
