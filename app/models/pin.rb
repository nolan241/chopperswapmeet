class Pin < ActiveRecord::Base
	belongs_to :user

	has_attached_file :image, :styles => { :large => "700x700>", :medium => "500x500>", :thumb => "100x100>"}

#http://stackoverflow.com/questions/21897725/papercliperrorsmissingrequiredvalidatorerror-with-rails-4
# Added validation for paperclip image upload
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	validates :image, presence: true
	validates :price, presence: true
	validates :title, presence: true
	
	#carrierwave 
  	has_many :pin_attachments
	accepts_nested_attributes_for :pin_attachments

	#comments
	has_many :comments
	#, dependent => :destroy
	
	#categories
	belongs_to :category

end
