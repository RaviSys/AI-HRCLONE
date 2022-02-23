require 'csv'

class ExportService::EmployeeExport
  def initialize(data)
    @data = data
  end

  def to_csv
    attributes = Employee.column_names

    CSV.generate(headers: true) do |csv|
      csv << attributes

      @data.all.each do |employee|
        csv << attributes.map {|attr| employee.send(attr)}
      end
    end
  end
end
