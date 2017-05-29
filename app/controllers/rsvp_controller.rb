class RsvpController < ApplicationController
  before_action :authenticate_user!

  def create
    @rsvp = current_user.rsvps.new(rsvp_params)
    @rsvp.event_id = params[:event_id]

    if @rsvp.event_available?
       @rsvp.set_total_price
       @rsvp.save
       redirect_to @rsvp.event, notice: "Thank you for rsvp-ing!"

    else
      redirect_to @rsvp.event, notice: "Sorry! This listing is not available during the dates you requested."
    end
  end


  private


  ########## MOVED TO APP/MODELS/RSVP.RB - FAT MODELS, SKINNY CONTROLLERS #########
  # def get_total_price(rsvp_params)
  #   arrival, departure = get_dates(rsvp_params)
  #
  #   total_days = (departure - arrival).to_i
  #   rsvp_params[:price].to_i * total_days
  # end
  #
  # def get_dates(rsvp_params)
  #   arrival = Date.new(rsvp_params["starts_at(1i)"].to_i,
  #                      rsvp_params["starts_at(2i)"].to_i,
  #                      rsvp_params["starts_at(3i)"].to_i)
  #
  #
  #   departure = Date.new(rsvp_params["ends_at(1i)"].to_i,
  #                        rsvp_params["ends_at(2i)"].to_i,
  #                        rscp_params["ends_at(3i)"].to_i)
  #
  #   return arrival, departure
  # end

  def rsvp_params
    params.require(:rsvp).permit(:starts_at, :ends_at)
  end
end
