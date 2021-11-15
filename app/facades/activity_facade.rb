class ActivityFacade
  class << self
    def create_activities(type, location, lat, lon)
      result = ActivityService.get_activity(type)
      relaxation = ActivityService.get_activity("relaxation")
      Activities.new(result, relaxation, location, lat, lon)
    end
  end
end
