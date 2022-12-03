class UrlsController < ApplicationController
  before_action :authenticate_user!

  def index
    @urls = Url.where(user_id: current_user.id)
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    # if signed in user, set user_id to current user else set to nil

    @url.user_id = current_user.id

    @url.clicks = 0

    lookup = @url.lookup_code

    if lookup.empty?
      lookup = @url.generate_lookup_code
    elsif Url.exists?(lookup_code: lookup)
      flash[:alert] = 'This short URL already exists. Please try again.'
      redirect_to new_url_path
      return
    elsif lookup.length < 3
      flash[:alert] = 'Short URL must be at least 3 characters. Please try again.'
      redirect_to new_url_path
      return
    elsif lookup.length > 16
      flash[:alert] = 'Short URL must be less than 16 characters. Please try again.'
      redirect_to new_url_path
      return
    elsif lookup.match?(/\W/)
      flash[:alert] = 'Short URL must be alphanumeric. Please try again.'
      redirect_to new_url_path
      return
    end
    @url.lookup_code = lookup

    if @url.save
      redirect_to urls_path
    else
      puts @url.errors.full_messages
      flash[:alert] = 'there is something wrong please try again'
      render :new
    end
  end

  def show
    @url = Url.find_by(lookup_code: params[:lookup_code])
    if @url.present?
      @url.increment!(:clicks)
      redirect_to @url.original_url, allow_other_host: true
    else
      flash[:error] = 'This url does not exist'
      redirect_to root_path
    end
  end

  def destroy
    @url = Url.find(params[:id])
    @url.destroy
    redirect_to urls_path
  end

  private

  def url_params
    params.require(:url).permit(:original_url, :lookup_code)
  end
end
