class UrlsController < ApplicationController
  def index
    # clicks should be sorted by most clicks
    @urls = Url.where(user_id: current_user.id).order(clicks: :desc)
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    @url.user_id = current_user.id
    @url.clicks = 0

    lookup = @url.lookup_code

    if lookup.empty?
      lookup = @url.generate_lookup_code
      @url.lookup_code = lookup
    else
      if Url.exists?(lookup_code: lookup)
        flash[:error] = "This short URL already exists. Please try again."
        redirect_to new_url_path
        return
      elsif lookup.length < 3
        flash[:error] = "Short URL must be at least 3 characters. Please try again."
        redirect_to new_url_path
        return
      elsif lookup.length > 16
        flash[:error] = "Short URL must be less than 16 characters. Please try again."
        redirect_to new_url_path
        return
      end
      @url.lookup_code = lookup
    end

    if @url.save
      redirect_to urls_path
    else
      puts @url.errors.full_messages
      flash[:error] = "there is something wrong"
      render :new
    end
  end

  def show
    @url = Url.find_by(lookup_code: params[:lookup_code])
    if @url.present?
      @url.increment!(:clicks)
      redirect_to @url.original_url, allow_other_host: true
    else
      flash[:error] = "This url does not exist"
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

