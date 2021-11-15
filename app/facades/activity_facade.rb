class ActivityFacade
  class << self
    def create_activities(type, location)
      result = ActivityService.get_activity(type)
      Activities.new(result)
    end
  end
end
