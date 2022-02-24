class Admin::UsersController < ApplicationController

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true).page(params[:page])
    respond_to do |format|
      format.html
      format.csv { send_data ExportService::UserExport.new(@q.result).to_csv, filename: "User-#{DateTime.current}.csv" }
    end
  end

  def show
    @user = User.find(params[:id])
  end

end
