require 'rails_helper'

RSpec.describe 'Requests::PostsController', type: :request do
  describe 'GET/index ' do
    before :each do
      get '/users/1/posts'
    end

    it 'it should render all posts' do
      expect(response).to render_template(:index)
    end

    it 'responds with the correct text' do
      expect(response.body).to include('Post#index')
    end

    it 'responds with a 200 status code' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET/new' do
    before :each do
      get '/users/1/posts/new'
    end

    it 'it should render new post' do
      expect(response).to render_template(:new)
    end

    it 'responds with a 200 status code' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET/show' do
    before :each do
      get '/users/1/posts/1'
    end

    it 'it should render show post' do
      expect(response).to render_template(:show)
    end

    it 'responds with the correct text' do
      expect(response.body).to include('Post#show')
    end

    it 'responds with a 200 status code' do
      expect(response).to have_http_status(200)
    end
  end
end