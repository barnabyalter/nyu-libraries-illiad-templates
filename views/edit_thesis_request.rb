require File.join(File.dirname(__FILE__), 'thesis_request')
class EditThesisRequest < ThesisRequest
  def page_name
    "Edit Dissertation/Thesis Request"
  end
  
  def form
    parent_hash = super
    child_hash = {
      :hidden_fields => parent_hash[:hidden_fields].push({:name => "TransactionNumber", :value => '<#PARAM name="TransactionNumber">'})
    }
    parent_hash.merge!(child_hash)
  end

end