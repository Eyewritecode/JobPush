class CandidatesController < ApplicationController
  
  require 'TalkpushApi'

  @@rows = 1
  @@url = "https://my.talkpush.com/api/talkpush_services/campaigns"
  @@campaign_id = "589caafca7723859b0fec1b0c073522a"
  
  def index 
  end
  
  def create
    api = TalkpushApi.new(@@url, @@campaign_id)
    candidates = []
    @number_of_rows = Spreadsheet.get_rows
    @sheet = Spreadsheet.worksheet
    if new_candidate?
      (@@rows+1..@number_of_rows).each do |row|
        candidate = {
        'first_name'        => @sheet[row, 2],
        'last_name'         => @sheet[row, 3],
        'user_phone_number' => @sheet[row, 5],
        'email'             => @sheet[row, 4],
        }
        candidates.push(candidate)
      end
      candidates.each do |cdt|
        api.add_candidate(cdt)
      end
    else
      @status = "NO NEW CANDIDATE"
    end
    @@rows = @number_of_rows
    redirect_to action: 'index'
  end

private

  def new_candidate?
    if @@rows < @number_of_rows
      return true
    else
      return false
    end
  end
end