ActiveAdmin.register Project do
	permit_params :name, :content, :price, :image

	show do |t|
		attributes_table do
			row :name
			row :content
			row :price
			row :image_url
		end
	end

	form :html => { :enctype => "multipart/form-data" } do |f|
		f.inputs do
			f.input :name
			f.input :content
			f.input :price
			f.input :image_url
		end
		f.actions
	end
end
