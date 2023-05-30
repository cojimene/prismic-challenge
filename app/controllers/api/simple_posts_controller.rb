module Api
  class SimplePostsController < ApplicationController
    def create
      CreateSimplePostJob.perform_later(
        client_class: 'PrismicClient',
        document_ids: params['documents']
      )

      render json: { message: 'Create documents in queue' }, status: :created
    end

    def destroy
      destroyed = []

      params['documents'].each do |document_id|
        destroyed << document_id if SimplePost.find_by(external_id: document_id)&.destroy
      end

      render json: { message: "Documents #{destroyed} were destroyed" }, status: :ok
    end
  end
end
