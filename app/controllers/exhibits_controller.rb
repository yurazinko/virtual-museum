class ExhibitsController < ApplicationController
	before_action :find_exhibit, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :create, :edit, :update]
	before_action :only_admin!, only: [:new, :edit, :update, :destroy]

	def new
		@exhibit = 	Exhibit.new
	end

	def create
		@exhibit = Exhibit.new(page_params)
		@exhibit.user = current_user
		if @exhibit.save
			redirect_to exhibit_path(@exhibit)
		else
			puts @exhibit.errors.full_messages.inspect
			render :new
		end
	end

	def index
		@exhibits = Exhibit.all
		@exhibits = @exhibits.where("LOWER(name) LIKE LOWER('%#{params[:q]}%')") if params[:q].present?
	end

	def edit
	end

	def update
		if @exhibit.update(page_params)
			redirect_to exhibit_path(@exhibit)
		else
			render :edit
		end
	end

	def show
		@title = "#{@exhibit.name} : #{@exhibit.group.name} - Музей «Мостищина»"
	end

	def destroy
		if @exhibit.destroy
			redirect_to  groups_path
		else
			redirect_to  groups_path, flash: {error: 'Something went wrong'}
		end
	end

	private

	def only_admin!
		unless current_user.role == 'admin'
			redirect_to groups_path, flash: {error: 'Only admin can update exhibit'}
		end
	end

	def page_params
		params[:exhibit].permit(:name, :group_id, :description, :section, 
			:collection_number, :inventory_number,
		 	:another_inv_num, :photo, :photo_number, :dating, :material, 
		 	:size_or_weight, :condition, :renewal, :date_of_renewal, :address, :coordinates, :notes,
		 	:storage_location, :locality, :museum_director, :custodian, 
		 	:date_of_receipt, :act_of_reception_num)
	end

	def find_exhibit
		@exhibit = Exhibit.find(params[:id])
	end
end
