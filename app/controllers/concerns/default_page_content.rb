module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = "Portfolio Salves | My Website Portfolio"
    @seo_keywords = "Sergio Alves Portfolio"
  end

end
