class ActivitiesSerializer
  def self.new(activities)
    {
      "data": {
        "id": activities.id,
        "type": "activities",
        "attributes": {
          "destination": activities.destination,
          "forecast": {
            "summary": activities.forecast.summary,
            "temperature": "#{activities.forecast.temp}F"
          },
          "activities": [
              {"title": activities.activities[0].title,
              "type": activities.activities[0].type,
              "participants": activities.activities[0].participants,
              "price": activities.activities[0].price},
              {"title": activities.activities[1].title,
              "type": activities.activities[1].type,
              "participants": activities.activities[1].participants,
              "price": activities.activities[1].price
            }]
          }
        }
      }
  end
end
