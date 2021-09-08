module Api
  module V1
    class ScoresController < ApplicationController
      def index
        scores = Score.limit(params[:limit]).offset(params[:offset]).order('playerName ASC')
        render json: {status: 'SUCCESS', message: 'Scores Loaded', data:scores},status: :ok
      end

      def show
        score = Score.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Score Loaded', data:score},status: :ok
      end

      def create

        score = Score.new(score_params)
        if score.save
          render json: {status: 'SUCCESS', message: 'Score Saved', data:score},status: :created
        else
          render json: {status: 'ERROR', message: 'Score Not Saved',
                        data:score.errors},status: :unprocessable_entity
        end
      end

      def destroy
        score = Score.find(params[:id])
        score.destroy
        render json: {status: 'SUCCESS', message: 'Score Deleted', data:score},status: :ok
      end

      def update
        score = Score.find(params[:id])
        if score.update(score_params)
          render json: {status: 'SUCCESS', message: 'Score Updated', data:score},status: :ok
        else
          render json: {status: 'ERROR', message: 'Score Not Updated', data:score},status: :unprocessable_entity
        end
      end

      private
      def score_params

      params.permit(:playerName, :playerId, :score, :time)
      end



    end
  end


end