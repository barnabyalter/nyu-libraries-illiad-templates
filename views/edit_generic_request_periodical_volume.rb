require File.join(File.dirname(__FILE__), 'generic_request_periodical_volume')
class EditGenericRequestPeriodicalVolume < GenericRequestPeriodicalVolume
  def page_name
    "Edit Periodical Volume Request"
  end
  
  def form
    parent_hash = super
    child_hash = {
      :hidden_fields => parent_hash[:hidden_fields].push({:name => "TransactionNumber", :value => '<#PARAM name="TransactionNumber">'})
    }
    parent_hash.merge!(child_hash)
  end
end