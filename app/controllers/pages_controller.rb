class PagesController < ApplicationController
  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end

  def create
    # 1. We need to instantiate a new object using the form parameters.
    @page = Page.new(page_params)
    # 2. We attempt to save that object.
    if @page.save
    # 3. If the save succeeds, we will redirect the user somewhere. In our case, we would redirect to the index action.
    flash[:notice] = "Page was created successfully."
    redirect_to(page_path)
    else
    # 4. If the save fails, then we want to re-display the form so that the user can fix the problems and resubmit the form.
    render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
      flash[:notice] = "Page has been updated successfully"
      redirect_to(page_path(@page))
    else
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    flash[:notice] = "Page '#{@page.name}' destroyed successfully"
    redirect_to(page_path)
  end

  def page_params
    params.require(:page).permit(:name, :position, :visible, :permalink, :subject_id)
  end
end
