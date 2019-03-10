# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FizzBuzz, type: :model do
  describe '#valid?' do
    subject { fizz_buzz.valid? }

    let(:fizz_buzz) { FactoryBot.build(:fizz_buzz, number: number) }
    let(:number) { 1 }

    it { is_expected.to eq(true) }

    context 'numberがnilの場合' do
      let(:number) { nil }
      it { is_expected.to eq(false) }
    end
  end

  describe '#text' do
    subject { fizz_buzz.text }

    let(:fizz_buzz) { FactoryBot.build(:fizz_buzz, number: number) }

    context 'numberが1の場合' do
      let(:number) { 1 }
      it { is_expected.to eq('1') }
    end

    context 'numberが3の場合' do
      let(:number) { 3 }
      it { is_expected.to eq('Fizz') }
    end

    context 'numberが5の場合' do
      let(:number) { 5 }
      it { is_expected.to eq('Buzz') }
    end

    context 'numberが6の場合' do
      let(:number) { 6 }
      it { is_expected.to eq('Fizz') }
    end

    context 'numberが10の場合' do
      let(:number) { 10 }
      it { is_expected.to eq('Buzz') }
    end

    context 'numberが15の場合' do
      let(:number) { 15 }
      it { is_expected.to eq('FizzBuzz') }
    end

    context 'numberが30の場合' do
      let(:number) { 30 }
      it { is_expected.to eq('FizzBuzz') }
    end
  end

  describe '#fizz?' do
    subject { fizz_buzz.fizz? }

    let(:fizz_buzz) { FactoryBot.build(:fizz_buzz, number: number) }

    context 'numberが1の場合' do
      let(:number) { 1 }
      it { is_expected.to eq(false) }
    end

    context 'numberが3の場合' do
      let(:number) { 3 }
      it { is_expected.to eq(true) }
    end

    context 'numberが5の場合' do
      let(:number) { 5 }
      it { is_expected.to eq(false) }
    end

    context 'numberが6の場合' do
      let(:number) { 6 }
      it { is_expected.to eq(true) }
    end

    context 'numberが10の場合' do
      let(:number) { 10 }
      it { is_expected.to eq(false) }
    end

    context 'numberが15の場合' do
      let(:number) { 15 }
      it { is_expected.to eq(false) }
    end

    context 'numberが30の場合' do
      let(:number) { 30 }
      it { is_expected.to eq(false) }
    end
  end

  describe '#buzz?' do
    subject { fizz_buzz.buzz? }

    let(:fizz_buzz) { FactoryBot.build(:fizz_buzz, number: number) }

    context 'numberが1の場合' do
      let(:number) { 1 }
      it { is_expected.to eq(false) }
    end

    context 'numberが3の場合' do
      let(:number) { 3 }
      it { is_expected.to eq(false) }
    end

    context 'numberが5の場合' do
      let(:number) { 5 }
      it { is_expected.to eq(true) }
    end

    context 'numberが6の場合' do
      let(:number) { 6 }
      it { is_expected.to eq(false) }
    end

    context 'numberが10の場合' do
      let(:number) { 10 }
      it { is_expected.to eq(true) }
    end

    context 'numberが15の場合' do
      let(:number) { 15 }
      it { is_expected.to eq(false) }
    end

    context 'numberが30の場合' do
      let(:number) { 30 }
      it { is_expected.to eq(false) }
    end
  end

  describe '#fizz_buzz?' do
    subject { fizz_buzz.fizz_buzz? }

    let(:fizz_buzz) { FactoryBot.build(:fizz_buzz, number: number) }

    context 'numberが1の場合' do
      let(:number) { 1 }
      it { is_expected.to eq(false) }
    end

    context 'numberが3の場合' do
      let(:number) { 3 }
      it { is_expected.to eq(false) }
    end

    context 'numberが5の場合' do
      let(:number) { 5 }
      it { is_expected.to eq(false) }
    end

    context 'numberが6の場合' do
      let(:number) { 6 }
      it { is_expected.to eq(false) }
    end

    context 'numberが10の場合' do
      let(:number) { 10 }
      it { is_expected.to eq(false) }
    end

    context 'numberが15の場合' do
      let(:number) { 15 }
      it { is_expected.to eq(true) }
    end

    context 'numberが30の場合' do
      let(:number) { 30 }
      it { is_expected.to eq(true) }
    end
  end
end
