# frozen_string_literal: true

module AllAttributesPresentable
  extend ActiveSupport::Concern

  included do
    validate :all_attributes_present
  end

  def all_attributes_present
    errors.add(:base, 'All attributes must be present') if attributes.except('id', 'created_at', 'updated_at').values.any?(&:blank?)
  end
end
