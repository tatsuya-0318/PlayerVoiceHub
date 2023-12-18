class Public::ReportInquiriesController < ApplicationController
  def new
    @report_inquiry = ReportInquiry.new
  end
  
  def create
    @report_inquiry = current_user.report_inquiries.build(report_inquiries_params)
    if @report_inquiry.save
      session[:report_inquiry_details] = @report_inquiry.attributes
      redirect_to report_inquiry_report_inquiries_complete_path(@report_inquiry)
    else
      @report_inquiry.errors.full_messages
      render :new
    end
  end

  def complete
    @report_inquiry = session[:report_inquiry_details]
    session.delete(:report_inquiry_details)
  end
  
  private
  
  def report_inquiries_params
    params.require(:report_inquiry).permit(:content)
  end
end
