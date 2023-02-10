require_relative 'api_module'
require_relative '../models/absence_model'

# Absences Api
class AbsencesApi
  include ApiModule

  # Returns all absences from personio
  # @return [Array<{AbsenseModel absence}>] Queries all absences from
  #    personio and returns an array of absences models
  def all(start_date: Date.today.beginning_of_month, end_date: Date.today)
    # Query absences
    url = "/company/time-offs?start_date=#{start_date}&end_date=#{end_date}"
    data = get(url)
    data.map do |entry|
      if entry['attributes']['status'] != 'approved'
        nil
      else
        AbsenceModel.new entry['attributes']
      end
    end.compact
  end
end
