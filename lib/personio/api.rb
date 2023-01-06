require_relative 'api/employees_api'
require_relative 'api/absences_api'

# Personio API as instance
class PersonioApi
  attr_accessor :config

  # Initialize the personio aPI
  #
  # @param client_id [String] the client id given by the personio credentials
  # @param client_secret [String] the client secret given by the personio
  #     credentials
  def initialize(args = {})
    @config = Personio::Configuration.new(args)
  end

  # Gets an instance of the personio employees api to query employees
  #
  # @return [{EmployeesApi api}] the personio employees api
  def employees
    @employees_api ||= EmployeesApi.new(@config)
  end

  # Gets an instance of the personio absenses api to query absenses
  #
  # @return [{AbsencesApi api}] the personio employees api
  def absences
    @absences_api ||= AbsencesApi.new(@config)
  end
end
