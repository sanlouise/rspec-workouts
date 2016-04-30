class ExercisesController < ApplicationController
  
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
  
end
