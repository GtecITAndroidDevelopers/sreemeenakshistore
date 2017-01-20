include AutoHtml
class Product < ActiveRecord::Base  
  def self.import(file)
    Product.destroy_all
    CSV.foreach(file.path, headers: true) do |row|
      Product.create! row.to_hash
    end
  end
  
  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end
  
  auto_html_for :extra do 
    html_escape
    image
    youtube(:width => 400, :height => 250)
    link :target => "_blank", :rel => "nofollow"
    simple_format
  end
end
