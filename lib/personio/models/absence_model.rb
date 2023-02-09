# Employee Model
class AbsenceModel
  # Personio fields to set on the absence model
  FIELDS = %i[].freeze

  attr_accessor :attributes

  def initialize(args)
    # Auto set plain text fields
    @attributes = args
    # args.each do |key, value|
    #   send("#{key}=", value['value']) \
    #     if AbsenceModel::FIELDS.include?(key.to_sym)
    # end
    args
  end
end
