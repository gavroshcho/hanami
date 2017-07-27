RSpec.describe "Hanami.app?", type: :cli do
  context 'when HANAMI_APPS is empty' do
    it "checks if the given app matches the allowed one" do
      with_project do
        ENV['HANAMI_APPS'] = nil

        expect(Hanami.app?(:web)).to   be(true)
        expect(Hanami.app?('web')).to  be(true)
        expect(Hanami.app?(:admin)).to be(true)
      end
    end
  end

  context 'when HANAMI_APPS is not empty' do
    it "checks if the given app matches the allowed one" do
      with_project do
        ENV['HANAMI_APPS'] = 'web,api'

        expect(Hanami.app?(:web)).to   be(true)
        expect(Hanami.app?('web')).to  be(true)
        expect(Hanami.app?(:api)).to   be(true)
        expect(Hanami.app?(:admin)).to be(false)
      end
    end
  end
end
