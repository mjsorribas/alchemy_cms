# frozen_string_literal: true

require "rails_helper"

RSpec.describe Alchemy::Ingredients::Text do
  it_behaves_like "an alchemy ingredient"

  let(:element) { build(:alchemy_element) }

  let(:text_ingredient) do
    described_class.new(
      element: element,
      type: described_class.name,
      role: "headline",
      data: {
        link: "https://example.com",
        link_target: "_blank",
        link_title: "Click here",
        link_class_name: "button",
      },
    )
  end

  describe "#link" do
    subject { text_ingredient.link }

    it { is_expected.to eq("https://example.com") }
  end

  describe "#link_target" do
    subject { text_ingredient.link_target }

    it { is_expected.to eq("_blank") }
  end

  describe "#link_title" do
    subject { text_ingredient.link_title }

    it { is_expected.to eq("Click here") }
  end

  describe "#link_class_name" do
    subject { text_ingredient.link_class_name }

    it { is_expected.to eq("button") }
  end
end
