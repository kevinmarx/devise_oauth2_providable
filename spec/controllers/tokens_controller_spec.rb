require 'spec_helper'

describe Devise::Oauth2Providable::TokensController do
  routes { Devise::Oauth2Providable::Engine.routes }

  describe 'delete :destroy' do
    let(:user) { FactoryGirl.create :user }
    let(:client) { FactoryGirl.create :client }
    before do
      @token = Devise::Oauth2Providable::AccessToken.create! :client => client, :user => user
      @token_1 = Devise::Oauth2Providable::AccessToken.create! :client => client, :user => user
    end
    context 'with valid bearer token in header' do
      before do
        @request.env['HTTP_AUTHORIZATION'] = "Bearer #{@token.token}"
        delete :destroy, :format => 'json'
      end
      it { should respond_with :no_content }
      it { user.access_tokens.count.should eq(0)}
    end

    context 'with valid bearer token in query string' do
      before do
        delete :destroy, :access_token => @token.token, :format => 'json'
      end
      it { should respond_with :no_content }
      it { user.access_tokens.count.should eq(0)}
    end

    context 'with invalid bearer token in query param' do
      before do
        delete :destroy, :access_token => 'invalid', :format => 'json'
      end
      it { should respond_with :unauthorized }
      it { user.access_tokens.count.should_not eq(0)}
    end

    context 'with valid bearer token in header and query string' do
      before do
      end
      it 'raises error' do
        lambda {
          @request.env['HTTP_AUTHORIZATION'] = "Bearer #{@token.token}"
          get :index, :access_token => @token.token, :format => 'json'
        }.should raise_error
      end
    end

  end
end
