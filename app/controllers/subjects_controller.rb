class SubjectsController < ApplicationController
 layout 'admin'
  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => 'Default'})
  end

  def create
    # 1. We need to instantiate a new object using the form parameters.
    @subject = Subject.new(subject_params)
    # 2. We attempt to save that object.
    if @subject.save
      # 3. If the save succeeds, we will redirect the user somewhere. In our case, we would redirect to the index action.
    flash[:notice] = "Subject created successfully."
    redirect_to(subjects_path)
    else
    # 4. If the save fails, then we want to re-display the form so that the user can fix the problems and resubmit the form.
    render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    # 1. We need to find a new object using the form parameters.
    @subject = Subject.find(params[:id])
    # 2. We attempt to update that object.
    if @subject.update_attributes(subject_params)
    # 3. If the save succeeds, we will redirect the user somewhere. In our case, we would redirect to the show action.
    flash[:notice] = "Subject updated successfully."
    redirect_to(subject_path(@subject))
    else
    # 4. If the save fails, then we want to re-display the form so that the user can fix the problems and resubmit the form.
    render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject '#{@subject.name}' destroyed successfully."
    redirect_to(subjects_path)
  end

  private

  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end
end
