class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_request!
  require "scrypt"
  # GET /contacts
  # GET /contacts.json
  def index
    from = Contact.from_user(@current_user.id).pluck(:contact_user)
    to = Contact.to_user(@current_user.id).pluck(:user_id)
    puts "***************************************FROM:#{from}***********************TO:#{to}"
    @contacts = User.where(id: from).pluck(:email)
    @contacts+= User.where(id: to).pluck(:email)
    respond_to do |format|
      format.json {render json: {contacts: @contacts}}
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new({
      user_id: @current_user.id,
      contact_user: User.find_by_email(contact_params[:contact_user]).id,
      channel_key: SCrypt::Engine.hash_secret(SCrypt::Engine.generate_salt, SCrypt::Engine.generate_salt)
      })
    respond_to do |format|
      if User.find_by_email(contact_params[:contact_user]).present? && @contact.save
        format.html { redirect_to @contact, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:contact_user)
    end
end
