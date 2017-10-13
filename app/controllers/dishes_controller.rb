class DishesController < ApplicationController


	def index
		@dishes = Dish.all
		@dish = Dish.new
	end


	def new
		@dish = Dish.new
	end

	def create 
		dish_params = params[:dish].permit(:name, :description)
		@dish = Dish.new(dish_params)
		if  @dish.save
			flash[:success] = "Task created successfully"
			redirect_to root_path
		else
			flash.now[:danger] = "Task was invalid"
            render 'new'
        end
     end

     def edit
     	@dish = Dish.find(params[:id])
     end 

     def update
     	dish_params = params[:dish].permit(:name, :description)
     	@dish = Dish.find(params[:id])
     	if  @dish.update(dish_params)
			flash[:success] = "Task created successfully"
			redirect_to root_path
		else
			flash.now[:danger] = "Post was invalid"
            render :edit
		end
     end

     def destroy
     	@dish = Dish.find(params[:id])
     	@dish.destroy
     	redirect_to root_path
     end

  end

		