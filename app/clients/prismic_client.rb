class PrismicClient
  API_URL = 'https://carlos-challenge.prismic.io/api'.freeze

  def initialize
    @api = ::Prismic.api(API_URL)
  end

  def extract_docs(document_ids)
    response = @api.get_by_ids(document_ids)
    parse_documents(response.results)
  end

  private

  def parse_documents(documents)
    documents.map do |document|
      if document.type == 'simple-post'
        {
          external_id: document.id,
          title: document['simple-post.title']&.as_text,
          image_url: document['simple-post.image']&.url,
          content: document['simple-post.content'].as_html(nil)
        }
      end
    end
  end
end
