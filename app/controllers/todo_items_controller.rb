class TodoItemsController < ApplicationController
  before_action :set_todo_item, only: [ :complete, :show, :edit, :update, :destroy]
  before_action :set_todo_list, only: [ :index, :create,  :show, :destroy, :update]
  before_action :authenticate_user!
  
  
  # GET /todo_items
  # GET /todo_items.json
  def index
    @todo_items = @todo_list.todo_items.all.order("completed ASC")    
  end

  # GET /todo_items/1
  # GET /todo_items/1.json
  def show
  end

  # GET /todo_items/new
  def new
    @todo_list = TodoList.find(params[:todo_list_id])
    @todo_item = @todo_list.todo_items.new
     
  end

  # GET /todo_items/1/edit
  def edit
     @todo_list = TodoList.find(params[:todo_list_id])
  end

  # POST /todo_items
  # POST /todo_items.json
  def create 
     @todo_item = @todo_list.todo_items.new(todo_item_params)
    
    respond_to do |format|
      if @todo_item.save
        format.html { redirect_to todo_list_todo_items_path, notice: 'Todo item was successfully created.' }     
      else
        format.html {redirect_to todo_list_todo_items_path, notice: "#{render_to_string(partial: '/shared/errors_messages' , locals: {todo_item: @todo_item})}"}
       
      end
    end
  end

  # PATCH/PUT /todo_items/1
  # PATCH/PUT /todo_items/1.json
  def update
     
    respond_to do |format|
      if @todo_item.update(todo_item_params)
        format.html { redirect_to  todo_list_todo_items_path(@todo_list), notice: 'Todo item was successfully updated.' }
        # format.json { render :show, status: :ok, location: @todo_item }
      else
        format.html { render :edit }
        # format.json { render json: @todo_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo_items/1
  # DELETE /todo_items/1.json
  def destroy
    @todo_item.destroy
    respond_to do |format|
      format.html { redirect_to  todo_list_todo_items_url, notice: 'Todo item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


    def complete
      if @todo_item.completed?
        # byebug
        @todo_item.update_attribute(:completed,false)
        redirect_to  todo_list_todo_items_path, notice: 'Todo item marked down.'
      else
        @todo_item.update_attribute(:completed,true)
        redirect_to  todo_list_todo_items_path, notice: 'Todo item un marked.'
      end
    end
    
    
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_todo_item
      @todo_item = TodoItem.find(params[:id])
    end
    
    def set_todo_list
     @todo_list = TodoList.find(params[:todo_list_id])    
    end
    
    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_item_params
      params.require(:todo_item).permit(:description, :completed, :status, :todo_list_id)
    end

end
