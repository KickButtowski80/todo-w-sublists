class ApplicationController < ActionController::Base

  #####################################
  #####################################

    # => General
    before_action -> { @lists = List.all }, only: :index, unless: -> { params[:list_id] }

    # => Items
    before_action -> { @list = List.find params[:list_id] }, unless: -> { !params[:list_id] }
    before_action -> { @item = @list.items.find params[:id] }, except: [:new,:create,:index], if: -> { params[:list_id] }

  #####################################
  #####################################

    # => Index
    def index
      # => Vars defined with before_action
    end

    # => New
    def new
      @model = params[:list_id] ? @list.items.new : List.new
      render 'form'
    end

    # => Edit
    def edit
      # => Render form directly
      @model = params[:list_id] ? @item : @list
      render 'form'
    end

    # => Create
    def create
      @model = params[:list_id] ? @list.items.new(whitelisted_params) : List.new(whitelisted_params)

      respond_to do |format|
        if @model.save
          format.html { redirect_to (params[:list_id] ? list_path(@model.list_id) : lists_path), notice: 'Created' }
          format.json { render :show, status: :created, location: @model }
        else
          format.html { render 'form' }
          format.json { render json: @model.errors, status: :unprocessable_entity }
        end
      end

    end

    # => Update
    def update
      respond_to do |format|
        if @item.save whitelisted_params
          format.html { redirect_to list_path(@model.list_id), notice: 'Updated' }
          format.json { render :show, status: :created, location: @item }
        else
          format.html { render 'form' }
          format.json { render json: @item.errors, status: :unprocessable_entity }
        end
      end
    end

    # => Destroy
    def destroy
      @model = params[:list_id] ? @item.destroy : @list.destroy
      respond_to do |format|
        format.html { redirect_to (params[:list_id] ? list_path(@list) : root_path), notice: 'Destroyed.' }
        format.json { head :no_content }
      end
    end

  #####################################
  #####################################

    # => Complete
    def complete
      @item.toggle(:completed).save
      redirect_to list_items_path(@list), notice: 'Item Updated'
    end

  #####################################
  #####################################

  private

    # => Whitelisted Params
    def whitelisted_params
      params.require(params[:list_id] ? :item : :list ).permit(params[:list_id] ? [:description, :completed, :status, :list_id] : [:title, :created_at])
    end

  #####################################
  #####################################

end
