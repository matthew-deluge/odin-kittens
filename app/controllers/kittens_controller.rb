class KittensController < ApplicationController

  def index
    @kittens = Kitten.all
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def new
    @kitten = Kitten.new
  end

  def edit
  end

  def create
    @kitten = Kitten.new(params)

      respond_to do |format|
        if @event.save
          format.html { redirect_to @kitten, notice: "Kitten was successfully created." }
          format.json { render :show, status: :created, location: @kitten }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @kitten.errors, status: :unprocessable_entity }
        end
      end
  end

  def update
    respond_to do |format|
      if @kitten.update(event_params)
        format.html { redirect_to @event, notice: "Kitten was successfully updated." }
        format.json { render :show, status: :ok, location: @kitten }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @kitten.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @kitten.destroy
    respond_to do |format|
      format.html { redirect_to kittens_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  private

  def set_kitten
    @kitten = Kitten.find(params[:id])
  end

  def kitten_params
    params.require(:kitten).permit(:name, :age, :cuteness, :softness)
  end
  
end

