class Public::ReportInquiriesController < ApplicationController
  def new
    @report_inquiry = ReportInquiry.new
  end
  
  def create
    @report_inquiry = current_user.report_inquiries.build(report_inquiries_params)
    if @report_inquiry.save
      redirect_to report_inquiry_report_inquiries_complete_path(@report_inquiry)
    else
      @report_inquiry.errors.full_messages
      render :new
    end
  end

  def complete
    @report_inquiry = ReportInquiry.find_by(id: params[:report_inquiry_id])
  end
  
  private
  
  def report_inquiries_params
    params.require(:report_inquiry).permit(:content)
  end
end
