class ContactController < ApplicationController
  def index
    @enquiry = Enquiry.new
  end
end
