class Item < ActiveRecord::Base
	has_attached_file :photo, 
		:path => ":rails_root/public/system/:attachment/:id/:basename_:style.:extension",
		:url => "/system/:attachment/:id/:basename_:style.:extension",
		:styles => {
		  :small    => ['100x100#',  :jpg, :quality => 70],
		  :large    => ['600>',      :jpg, :quality => 70],
		}

	validates_attachment :photo,
		:size => { :in => 0..10.megabytes },
	    :content_type => { :content_type => /^image\/(jpeg|png|gif)$/ }

end