require File.join(File.dirname(__FILE__), 'generic_request_audio_visual')
class EditGenericRequestAudioVisual < GenericRequestAudioVisual
  def page_name
    "Edit Audio/Visual Request"
  end
  
  def form
    parent_hash = super
    child_hash = {
      :hidden_fields => parent_hash[:hidden_fields].push({:name => "TransactionNumber", :value => param_tag("TransactionNumber")})
    }
    parent_hash.merge!(child_hash)
  end
end