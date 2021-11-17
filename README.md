# Rails Engine

## Table of Contents


- [Project Overview](#project-overview)
- [Technologies Used](#technologies-used)
- [Minimum Requirements](#minimum-requirements)
- [Setup](#setup)
- [API Endpoints](#api-endpoints)
- [Contributors](#contributors)

## Technologies Used

- Rails 6.2.4
- Ruby 2.7.2
- PostgreSQL 13.3
- Gems: Pry, RSpec, RuboCop, Shoulda-Matchers, SimpleCov, bcrypt, faraday, figaro
- Tools:  Atom, Git, GitHub, Postman
- Processes: OOP, TDD, MVC, REST

## Project Background
[SweaterWeather](https://backend.turing.edu/module3/projects/sweater_weather/) is a 5 day, solo project, during Mod 3 of 4 in Turing School of Sofware and Development's Back-End program. 

The goal was to build a fully functional JSON API-compliant REST API that aggregates data from several third-party API endpoints that require authentication, and renders responses back to authenticated users who would make requests from a separate (non-existent) front-end application framework. 

The learning goals include:

- Exposing an API that aggregates data from multiple external APIs
- Exposing an API that requires an authentication token
- Exposing an API for CRUD functionality
- Determining completion criteria based on the needs of other developers
- Researching, selecting, and consuming an API based on your needs as a developer

The project requirements can be found [here](https://backend.turing.edu/module3/projects/sweater_weather/requirements).

## Setup

This project requires Ruby 2.7.2 and Rails 6.2.4.
- Fork this repository
- Install gems and set up your database:
..- $bundle
-- $rails db:{drop,create,migrate}
-- Create application.yml file for API keys
--- $bundle exec figaro install
--- Go to [MapquestAPI](https://developer.mapquest.com/) AND [OpenWeatherAPI](https://openweathermap.org/) AND [Unsplash](https://unsplash.com/documentation)
---- Create an account for each and get personal API keys
--- In your config/applicaion.yml file insert keys as such:
---- mapquest_key:  <your_mapquest_key_here>
---- weather_key:  <your_open_weather_key_here>
---- unsplash_access_key:  <your_unsplash_access_key_here>
--Run the test suite with:  $bundle exec rspec
-- Run your development server with: $rails s
## Contributors

👤  **Kelsey Thompson**
- [GitHub](https://github.com/knthompson2)
- [LinkedIn](https://www.linkedin.com/in/knthompson2/)
