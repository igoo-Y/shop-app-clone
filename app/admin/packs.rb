ActiveAdmin.register Pack do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :image, :product_name, :company_name, :desc
  #
  # or
  #
  # permit_params do
  #   permitted = [:image, :product_name, :company_name, :desc]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  #index 커스텀
  index do
    selectable_column

    id_column

    column :image do |pack|
      if pack.image.attached?
        image_tag url_for(pack.image), class: 'small_img'
      else
        '이미지 없음'
      end
    end

    column :product_name
    column :company_name
    column :desc

    actions
  end

  #new, edit 커스텀
  form do |f|
    f.inputs do
      f.input :image, as: :file #active_admin 에서는 f.input :컬럼명, as: :file(원하는 자료 타입) 으로 변경가능.
      f.input :product_name
      f.input :company_name
      f.input :desc
    end
    f.actions
  end

  #show 커스텀
  show do
    attributes_table do
      row :id
      row :image do |pack|
        if pack.image.attached?
          image_tag url_for(pack.image), class: 'small_img'
        else
          '이미지 없음'
        end
      end
      row :product_name
      row :company_name
      row :desc
    end
  end

end
