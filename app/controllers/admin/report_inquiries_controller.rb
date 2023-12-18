class Admin::ReportInquiriesController < ApplicationController
  def index
    @report_inquiry = ReportInquiry.all
  end

  def show
    @report_inquiry = ReportInquiry.find(params[:id])
  end
end
