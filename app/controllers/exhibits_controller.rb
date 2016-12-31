class ExhibitsController < ApplicationController
	#layout "application"
	before_action :find_exhibit, only: [:edit, :update, :show, :destroy]
	before_action :authenticate_user!, only: [:new, :create, :edit, :update]
	before_action :only_author!, only: [:edit, :update, :destroy]

	def new
		@exhibit = 	Exhibit.new
	end

	def create
		@exhibit = Exhibit.new(page_params)
		@exhibit.user = current_user
		if @exhibit.save
			redirect_to exhibits_path
		else
			puts @exhibit.errors.full_messages.inspect
			render :new
		end
	end

	def index
		@exhibits = Exhibit.all
	end

	def edit
	end

	def update
		if @exhibit.update(page_params)
			redirect_to exhibits_path
		else
			render :edit
		end
	end

	def show
	end

	def destroy
		if @exhibit.destroy
			redirect_to  exhibits_path
		else
			redirect_to  exhibits_path, flash: {error: 'Something went wrong'}
		end
	end

	protected

	def only_author!
		unless @exhibit.user == current_user
			redirect_to exhibits_path, flash: {error: 'Only author can update exhibit'}
		end
	end

	def page_params
		params[:exhibit].permit(:name, :fond_group, :description, :section, 
			:collection_number, :inventory_number,
		 	:another_inv_num,:photo, :photo_number, :dating, :material, 
		 	:size_or_weight, :condition, :renewal, :date_of_renewal, :coordinates, :notes,
		 	:storage_location, :locality, :museum_director, :custodian, 
		 	:date_of_receipt, :act_of_reception_num)
	end

	def find_exhibit
		@exhibit = Exhibit.find(params[:id])
	end
end
