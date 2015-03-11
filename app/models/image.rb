class Image < ActiveRecord::Base
	has_attached_file :img, 
		:path => ":rails_root/public/system/:class/:attachement/:id/:basename_:style.:extension",
		:url => "/system/:class/:attachement/:id/:basename_:style.:extension",
		:default_url => '',
		:styles => {
		  :small    => ['100x100#',  :jpg, :quality => 70],
		  :large    => ['1000>',      :jpg, :quality => 70],
		}


	validates_attachment :img,
		:size => { :in => 0..10.megabytes },
	    :content_type => { :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"] }

	belongs_to :item
end
