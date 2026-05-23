module Api
  module V1
    class MoodsController < ApplicationController
      def index
        @moods = Mood.all
        render json: @moods
      end

      # POST /moods
      def create
        @mood = Mood.new(mood_params)

        if @mood.save
          render json: @mood, status: :created
        else
          render json: @mood.errors, status: :unprocessable_content
        end
      end

    def stats
      stats = Mood
        .group(:name, :emoji)
        .select(
          :name,
          :emoji,
          "COUNT(*) AS total"
        )

      render json: stats
    end

      private
      # Only allow a list of trusted parameters through.
      def mood_params
        params.expect(mood: [ :emoji, :name, :reason ])
      end
    end
  end
end

