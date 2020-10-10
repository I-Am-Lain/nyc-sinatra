class FiguresController < ApplicationController
  # add controller methods

  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end


  get '/figures/new' do
    ### need all titles and figures?
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'figures/new'
  end

  get '/figures/:id' do |id|
    @figure = Figure.find(id)

    erb :'figures/show'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params["title"]["name"].empty?
      @figure.titles << Title.create(name: params["title"]["name"])
    end

    #unable to implement same thing as above with && for both fields
    @figure.landmarks << Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year"])


    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id/edit' do |id|
    @figure = Figure.find(id)
    @titles = Title.all
    @landmarks = Landmark.all

    erb :'figures/edit'
  end

  patch '/figures/:id' do |id|
    @figure = Figure.find(id)
    @figure.update(params["figure"])

    if !params["landmark"]["name"].empty?
      @figure.landmarks << Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year"])
    end

    redirect "/figures/#{id}"
  end


end
