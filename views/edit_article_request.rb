require File.join(File.dirname(__FILE__), 'article_request')
class EditArticleRequest < ArticleRequest
  def form
    parent_hash = super
    child_hash = {
      :hidden_fields => parent_hash[:hidden_fields].push({:name => "TransactionNumber", :value => param_tag("TransactionNumber")})
    }
    parent_hash.merge!(child_hash)
  end
end