class HubriseApp::Refresher::Location
  REFRESH_THRESHOLD = 1.day

  class << self
    def run(location, api_client)
      return unless stale?(location)

      location.update!(
        refreshed_at: Time.now,
        name: api_client.get_location(location.hr_id).data["name"]
      )
    end

    def stale?(location)
      location.refreshed_at.nil? || Time.now - location.refreshed_at > REFRESH_THRESHOLD
    end
  end
end
