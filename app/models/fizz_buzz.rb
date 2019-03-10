# frozen_string_literal: true

class FizzBuzz < ApplicationRecord
  validates :number, presence: true, numericality: { only_integer: true }

  def text
    if number.blank?
      nil
    elsif fizz?
      'Fizz'
    elsif buzz?
      'Buzz'
    elsif fizz_buzz?
      'FizzBuzz'
    else
      number.to_s
    end
  end

  def fizz?
    divisible_by_three? && !divisible_by_five?
  end

  def buzz?
    !divisible_by_three? && divisible_by_five?
  end

  def fizz_buzz?
    divisible_by_three? && divisible_by_five?
  end

  private

  def divisible_by_three?
    return false if number.blank?

    (number % 3).zero?
  end

  def divisible_by_five?
    return false if number.blank?

    (number % 5).zero?
  end
end
