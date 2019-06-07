require "spec_helper"

RSpec.describe LogParser::Report do
  let(:title) { "the title" }
  let(:value) { { one: :two } }
  describe "#initialize" do
    subject do
      described_class.new(title: title, value: value)
    end

    it "assigns title and value" do
      expect(subject.title).to eq(title)
      expect(subject.value).to eq(value)
    end
  end
end
