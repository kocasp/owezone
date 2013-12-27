class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  include TransactionsHelper

  # GET /transactions
  # GET /transactions.json
  def index
    if params.has_key?(:event_id)
      @event = Event.find(params[:event_id])
      @transactions = @event.transactions.all
    else
      @transactions = Transaction.all
    end
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
    if params.has_key?(:event_id)
      @transaction.event_id = params[:event_id]
      @people = Event.find(params[:event_id]).people
    end
  end

  # GET /transactions/1/edit
  def edit
  end

  def add_details
    @transaction = Transaction.find(params[:transaction_id])
    @people = @transaction.event.people
  end

  def save_details
    @transaction = Transaction.find(params[:transaction_id])
    handle_details(@transaction, params["debt_ids"], params["amounts"])
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to add_details_transaction_path(@transaction), notice: 'Transaction was successfully created.' }
        format.json { render action: 'show', status: :created, location: @transaction }
      else
        format.html { render action: 'new' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:name, :event_id)
    end
end
