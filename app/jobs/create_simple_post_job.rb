class CreateSimplePostJob < ApplicationJob
  queue_as :default

  def perform(client_class:, document_ids: [])
    client = client_class.constantize.new
    @posts = client.extract_docs(document_ids)
    create_simple_posts
  end

  private

  def create_simple_posts
    @posts.each { |post| SimplePost.create(post) }
  end
end
