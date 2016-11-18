class RemindersController < ApplicationController
  include ApplicationHelper

  def index
    if logged_in?
      @user = User.find_by(id: current_user.id)
      @reminders = @user.reminders.order(time_to_go_out: :desc)
    end
  end

  def show
    if logged_in?
      @user = User.find(params[:user_id])
      @reminder = Reminder.find_by(id: params[:id])
      if @reminder == nil
        redirect_to new_user_reminder_url(@user)
      end
    end
  end

  def new
  	if logged_in?
  		@user = current_user
  	else
  		redirect_to :root
  	end
  end

  def create
    @user = User.find_by(id: params[:user_id])
  	if logged_in?
  		if @user == current_user
        @reminder = Reminder.new(reminder_params)
        @reminder.author = current_user

        # time = params[:reminder][:time_to_go_out]
        contact_id = params[:reminder][:contact_id]
        group_id = params[:reminder][:group_id]

        @group = Group.find_by(id: group_id)
        contact_id.reject!{ |c| c.empty? }
        if !group_id.empty?
          @group.contacts.each {|contact| @reminder.contacts << contact}
        else
          contact_id.each {|id| @reminder.contacts << Contact.find_by(id: id)}
        end
        @reminder.time_to_go_out += 21600

        if @reminder.save
          redirect_to user_reminder_url(@user, @reminder)
        else
          @errors = @reminder.errors.full_messages
          render :new
        end
  		else
        render :new
  		end
  	else
      redirect_to :root
  	end

  end

  def edit
    @user = User.find(params[:user_id])
    @reminder = Reminder.find(params[:id])
    @contacts = @reminder.contacts
  end

  def update
    contact_ids = params[:reminder][:contact_ids]
    contact_ids.reject!{ |c| c.empty? }
    @reminder = Reminder.find(params[:id])
    @reminder.assign_attributes(reminder_params)
    @reminder.time_to_go_out += 21600
    @reminder.save
    if !contact_ids.empty?
      @reminder.contacts = []
      contact_ids.each {|id| @reminder.contacts << Contact.find_by(id: id)}
    end

    redirect_to user_reminder_url(params[:user_id], @reminder)
  end

  def destroy
    @reminder = Reminder.find(params[:id])
    @reminder.destroy
    redirect_to user_reminders_url(params[:user_id])
  end


  private
  def reminder_params
  	params.require(:reminder).permit(:body, :time_to_go_out, :number_of_recurrences, :time_of_recurrence)
  end

end
