class ExercisesController < ApplicationController
  
  # Applied to the show action
  before_action :set_exercise, except: [:index, :new, :create]
  
  def index
  end
  
  def new
    @exercise = current_user.exercises.new
  end
  
  def create
    @exercise = current_user.exercises.new(exercise_params)
    
    if @exercise.save
      flash[:success] = "Your workout was added!"
      redirect_to [current_user, @exercise]
    else
      flash[:danger] = "Oops, your workout could not be added.."
      render :new
    end
  end
  
  def show
  end
  
  
  private
  
  def exercise_params
    params.require(:exercise).permit(:duration_in_min, :workout, :workout_date, :user_id)
  end
  
  def set_exercise
    @exercise = current_user.exercises.find(params[:id])
  end
  
end
