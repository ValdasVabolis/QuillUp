class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)

    if @inquiry.save
      name = params[:inquiry][:name]
      email = params[:inquiry][:email]
      message = params[:inquiry][:message]

      InquiryMailer.send_inquiry(name, email, message).deliver
      flash[:notice] = 'Message sent succesfully!'
      redirect_to root_url
    else
      flash[:danger] = @inquiry.errors.full_messages.join(', ')
      redirect_to new_inquiry_url
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(
      :name, 
      :email, 
      :message
    )
  end
end