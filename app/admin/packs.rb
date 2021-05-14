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

  #scope
  scope :all
  scope -> {"공개"}, :published, default: true
  scope -> {"비공개"}, :unpublished

  #batch
  batch_action :publish do |ids|
    @packs = Pack.where(id: ids)

    @packs.each do |pack|
      pack.update(is_publish: true)
    end

    flash[:notice] = "마스크 팩이 공개처리되었습니다."
    redirect_back(fallback_location: root_path)
  end

  batch_action :unpublish do |ids|
    @packs = Pack.where(id: ids)

    @packs.each do |pack|
      pack.update(is_publish: false)
    end

    flash[:notice] = "마스크 팩이 비공개처리되었습니다." #이때 notice 를 error 로 바꾸면 빨간색으로 나옴.
    redirect_back(fallback_location: root_path)
  end

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
    column :price do |pack|
      number_to_currency(pack.price)
    end
    column :is_publish

    actions
  end

  #new, edit 커스텀
  form do |f|
    f.inputs do
      f.input :image, as: :file #active_admin 에서는 f.input :컬럼명, as: :file(원하는 자료 타입) 으로 변경가능.
      f.input :product_name
      f.input :company_name
      f.input :desc
      f.input :price, hint: '실제 판매 가격을 입력해주세요.'
      f.input :is_publish
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
      row :price do |pack|
        number_to_currency(pack.price)
      end
      row :is_publish
    end
  end

end
