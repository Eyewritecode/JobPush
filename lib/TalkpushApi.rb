class TalkpushApi
  
  require 'rest-client'

  attr_accessor :url, :campaign_id, :key, :secret

  def initialize(url, campaign_id)
    @campaign_id = campaign_id
    @key = Rails.application.secrets.TALKPUSH_KEY
    @secret = Rails.application.secrets.TALKPUSH_SECRET
    @url = url
  end
    
  def add_candidate(candidate)
    response = RestClient.post "#{@url}/#{@campaign_id}/campaign_invitations", {api_key: self.key, api_secret: self.secret, campaign_invitation: candidate}
    
    if response.code == 200
      @status = "Sent"
    else
      @status = "#{response.code} Error code"
    end
  end
end