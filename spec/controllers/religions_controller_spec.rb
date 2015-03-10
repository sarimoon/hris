require 'spec_helper'

RSpec.describe ReligionsController, :type => :controller do
  
  describe "index" do
      before do
        Religion.create!(name: 'Baked Potato w/ Cheese db')
        Religion.create!(name: 'Garlic Mashed Potatoes db')
        Religion.create!(name: 'Potatoes Au Gratin db')
        Religion.create!(name: 'Baked Brussel Sprouts db')

		get :index, format: :json, keywords: keywords
      end
	  
	  subject(:results) { JSON.parse(response.body) }

      def extract_name
        ->(object) { object["name"] }
      end

      context "when the search finds results" do
        let(:keywords) { 'baked' }
        it 'should 200' do
          expect(response.status).to eq(200)
        end
        it 'should return two results' do
          expect(results.size).to eq(2)
        end
        it "should include 'Baked Potato w/ Cheese'" do
          expect(results.map(&extract_name)).to include('Baked Potato w/ Cheese')
        end
        it "should include 'Baked Brussel Sprouts'" do
          expect(results.map(&extract_name)).to include('Baked Brussel Sprouts')
        end
      end

      context "when the search doesn't find results" do
        let(:keywords) { 'foo' }
        it 'should return no results' do
          expect(results.size).to eq(0)
        end
      end
  end

end
