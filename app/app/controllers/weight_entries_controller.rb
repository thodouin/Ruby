class WeightEntriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_weight_entry, only: [:show, :edit, :update, :destroy]

  def index
    @weight_entries = WeightEntry.order(date: :desc)
  end

  def new
    @weight_entry = current_user.weight_entries.new
  end

  def create
    @weight_entry = current_user.weight_entries.new(weight_entry_params)
    if @weight_entry.save
      redirect_to weight_entries_path, notice: 'Votre suivi de poids a été ajouté avec succès.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @weight_entry = WeightEntry.find(params[:id])
    if @weight_entry.update(weight_entry_params)
      redirect_to weight_entries_path, notice: 'Votre suivi de poids a été modifié avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @entry = WeightEntry.find(params[:id])
    @entry.destroy
    redirect_to weight_entries_path, notice: "Entrée supprimée avec succès."
  end

  private

  def set_weight_entry
    @weight_entry = WeightEntry.find(params[:id])
  end
  def weight_entry_params
    params.require(:weight_entry).permit(:weight, :date)
  end
end
