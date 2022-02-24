require 'csv'

class ExportService::UserExport
  def initialize(data)
    @data = data
  end

  def to_csv
    attributes = %w{ id username email role }

    CSV.generate(headers: true) do |csv|
      csv << attributes

      @data.all.each do |user|
        csv << attributes.map {|attr| user.send(attr)}
      end
    end
  end
end
