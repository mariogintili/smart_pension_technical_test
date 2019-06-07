require "spec_helper"

RSpec.describe LogParser::Base do
  describe "#initialize" do
    let(:filename) { "filename" }
    let(:processors) { [] }

    subject do
      described_class.new(filename: filename, processors: processors)
    end

    it "assigns a filename" do
      expect(subject.filename).to eq(filename)
      expect(subject.processors).to eq(processors)
    end
  end

  describe "#process" do
    context "with a valid filename" do
      context "with all successful processor calls" do
        let(:filename) { "valid-filename" }
        let(:result) { double(:result) }
        let(:processor) { double(:processor, call: result) }
        let(:processors) { [processor] }

        subject do
          allow(IO).to receive(:readlines) { ["hi"] }
          described_class.new(filename: filename, processors: processors)
        end

        it "populates results and returns true" do
          expect(subject.process).to be_truthy
          expect(subject.errors).to be_empty
          expect(subject.results).not_to be_empty
        end
      end

      context "with some invalid processor calls" do
        let(:filename) { "invalid-filename" }
        let(:result) { double(:result) }
        let(:processor) { double(:processor) }
        let(:processors) { [processor] }
        let(:error) { StandardError.new("whoopsies") }

        subject do
          allow(IO).to receive(:readlines) { ["hi"] }
          allow(processor).to receive(:call) do |options|
            options[:errors].push(error)
          end
          described_class.new(filename: filename, processors: processors)
        end

        it "adds errors and returns false" do
          expect(subject.process).to be_falsey
          expect(subject.errors).to match_array([error])
        end
      end
    end

    context "with an invalid filename" do
      let(:processors) { [] }
      subject { described_class.new(filename: "foobar", processors: processors) }
      let(:error) { StandardError.new("whoopsies") }

      before do
        allow(IO).to receive(:readlines) { raise error }
      end

      it "adds an error" do
        subject.process
        expect(subject.errors).to match_array([error])
      end
    end
  end
end
