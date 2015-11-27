require 'bike'

describe Bike do
	it 'should respond to method broken?' do
		expect(subject).to respond_to :broken?
	end

	it 'can be reported broken' do
		subject.report_broken
		expect(subject).to be_broken
	end
end
