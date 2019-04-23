class VotesController < ApplicationController

  def up_vote
    update_vote(1)
    redirect_back(fallback_location: :root)
  end

  def down_vote
    update_vote(-1)
    redirect_back(fallback_location: :root)
  end

  private
  def update_vote(new_value)
    @option = Option.find(params[:option_id])
    @vote = @option.votes.where(user_id: current_user.id).first

    if @vote
      @vote.update_attribute(:value, new_value)
    else
      @vote = current_user.votes.create(value: new_value, option: @option)
    end
  end
end
