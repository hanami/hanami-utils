# frozen_string_literal: true

RSpec.describe "Hanami::Utils::VERSION" do
  it "exposes version" do
    expect(Hanami::Utils::VERSION).to eq("2.0.0.alpha1")
  end
end
