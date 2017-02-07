class MyContactsController < ApplicationController

  def index
    search_result = params[:search_result]
    if current_user
      if search_result
        @contacts = current_user.my_contacts.where("first_name ILIKE ? or middle_name ILIKE ? or last_name ILIKE ? or email ILIKE? or phone_number ILIKE ? ", "%#{search_result}%", "%#{search_result}%", "%#{search_result}%", "%#{search_result}%", "%#{search_result}%")
      elsif params[:group]
        selected_group = Group.find_by(name: params[:group])
        @contacts = selected_group.my_contacts.where(user_id: current_user.id)
      else
        @contacts = current_user.my_contacts 
      end    
      render "index.html.erb"
    else 
      redirect_to "/login"
    end 
  end 

  def new
    render "new.html.erb"
  end 

  def create
    address = params[:input_address]
    coordinates = Geocoder.coordinates(address)
    latitude = coordinates[0]
    longitude = coordinates[1]
    @contact = MyContact.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number], middle_name: params[:middle_name], latitude: latitude, longitude: longitude, user_id: current_user.id)
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
    @contact.assign_attributes(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], phone_number: params[:phone_number], middle_name: params[:middle_name], bio: params[:bio], latitude: latitude, longitude: longitude)
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
