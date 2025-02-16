class PeopleController < ApplicationController
  def update
    @person = Person.find(params[:id])
    @person.update(person_params)
    head :ok
  end

  private

  def person_params
    params.require(:person).permit(:first_name, :last_name, :email)
  end
end
