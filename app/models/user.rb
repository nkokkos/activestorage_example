class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable,
         :confirmable, :lockable, :timeoutable, :trackable,
         :registerable

  #has_one_attached :avatar
  before_destroy    :delete_all_attachments
  has_many_attached :images, dependent: :destroy

  private
  
  def delete_all_attachments

    ActiveRecord::Base.transaction do
      self.images.each do |image|
        if !image.blob.nil?
          file = ActiveStorage::Blob.find_signed(image.signed_id)
          if !file.nil?  
            file.purge_later
          end
        end
      end
    end

  end

end
