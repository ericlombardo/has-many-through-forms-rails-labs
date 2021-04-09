class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  # accepts_nested_attributes_for :categories

  def categories_attributes=(category_attributes)
    @category_attributes = category_attributes
    assign_categories
  end
  
  private
  def assign_categories
    @category_attributes.values.each do |cat_val|
      self.categories << Category.find_or_create_by(cat_val) if categories_present?(cat_val)
    end
  end

  def categories_present?(cat_val)
    !cat_val.values.any?("")
  end
end
