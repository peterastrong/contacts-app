class MyContactsController < ApplicationController

  def index
    @contacts = MyContact.all.sort
    render "index.html.erb"
  end 

  def new
    render "new.html.erb"
  end 

  def create
    address = params[:input_address]
    coordinates = Geocoder.coordinates(address)
    latitude = coordinates[0]
    longitude = coordinates[1]
    @contact = MyContact.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number], middle_name: params[:middle_name], latitude: latitude, longitude: longitude)
    @contact.save
    redirect_to "/my_contacts/#{@contact.id}"
  end

  def show
    @contact = MyContact.find_by(id: params[:id])
    render "show.html.erb"
  end

  def edit
    @contact = MyContact.find_by(id: params[:id])
    render "edit.html.erb"
  end

  def update
    address = params[:input_address]
    coordinates = Geocoder.coordinates(address)
    latitude = coordinates[0]
    longitude = coordinates[1]
    @contact = MyContact.find_by(id: params[:id])
    @contact.assign_attributes(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number], middle_name: params[:middle_name], latitude: latitude, longitude: longitude)
    @contact.save
    redirect_to "/my_contacts/#{@contact.id}"
  end

  def destroy
    @contact = MyContact.find_by(id: params[:id])
    @contact.destroy
    redirect_to "/my_contacts"
  end

  def johns
    @contacts = MyContact.all_johns
    render "johns.html.erb"
  end 

end
