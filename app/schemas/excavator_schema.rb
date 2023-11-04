class ExcavatorSchema < Dry::Struct
  transform_keys(&:underscore)
  transform_keys(&:to_sym)

  attribute :company_name, Dry::Types['strict.string']
  attribute :address, Dry::Types['strict.string']
  attribute :crew_onsite, Dry::Types['strict.string']

end
