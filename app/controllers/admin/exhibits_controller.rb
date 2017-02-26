class Admin::ExhibitsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :only_admin!
	before_filter :find_exhibit, only: [:show, :edit, :update, :destroy]
	layout "admin"
	
	 def index
		@exhibits = Exhibit.all
		@exhibits = @exhibits.where("LOWER(name) LIKE LOWER('%#{params[:q]}%')") if params[:q].present?
	end

	def show
	end

	def new
		@exhibit = 	Exhibit.new
	end

	def create
		@exhibit = Exhibit.new(page_params)
		@exhibit.user = current_user
		if @exhibit.save
			redirect_to admin_exhibits_path
		else
			puts @exhibit.errors.full_messages.inspect
			render :new
		end
	end

	def edit
	end

	def update
		if @exhibit.update(page_params)
			redirect_to admin_exhibit_path(@exhibit)
		else
			render :edit
		end
	end

	def destroy
		if @exhibit.destroy
			redirect_to  admin_groups_path
		else
			redirect_to  admin_groups_path, flash: {error: 'Something went wrong'}
		end
	end

	private

	def only_admin!
		unless current_user.role == 'admin'
			redirect_to groups_path, flash: {error: 'Тільки адміністратор має доступ до цього розділу'}
		end
	end

	def page_params
		params.require(:exhibit).permit(:name, :group_id, :description, :section, 
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
