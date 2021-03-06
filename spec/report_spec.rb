require 'spec_helper'
require 'tmpdir'

describe PDK::Report do
  def tmpdir
    @tmpdir ||= Dir.mktmpdir
  end

  after(:each) do
    FileUtils.remove_entry_secure(@tmpdir) if @tmpdir
  end

  it 'includes formats junit and text' do
    expect(described_class.formats).to eq(%w[junit text])
  end

  it 'has a default format of junit' do
    expect(described_class.default_format).to eq('text')
  end

  context 'when no format is specified' do
    let(:report) { described_class.new(File.join(tmpdir, 'report.txt')) }

    it 'instantiates its format to text' do
      expect(report).to receive(:prepare_text).with('cmd output')
      report.write('cmd output')
    end
  end

  context 'when a format is specified' do
    let(:report) { described_class.new(File.join(tmpdir, 'report.xml'), 'junit') }

    it 'instantiates its format to junit' do
      expect(report).to receive(:prepare_junit).with('cmd output')
      report.write('cmd output')
    end
  end
end
