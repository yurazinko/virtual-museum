class GroupsController < ApplicationController
	before_action :set_group, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	before_action :only_author!, only: [:edit, :update, :destroy]

	def index
		@groups = Group.roots
		redirect_to exhibits_path if params[:q].present?
		@title = "Фонди - Музей «Мостищина»"
	end

	def show
		@exhibits = Exhibit.where(group_id: [@group.subtree_ids]).page(params[:page]).per(10)
		@title = "#{@group.name} : #{@group.parent.name if @group.parent.present?} - Музей «Мостищина»" 
	end

	def new
		@group = Group.new
	end

	def create
		@group = Group.new(group_params)
		@group.user_id = current_user.id
		if @group.save
			redirect_to group_path(@group)
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @group.update_attributes(group_params)
			redirect_to group_path(@group)
		else
			render :edit
		end
	end

	def destroy
		@group.destroy
		redirect_to groups_path
	end

	protected

	def set_group
		@group = Group.find(params[:id])
	end

	def only_author!
		unless @group.user_id == current_user.id
			redirect_to groups_path, flash: {error: 'Only author can update exhibit'}
		end
	end

	def group_params
		params.require(:group).permit(:name, :parent_id, :photo, :description)
	end
end
