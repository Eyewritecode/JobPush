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

  def self.check_new_record
    if @@rows < get_rows
      (@@rows+1..get_rows).each do |row|
        (1..get_cols).each do |col|
          return worksheet[row, col]
        end
      end
    else
      return "no new record"
    end
    @@rows = get_rows
  end
end
