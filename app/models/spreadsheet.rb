class Spreadsheet < ActiveRecord::Base
  
  require "google_drive"

  @@rows = 1
  
  def self.worksheet
    session = GoogleDrive::Session.from_config("client_secret.json")
    sheet = session.spreadsheet_by_key("1xkofJa5iI3AQE4yWEoHqMTQ1QQ-VDsfUDDwV96QQDVM").worksheets[0]
    return sheet
  end

  def self.get_rows
    worksheet.num_rows
  end

  def self.get_cols
    worksheet.num_cols
  end

  def self.new_candidate?
    if get_rows > @@rows
      true
    else
      false
    end
  end

  def self.get_candidate_info
    candidates = (get_rows - @@rows)
    return candidates
    # ws = worksheet
    # (1..get_cols).each do |col|
    #   return ws[@@rows, col]
    # end
  end
end
