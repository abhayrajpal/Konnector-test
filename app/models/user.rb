class User < ApplicationRecord
  def self.with_campaign_names(campaign_names)
    query = campaign_names.map { "JSON_CONTAINS(campaigns_list, ?)" }.join(' OR ')
    campaign_names_json = campaign_names.map { |name| [{ "campaign_name" => name }].to_json }

    where(query, *campaign_names_json)
  end
end
