require "spec_helper"

RSpec.describe LogParser::MostUniquePageViews do
  let(:valid_fixture) do 
    [
      "/help_page/1 126.318.035.038",
      "/contact 184.123.665.067",
      "/home 184.123.665.067",
      "/about/2 444.701.448.104",
      "/help_page/1 929.398.951.889",
      "/index 444.701.448.104",
      "/help_page/1 722.247.931.582",
      "/about 061.945.150.735",
      "/home 184.123.665.067",
      "/help_page/1 646.865.545.408",
      "/home 235.313.352.950",
      "/contact 184.123.665.067",
      "/help_page/1 543.910.244.929",
      "/home 316.433.849.805",
      "/about/2 444.701.448.104",
      "/contact 543.910.244.929",
      "/about 126.318.035.038",
      "/home 184.123.665.067",
      "/about/2 836.973.694.403",
      "/index 316.433.849.805",
      "/index 802.683.925.780",
      "/home 184.123.665.067",
      "/help_page/1 929.398.951.889",
      "/contact 555.576.836.194",
      "/about/2 184.123.665.067",
      "/home 444.701.448.104",
      "/home 184.123.665.067",
      "/index 929.398.951.889",
      "/about 235.313.352.950",
      "/contact 200.017.277.774",
      "/about 836.973.694.403",
      "/contact 316.433.849.805",
      "/help_page/1 929.398.951.889",
      "/about/2 382.335.626.855",
      "/index 316.433.849.805",
      "/index 316.433.849.805",
      "/index 316.433.849.805",
      "/home 336.284.013.698",
      "/about 929.398.951.889",
      "/help_page/1 836.973.694.403",
      "/contact 836.973.694.403",
      "/home 444.701.448.104",
      "/about/2 543.910.244.929",
      "/about 715.156.286.412",
      "/contact 184.123.665.067",
      "/home 444.701.448.104",
      "/index 184.123.665.067"
    ]
  end

  let(:invalid_fixture) do
    [
      "/help_page/1 126.318.035.038",
      "/contact 184.123.665.067",
      "/home 184.123.665.067",
      "/about/2 444.701.448.104",
      "/help_page/1 929.398.951.889",
      "/index 444.701.448.104",
      "/help_page/1 722.247.931.582",
      "/about 061.945.150.735",
      "/help_page/1 646.865.545.408",
      "/home wryyyyy 235.313.352.950",
      " 184.123.665.067",
      "/help_page/1 ",
      "clearly wrong",
      nil,
    ]
  end

  describe "#call" do
    context "with all valid lines" do
      let(:errors) { [] }

      it "returns a correct report" do
        expect(subject.call(lines: valid_fixture, errors: errors).value).to eq([["/home", 5], ["/index", 4], ["/contact", 3], ["/help_page/1", 3], ["/about/2", 2], ["/about", 1]])
      end
    end

    context "with invalid lines" do
      let(:errors) { [] }

      it "adds errors" do
        subject.call(lines: invalid_fixture, errors: errors)
        expect(errors).not_to be_empty
      end
    end
  end
end
