class LandmarksController < ApplicationController
  # add controller methods

  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'landmarks/index'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])

    redirect "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/new' do
    erb :'landmarks/new'
  end

  get '/landmarks/:id' do |id|
    @landmark = Landmark.find(id)
    erb :'landmarks/show'
  end

  patch '/landmarks/:id' do |id|
    @landmark = Landmark.find(id)
    @landmark.update(params["landmark"])

    redirect "/landmarks/#{id}"
  end

  get '/landmarks/:id/edit' do |id|
    @landmark = Landmark.find(id)

    erb :'landmarks/edit'
  end







end
