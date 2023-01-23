class EmpCompaniesController < ApplicationController
  def index
    @companies = Company.all
  end
end
