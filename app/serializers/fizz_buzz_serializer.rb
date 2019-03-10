# frozen_string_literal: true

class FizzBuzzSerializer < ActiveModel::Serializer
  attributes :id, :number, :text
end
