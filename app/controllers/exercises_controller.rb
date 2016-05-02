class ExercisesController < ApplicationController
  
  # Applied to the show action
  before_action :set_exercise, except: [:index, :new, :create]
  # Only logged in users can view workouts
  before_action :authenticate_user!
  
  def index
    @exercises = current_user.exercises.all
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
  
  def edit
  end
  
  def update
    if @exercise.update(exercise_params)
      flash[:success] = "Your workout was updated!"
      redirect_to [current_user, @exercise]
    else
      flash[:danger] = "Oops, your workout could not be updated.."
      render :edit
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
