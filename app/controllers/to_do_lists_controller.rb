class ToDoListsController < ApplicationController
    def index
        @tasks = ToDoList.all

        if params[:status].present?
            @tasks = @tasks.where(statuses: ToDoList.statuses[params[:status]])
        end

        @tasks = @tasks.page(params[:page]).per(5)
    end

    def show_modal
        @task = ToDoList.find(params[:id]) 
        render partial: 'modal', locals: { task: @task }
    end

    def new
        @task = ToDoList.new
    end

    def create
        @task = ToDoList.new(to_do_list_params)

        if @task.save
            flash[:notice] = "Task created successfully!"
            redirect_to root_path
        else
            flash[:alert] = @task.errors.full_messages.join(", ")
            render :new
        end
    end

    def edit
        @task = ToDoList.find(params[:id])
    end

    def update
        @task = ToDoList.find(params[:id])

        if @task.update(to_do_list_params)
            redirect_to root_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @task = ToDoList.find(params[:id])
        @task.destroy
        respond_to do |format|
            format.html { redirect_to root_path, notice: 'The task was successfully deleted.' }
            format.json { head :no_content }
        end
    end

    private

    def to_do_list_params
        params.require(:to_do_list).permit(:title, :description, :due_date, :due_time, :priority, :statuses, :category, :created_at)
    end
end