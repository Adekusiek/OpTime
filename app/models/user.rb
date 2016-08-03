class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # K.K following functions are temporary deleted  :recoverable, :rememberable, :trackable,
  devise :database_authenticatable, :registerable,
         :validatable
  validates :name, presence: true
  validates :about, length:{maximum: 140}

  has_many :events
  has_many :likes
  has_many :like_events, through: :likes, source: :event
  def set_image(file)
    if !file.nil?
      file_name = file.original_filename
      File.open("public/user_images/#{file_name}", 'wb'){|f|f.write(file.read)}
      self.image = file_name
    end
  end
end
