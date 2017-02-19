class Admin::GroupsController < ApplicationController
	before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	before_filter :only_admin!, only: [:edit, :update, :destroy]
	before_filter :set_group, only: [:show, :edit, :update, :destroy]

	def index
		@groups = Group.roots
		redirect_to admin_exhibits_path if params[:q].present?
	end

	def show
		@exhibits = Exhibit.where(group_id: [@group.subtree_ids]).page(params[:page]).per(10)
	end

	def new
		@group = Group.new
	end

	def create
		@group = Group.new(group_params)
		@group.user_id = current_user.id
		if @group.save
			redirect_to admin_group_path(@group)
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @group.update_attributes(group_params)
			redirect_to admin_group_path(@group)
		else
			render :edit
		end
	end

	def destroy
		@group.destroy
		redirect_to admin_groups_path
	end

	private

	def set_group
		@group = Group.find(params[:id])
	end

	def only_admin!
		unless current_user.role == 'admin'
			redirect_to groups_path, flash: {error: 'Тільки адміністратор має доступ до цього розділу'}
		end
	end

	def group_params
		params.require(:group).permit(:name, :parent_id, :photo, :description)
	end
end
