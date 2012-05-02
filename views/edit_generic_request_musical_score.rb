require File.join(File.dirname(__FILE__), 'generic_request_musical_score')
class EditGenericRequestMusicalScore < GenericRequestMusicalScore
  def page_name
    "Edit Musical Score Request"
  end
  
  def form
    parent_hash = super
    child_hash = {
      :hidden_fields => parent_hash[:hidden_fields].push({:name => "TransactionNumber", :value => '<#PARAM name="TransactionNumber">'})
    }
    parent_hash.merge!(child_hash)
  end
end